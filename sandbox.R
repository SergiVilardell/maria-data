library(data.table)
library(tidyverse)

data <- fread("16DATA/16DATA/A01_a2time.txt")
sample <- data$V1
hist(sample, breaks = "FD")
