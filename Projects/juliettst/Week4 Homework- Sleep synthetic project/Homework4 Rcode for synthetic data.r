# Load necessary libraries
library(dplyr)

# Read your synthetic data (update filename if needed)
sleep <- read.csv("/Users/juliasiodmiak/Downloads/sleep_synthetic.csv")

set.seed(42)

# Function to add rows to each subject's data by sampling existing rows and perturbing numeric columns
add_rows <- function(subj_df, n_target = 250) {
  current <- subj_df
  n_extra <- n_target - nrow(current)
  if (n_extra <= 0) return(current)
  
  new_rows <- current %>% sample_n(n_extra, replace = TRUE)
  
  # Perturb numeric columns by a random factor to create variety
  new_rows <- new_rows %>% 
    mutate(across(where(is.numeric), ~ . * runif(n(), 0.85, 1.15)))
  
  bind_rows(current, new_rows)
}

# Apply expansion to all participants
sleep_expanded <- sleep %>%
  group_by(participant) %>%
  group_modify(~ add_rows(.x, n_target = 250)) %>%
  ungroup()

setwd("/Users/juliasiodmiak/Downloads/")


# Save separate CSV files for each participant
subjects <- unique(sleep_expanded$participant)
for (sid in subjects) {
  write.csv(
    sleep_expanded %>% filter(participant == sid),
    paste0("subject_", sid, ".csv"),
    row.names = FALSE
  )
}

# This script results in one CSV file per subject with ~250 datapoints each


library(dplyr)
library(lubridate)

setwd("/Users/juliasiodmiak/Downloads/")

set.seed(123)

# Example subject IDs including original and synthetic - adjust as needed
subject_ids <- c("SUBJ1", "SUBJ2", "SUBJ3", "SUBJ4", "SUBJ5", 
                 "SUBJ6", "SUBJ7", "SUBJ8", "SUBJ9", "SUBJ10")

# Define study period: last 2 years
start_date <- as.Date(Sys.Date() - 365*2)
end_date <- as.Date(Sys.Date())

# Create BDI dataframe: every ~14 days +/-3 days jitter
bdi_list <- lapply(subject_ids, function(sid){
  base_dates <- seq.Date(start_date, end_date, by = "14 days")
  jittered_dates <- base_dates + sample(-3:3, length(base_dates), replace = TRUE)
  data.frame(
    participant = sid,
    date = jittered_dates,
    BDI_score = sample(0:63, length(jittered_dates), replace = TRUE),
    stringsAsFactors = FALSE
  )
})

bdi_data <- bind_rows(bdi_list)

# Create PANAS dataframe: daily with 70-80% coverage
panas_list <- lapply(subject_ids, function(sid){
  all_dates <- seq.Date(start_date, end_date, by = "day")
  # Randomly select ~75% of the days (with some variation)
  keep_dates <- sample(all_dates, size = floor(length(all_dates)*runif(1,0.7,0.8)))
  data.frame(
    participant = sid,
    date = sort(keep_dates),
    PANAS_positive = sample(10:50, length(keep_dates), replace = TRUE),
    PANAS_negative = sample(10:50, length(keep_dates), replace = TRUE),
    stringsAsFactors = FALSE
  )
})

panas_data <- bind_rows(panas_list)

# Convert date columns explicitly to Date class
bdi_data$date <- as.Date(bdi_data$date)
panas_data$date <- as.Date(panas_data$date)

# Preview results
head(bdi_data)
head(panas_data)

# The dataframes `bdi_data` and `panas_data` now contain:
# - BDI scores approx every 2 weeks (+-3 days jitter) per participant
# - Daily PANAS mood ratings with about 70-80% days recorded per participant

# Save as CSVs if needed:
write.csv(bdi_data, "BDI_scores.csv", row.names = FALSE)
write.csv(panas_data, "PANAS_scores.csv", row.names = FALSE)