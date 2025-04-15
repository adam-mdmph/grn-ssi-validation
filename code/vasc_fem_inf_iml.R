install.packages("reticulate")
library(reticulate)
library(tidyverse)
library(finalfit)


# Create project specific python envornment
my_env <- "vasc_fem_inf"
conda_create(my_env)

# Go into global options and select the new python environment, which will restart R

library(reticulate)

# Confirm that project specific environment is created
conda_list()

# Select project specific environment and install relevant packages
use_condaenv(my_env)

py_install("pandas",envname = my_env)
py_install("numpy",envname = my_env)
py_install("seaborn",envname = my_env)
py_install("scikit-learn",envname = my_env)
py_install("matplotlib",envname = my_env)
py_install("pacmap",envname = my_env)

# Load the PacMAP package
pacmap <- reticulate::import("pacmap")

# Create new variables

puf_pad_0 <- puf_pad %>%
  mutate(grninf = supinfec | wndinfd | orgspcssi)

# Trim data set to Remove missing data, and columns with non-numeric values

missing_percent <- colSums(is.na(puf_pad_0)) / nrow(puf_pad_0) * 100
selected_variables <- names(missing_percent[missing_percent < 10])
puf_pad_no_na <- puf_pad[, selected_variables, drop = FALSE]
puf_pad_no_na <- na.omit(puf_pad_no_na)
puf_pad_no_na <- subset(puf_pad_no_na, select = -c(cpt,proc))


# Create descriptive statistics

selected_variables
explanatory <- c(selected_variables[3:27], selected_variables[29:47], selected_variables[50:101])
dependent <- "grninf"
puf_pad_no_na %>%
  summary_factorlist(dependent, explanatory, p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, align = c("l", "l", "r", "r", "r"))

# Load data for PacMAP

data_vector <- unlist (puf_pad_no_na)
data_matrix <- matrix(data_vector, ncol = length(puf_pad_no_na))

# Convert binary values to 1 or 0

data_matrix[data_matrix == "TRUE"] <- "1"
data_matrix[data_matrix == "FALSE"] <- "0"

# Run dimensionality reduction

reducer <- pacmap$PaCMAP()
embedding <- reducer$fit_transform(data_matrix)

# Visualize the result
library(ggplot2)
visualizeMatrixScatterplot <- function(matrix, dotSize = 1) {
  # Extract the x and y coordinates from the matrix
  x <- matrix[, 1]
  y <- matrix[, 2]
  
  # Create a scatterplot with custom dot size
  plot(x, y, pch = 19, col = "blue", cex = dotSize, 
       main = "Scatterplot of 2D Matrix", xlab = "X-axis", ylab = "Y-axis")
}

visualizeMatrixScatterplot(embedding, 0.5)
