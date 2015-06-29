# Power Analysis for remind.com UT Project

setwd("~/GitHub/remind_experiment")
data <- read.csv("data/temp/twiddle.csv")

# draw bootstrapped samples w/ 200 kids from my section and 300 from other sections
n_r <- 200
remind <- (data$remind == 1)
set_of_ids <- 1:nrow(data)
remind_index <- set_of_ids[remind]
boot_id_r <- sample(remind_index, n_r, replace=TRUE)
boot_sample_r <- data[boot_id_r, ]

n_not <- 300
not_remind <- (data$remind == 0)
set_of_ids <- 1:nrow(data)
not_remind_index <- set_of_ids[not_remind]
boot_id_n <- sample(not_remind_index, n_r, replace=TRUE)
boot_sample_n <- data[boot_id_n, ]

boot_data <- rbind(boot_sample_r, boot_sample_n)