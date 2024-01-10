

drivers <- read.csv("C:/Uni Tuebingen/Master/Wintersemester 23 24/R2/01 Data-projects-with-R-and-GitHub/Projects/JanaKimmich/archive/drivers.csv", na.strings = "\\N")
results <- read.csv("C:/Uni Tuebingen/Master/Wintersemester 23 24/R2/01 Data-projects-with-R-and-GitHub/Projects/JanaKimmich/archive/results.csv", na.strings = "\\N")
constructors <- read.csv("C:/Uni Tuebingen/Master/Wintersemester 23 24/R2/01 Data-projects-with-R-and-GitHub/Projects/JanaKimmich/archive/constructors.csv", na.strings = "\\N")
races <- read.csv("C:/Uni Tuebingen/Master/Wintersemester 23 24/R2/01 Data-projects-with-R-and-GitHub/Projects/JanaKimmich/archive/races.csv", na.strings = "\\N")


#install.packages("plotly")

# drivername, wins, year, nationality, constructor

df <- results |> 
  left_join(drivers, by = "driverId") |> 
  left_join(races, by = "raceId") |> 
  left_join(constructors, by = "constructorId") |> 
  mutate(name = paste(forename, surname, sep = " ")) |>
  filter(year >= 2000) |> 
  group_by(name, year) |> 
  mutate(wins = sum(position == 1, na.rm = T)) |> 
  ungroup() |> 
  select("name", "year", "wins", "nationality.x", "url.x", "name.y") |> 
  distinct(name, year, .keep_all = T) |> 
  group_by(name) |> 
  mutate(totalwins = sum(wins, na.rm = T)) 











