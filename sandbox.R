library(data.table)
library(tidyverse)
library(VGAM)
library(evmix)
library(ercv)
library(MASS)

data <- fread("16DATA/A06_bitmnp.txt")
sample <- data$V1
hist(sample, breaks = "FD")
meplot(sample)


# ECCDF plot
plot(sample, 1 - ecdf(sample)(sample), log = "y")
sample_tail <- tail(sort(sample), 100)
plot(sample_tail, 1 - ecdf(sample_tail)(sample_tail), log = "y")
hist(sample_tail, breaks = "FD")
hillplot(sample)
cvplot(sample)
threshold <- thrselect(sample, threshold = 660000)$solution$threshold
pars <- fitpot(sample, threshold = threshold)

qpot(1-10^-3, pars)/quantile(sample, 1-10^-3)



p <- runif(10000000)
t <- ifelse(p > 0.01, 1, 0)
a <- data.frame(values = rle(t)$values, length = rle(t)$lengths) %>% 
  filter(values == 1)
hist(a$length, probability = T)

