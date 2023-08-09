
library(tidyverse)
library(corrplot)

# --- Observations ---
# Individual cells
dying_cell <- read_csv("Track_one_dying_cell.csv", show_col_types = FALSE)
viable_cell <- read_csv("Track_one_viable_cell.csv", show_col_types = FALSE)

# Group of cells
# Treated cells
df_treat <- read_csv("Tracks_Treated_Cells.csv", show_col_types = FALSE)
# Control group
df_untreat <- read_csv("Tracks_Untreated_Cells.csv", show_col_types = FALSE)


# combine and cleanup
cells <-
  list(
    dying_cell = select(dying_cell, -c(x,y)),
    viable_cell = select(viable_cell, -c(x,y)),
    df_treat = df_treat,
    df_untreat = df_untreat
  ) |>
  bind_rows(.id = "data") |>
  group_by(data,Cell.ID) |>
  mutate(
    # normalize time points to start with 0
    Time.point = Time.point - min(Time.point),
    # make cell IDs unique
    Cell.ID = str_c(data,Cell.ID)
    ) |>
  ungroup()



cells |>
  group_by(data) |>
  slice_head(n=2)

cells|>
  group_by(data) |>
  summarize( length=n(), numNAs = sum(is.na(Intensity)|is.na(Area)))

cells |>
  select(-Cell.ID, ) |>
  group_by(data) |>
  summarize( corrTimeIntensity = cor(Time.point,Intensity),
             corrTimeArea = cor(Time.point,Area))
cells |>
  select(-Cell.ID, ) |>
  group_by(data) |>
  group_walk( .f= \(table, groupName)
              corrplot(cor(table), method = "number", title = groupName))

dying_corr |>
  mutate(Intensity=scale(Intensity), Area=scale(Area)) |>
  pivot_longer(c(Intensity,Area)) |>
  ggplot(aes(x=Time.point,y=value,col=name)) +
  geom_line()

cells |>
  group_by(data,Cell.ID) |>
  summarize(maxTime = max(Time.point), .groups = "drop") |>
  ggplot()+
  geom_histogram(aes(x=maxTime))

cells |>
  group_by(data,Cell.ID) |>
  filter( max(Time.point) < 100) |>
  filter( Time.point < 1000) |>
  filter(Time.point >= max(Time.point)*0) |>
  filter(Time.point <= max(Time.point)*0.8) |>
  mutate(Area = scale(Area)) |>
  mutate(Time.point = Time.point / max(Time.point)) |>
  ungroup() |>
  ggplot(aes(x=Time.point, y=Area, col=data
             # , group=Cell.ID
             ))+
  geom_smooth(se=F,
              # method="lm"
              method="loess"
  )
  # guides(col=F)


cells |>
  group_by(data, Cell.ID) |>
  summarize( die = max(Area)*0.4, viable = min(Area) > die) |>
  summarize( mean(viable), sd(viable), numViable = sum(viable), numDying = n()-numViable )

