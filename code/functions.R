
table_2outcome <- function(dataset, exp, dep_1, dep_2) {
  df <- dataset
  
  df_exp <- df[, c(exp, dep_1, dep_2)]
  
  df_exp[] <- lapply(df_exp, function(x) {
    if (is.logical(x)) {
      factor(x, levels = c(TRUE, FALSE), labels = c("Yes", "No"))
    } else {
      x
    }
  })
  
  t2_1 <- df_exp %>%
    summary_factorlist(dep_1, exp, p=TRUE,
                       add_col_totals = TRUE,
                       include_col_totals_percent = FALSE,
                       col_totals_rowname = "",
                       col_totals_prefix = "N=") %>%
    filter(levels != "No") %>%
    select(1, 3, 5) %>%
    rename(dep_1 = "Yes")
  
  t2_2 <- df_exp %>%
    summary_factorlist(dep_2, exp, p=TRUE,
                       add_col_totals = TRUE,
                       include_col_totals_percent = FALSE,
                       col_totals_rowname = "",
                       col_totals_prefix = "N=",
                       total_col = TRUE) %>%
    filter(levels != "No") %>%
    select(3, 6, 5) %>%
    rename(dep_2 = "Yes")
  
  t2 <- bind_cols(t2_1, t2_2)
  
  knitr::kable(t2, align = c("l", "l", "c", "c", "c", "c", "r"))
}



plot_auc <- function(model_info, dataset, outcome_var, title) {
  
  #model_info <- models_disc
  #dataset <- vqi_pad_grninf_preop
  #outcome_var <- "grninf"
  
  predictors <- model_info$Prediction

  # Initialize an empty data frame
  auc_data <- data.frame(
    model = character(),
    auc = numeric(),
    lower_ci = numeric(),
    upper_ci = numeric(),
    stringsAsFactors = FALSE
  )
  
  # Loop through predictors
  for (pred in predictors) {
    roc <- roc_curve(dataset, outcome_var, pred, event_level = "second")
    auc <- roc_auc(dataset, outcome_var, pred, event_level = "second")
    roc_obj <- roc(response = dataset[[outcome_var]], predictor = dataset[[pred]])
    ci <- ci.auc(roc_obj)
  
    # Append to data frame
    auc_data <- rbind(auc_data, data.frame(
      model = pred,
      auc = round(auc$.estimate, 3),
      lower_ci = round(ci[1], 3),
      upper_ci = round(ci[3], 3)
    ))
  }

  # Sort by AUC for better visualization
  auc_data <- auc_data[order(auc_data$auc), ]

  auc_data <- auc_data %>%
    left_join(model_info, by = c("model" = "Prediction")) %>%
    select(Labels, model, auc, lower_ci, upper_ci)
  
  print(auc_data)

  # Forest plot
  ggplot(auc_data, aes(x = auc, y = reorder(Labels, auc))) +
    geom_point(size = 1, color = "black") +
    geom_errorbarh(aes(xmin = lower_ci, xmax = upper_ci), height = 0.2, color = "gray30") +
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "gray") +
    xlim(0.5, 1) +
    theme_bw(base_size = 12) +
    labs(x = "AUC (95% CI)", y = "", title = title) +
    theme(panel.grid.major.y = element_blank())
}

#Function for Calibration Plots

plot_calibration <- function(model_info, dataset, outcome_var, title) {
  # Dynamically build combined_cal
  combined_cal <- do.call(rbind, lapply(1:nrow(model_info), function(i) {
    model_label <- model_info$Labels[i]
    pred_col <- model_info$Prediction[i]
    
    data.frame(
      model = model_label,
      grninf = dataset[[outcome_var]],
      .pred_TRUE = dataset[[pred_col]]
    )
  }))
  
  # Filter predictions within range
  min_pred <- min(combined_cal$.pred_TRUE, na.rm = TRUE)
  max_pred <- max(combined_cal$.pred_TRUE, na.rm = TRUE)
  
  filtered_cal <- combined_cal %>%
    filter(.pred_TRUE >= min_pred & .pred_TRUE <= max_pred)
  
  # Update default line thickness
  update_geom_defaults("line", list(size = 1.5))
  
  # Create calibration plot
  filtered_cal %>%
    cal_plot_windowed(grninf, .pred_TRUE, .by = model, event_level = "second", step_size = 0.025, include_points = FALSE) +
    facet_wrap(~model) +
    theme_bw(base_size = 12) +
    scale_color_manual(values = rep("black", length(unique(filtered_cal$model)))) +
    scale_fill_manual(values = rep("gray30", length(unique(filtered_cal$model)))) +
    theme(legend.position = "none") +
    labs(title = title)
}


