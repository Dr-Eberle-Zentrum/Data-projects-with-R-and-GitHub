
data |>
  select(common_name, Loss_med, popest) |>
  mutate(
    Loss_med = round(-(Loss_med/1000000), 1),
    rank = rank(Loss_med, ties.method = "first"),
    toptail = !between(rank, 9, n()-8),
    name = ifelse(toptail, common_name, "others")
  ) |>
  group_by(name) |>
  summarize(
    Loss_med_mean = mean(Loss_med),
    popest_mean = mean(popest)
  ) |>
  arrange(Loss_med_mean) |>
  view()
