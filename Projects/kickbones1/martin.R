
library(tidyverse)


# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

data <-
  # read in data
  read_csv("kaggle_dataset.csv") |>
  rename( model = `Device Model`) |>
  # Change the App Usage Time from min/day to hours/day
  mutate(usageTime = `App Usage Time (min/day)` / 60) |>
  # For each Device Model compute the median App Usage Time
  group_by(model) |>
  mutate(medianUsageTime = median(usageTime)) |>
  # Sum up the amount of users for each Device Model
  mutate(users = n()) |>
  ungroup() |>
  # categorize user age in groups 20-29, 30-39, 40-49 and 50-59
  mutate(ageGroup = case_when(
    Age < 20 | Age > 59 ~ "other",
    Age < 30 ~ "20-29",
    Age < 40 ~ "30-39",
    Age < 50 ~ "40-49",
    Age < 60 ~ "50-59"
  )) |>
  mutate(model = factor(model) |> fct_reorder(-medianUsageTime, first))

data |>
  mutate(modelGender = str_c(model," (",str_sub(Gender,1,1),")") |> factor()) |>
  ggplot(aes(x=modelGender, y=usageTime, fill=Gender)) +
  geom_violin(position="dodge", alpha=0.4, draw_quantiles = 0.5) +
  # vertical lines every 2 units starting at 2.5
  geom_vline(xintercept = seq(2.5, 9, by=2), linetype="dashed") +
  # add model information
  annotate("text", label =  data %>% distinct(model,users) |>
             arrange(model) |>
             mutate(t = str_c(model,"\nn=",users)) |> pull(t),
           x = seq(1.5, 10, by=2), y = 0, size=3) +
  annotate("text",
           label= data |> distinct(model, medianUsageTime) |>
             arrange(model) |> pull(medianUsageTime) |>
             round(2),
           x = seq(1.5, 10, by=2), y=max(data$usageTime),size=3) +
  # disable x labels and ticks
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        plot.subtitle = ggtext::element_textbox_simple(size=7)
        ) +
  geom_jitter(aes(col=ageGroup), width=0.2) +
  labs(x=NULL,
       y="App Usage Time (hours/day)",
       col="Age",
       title="Mobile Device Usage for different models",
       subtitle="Shown is the median app usage time of different moile devices with a differntiation between male and female users and their ages")

