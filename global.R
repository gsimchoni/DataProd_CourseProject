# It is convenient to have these few variables known to both ui.R and server.R, so they're in global.R

# The top R packages, sorted from most downloaded to least
packages <- c("Rcpp", "ggplot2", "stringr", "plyr", "digest", "reshape2", "colorspace", "RColorBrewer", "manipulate", "scales")

# New random order
packages_order <- sample(1:10)
packages_shuffled <- packages[packages_order]

# Start the clock!
start.time <- Sys.time()
