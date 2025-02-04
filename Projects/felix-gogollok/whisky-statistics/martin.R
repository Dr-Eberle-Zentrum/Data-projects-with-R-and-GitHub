

library(tidyvere)
# set working directory to source file location
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


data <-
  read_csv2("Whisky.csv") |>
  rename_with(~str_remove(., ":$"), everything()) |>
  select(-c( `Buch vom`, Adresse, Telefon, Website, `E-Mail`))


# # remotes::install_github("ricardo-bion/ggradar")
# library(ggradar)
#
# # spiderweb plot of the number of whiskies with Punkte>=80 per Region
# data |>
#   filter(Punkte >= 80) |>
#   count(Region) |>
#   pivot_wider(names_from = Region, values_from = n, values_fill = 0) |>
#   ggradar(
#     # font.radar = "roboto",
#     # grid.label.size = 13,  # Affects the grid annotations (0%, 50%, etc.)
#     # axis.label.size = 8.5, # Afftects the names of the variables
#     # group.point.size = 3   # Simply the size of the point
#   )


library(fmsb) # radarchart() function

data |>
  # compute the number of whiskies and their entries with Punkte>=80 per Region
  group_by(Region) |>
  # !!! column order matters for input row order of radarchart !!!
  summarize( max = n(), # number of whiskies
             min = 0,
             count = sum(Punkte >= 80,na.rm = T) # number of whiskies with Punkte>=80
             ) |>
  drop_na() |>
  # translate table
  pivot_longer(!Region, names_to="category") |>
  pivot_wider(names_from = Region) |>
  # drop category ids for plotting
  select(-category) |>
  # spider web chart
  radarchart(
    axistype = 1,
    title = "Fraction of whiskies rated 80 or higher per Region"
        )


