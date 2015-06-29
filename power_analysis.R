# Power Analysis for remind.com UT Project
library(boot)

setwd("~/GitHub/remind_experiment")
data <- read.csv("data/temp/twiddle.csv")
data$id <- as.factor(data$id)
data$semester <- as.factor(data$semester)

remind_effect <- function (data, n_r, n_not) {
  # draw bootstrapped samples w/ 200 kids from my section and 300 from other sections
  remind <- (data$remind == 1)
  set_of_ids <- 1:nrow(data)
  remind_index <- set_of_ids[remind]
  boot_id_r <- sample(remind_index, n_r, replace=TRUE)
  boot_sample_r <- data[boot_id_r, ]
  
  not_remind <- (data$remind == 0)
  set_of_ids <- 1:nrow(data)
  not_remind_index <- set_of_ids[not_remind]
  boot_id_n <- sample(not_remind_index, n_r, replace=TRUE)
  boot_sample_n <- data[boot_id_n, ]
  
  boot_data <- rbind(boot_sample_r, boot_sample_n)
  
  model <- lm(UT ~ remind + semester + sl_code + id, boot_data)
  return(model$coefficients[2])
}

set.seed(1)
reps <- 10000
beta_remind <- 1:reps
for (i in 1:reps) {
    beta_remind[i] <- remind_effect(data, 300, 300)
}

summary(beta_remind)

# cannot use built-in boot function because it need indicies parameter
# beta_remind <- boot(data=data, statistic=remind_effect, R=100, 200, 300)

#boot.ci(beta_remind, 0.95, type="all")