# Create a function to compare brier scores across different models in the same cohort
plot_brier <- function(data, model_info, outcome) {
  
  # Initialize empty results data frame
  brier_data <- tibble(model = character(),
                       brier_score = numeric(),
                       ci_lower = numeric(),
                       ci_upper = numeric())
  
  predictors <- model_info$Prediction
  
  for (pred in predictors) {
    
    # Remove rows with missing prediction values
    temp_data <- tibble(
      pred = data[[pred]],
      obs = as.numeric(data[[outcome]]) - 1
    ) %>%
      filter(!is.na(pred))
    
    # Compute Brier score
    brier <- mean((temp_data$pred - temp_data$obs)^2)
    
    # Bootstrap safely
    boot_res <- boot(data = temp_data, statistic = function(d, i) {
      mean((d$pred[i] - d$obs[i])^2)
    }, R = 500, parallel = "snow")
    
    # Try CI calculation
    ci <- tryCatch({
      boot.ci(boot_res, type = "perc")$percent[4:5]
    }, error = function(e) c(NA, NA))
    
    # Append to results
    brier_data <- bind_rows(brier_data, tibble(model = pred,
                                               brier_score = brier,
                                               ci_lower = ci[1],
                                               ci_upper = ci[2]))
  }
  
  brier_data <- brier_data %>%
    left_join(model_info, by = c("model" = "Prediction")) %>%
    select(Labels, model, brier_score, ci_lower, ci_upper)
  
  ggplot(brier_data, aes(x = brier_score, y = reorder(Labels, 1/brier_score))) +
    geom_point(size = 1, color = "black") +
    geom_errorbarh(aes(xmin = ci_lower, xmax = ci_upper), height = 0.2, color = "gray30") +
    geom_vline(xintercept = 0, linetype = "dashed", color = "gray") +
    xlim(0, 0.25) +
    theme_bw(base_size = 12) +
    labs(x = "Brier Scores (95% CI)", y = "", title = "Forest Plot of Brier Scores") +
    theme(panel.grid.major.y = element_blank())
}

normalized_logloss <- function(pred, actual) {
  eps <- 1e-15
  pred <- pmin(pmax(pred, eps), 1 - eps)
  
  # Standard LogLoss
  ll <- -mean(actual * log(pred) + (1 - actual) * log(1 - pred))
  
  # Entropy of the outcome distribution (maximum possible LogLoss for this cohort)
  p <- mean(actual)
  entropy <- - (p * log(p + eps) + (1 - p) * log(1 - p + eps))
  
  # Normalize LogLoss by entropy
  norm_ll <- ll / entropy
  return(norm_ll)
}

# Bootstrap function
boot_logloss <- function(data, indices, model_name) {
  d <- data[indices, ]
  pred <- d[[model_name]]
  actual <- d$outcome_num
  normalized_logloss(pred, actual)
}


calc_ece <- function(pred, truth, n_bins = 10) {
  if (length(pred) != length(truth)) {
    stop("Length of predicted probabilities and true labels must be the same.")
  }
  
  # Create bins
  bins <- cut(pred, breaks = seq(0, 1, length.out = n_bins + 1), include.lowest = TRUE)
  
  # Create data frame
  df <- data.frame(pred = pred, truth = truth, bins = bins)
  
  # Calculate ECE
  library(dplyr)
  ece <- df %>%
    group_by(bins) %>%
    summarise(
      bin_accuracy = mean(truth),
      bin_confidence = mean(pred),
      bin_size = n(),
      .groups = "drop"
    ) %>%
    mutate(abs_diff = abs(bin_accuracy - bin_confidence)) %>%
    summarise(ece = sum(abs_diff * bin_size) / sum(bin_size)) %>%
    pull(ece)
  
  return(ece)
}

# Bootstrap function
boot_ece <- function(data, indices, model_name) {
  d <- data[indices, ]
  pred <- d[[model_name]]
  actual <- d$outcome_num
  calc_ece(pred, actual)
}
