# Convert binary values to 1 or 0 - CHANGES ALL FACTORS TO NA - NEED TO TROUBLESHOOT

pacmap_data_norm[pacmap_data_norm == "TRUE"] <- "1"
pacmap_data_norm[pacmap_data_norm == "FALSE"] <- "0"

# Convert multilevel factors to dummy variables

pacmap_data_norm <- droplevels(pacmap_data_norm)
is_factor <- sapply(pacmap_data_norm, class) == "factor"
m_vars <- names(pacmap_data_norm)[is_factor]

for (m_var in m_vars) {
  
  m_var_dum <- model.matrix(as.formula(paste0("~", m_var, " - 1")), data = pacmap_data_norm)
  pacmap_data_norm <- cbind(pacmap_data_norm, m_var_dum)
  pacmap_data_norm[[m_var]] <- NULL
  
  rm(m_var_dum)
}

# Normalize continuous variables with max-min

is_numeric <- sapply(pacmap_data_norm, class) == "numeric"
n_vars <- names(pacmap_data_norm)[is_numeric]


normalize <- function(x, na.rm = TRUE) {
  return((x- min(x)) /(max(x)-min(x)))
}

for (n_var in n_vars) {
  
  pacmap_data_norm[[n_var]] <- normalize(pacmap_data_norm[[n_var]])

}

pacmap_data_norm <- pacmap_data_norm %>% select(outcome, everything())

# save rownames
rownames_before <- rownames(pacmap_data_norm)

pacmap_data_norm <- as.data.frame(lapply(pacmap_data_norm, function(x) as.numeric(as.character(x))))

# recover rownames after transformation
rownames(pacmap_data_norm) <- rownames_before
