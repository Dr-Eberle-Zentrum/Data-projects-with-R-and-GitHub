

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
  filter(year >= 2000 & year <= 2020) |> 
  group_by(name, year) |> 
  mutate(wins = sum(position == 1, na.rm = T)) |> 
  ungroup() |> 
  select("name", "year", "wins", "nationality.x", "url.x", "name.y") |> 
  distinct(name, year, .keep_all = T) |> 
  group_by(name) |> 
  mutate(totalwins = sum(wins, na.rm = T)) |>  
  ungroup() |> 
  mutate(order = dense_rank(desc(totalwins))) |> 
  rename(nationality = nationality.x, url = url.x, constructor = name.y) |> 
  arrange(order) |> 
  filter(order <= 9)


### Plotten --------------------------------------------------------------------

library(plotly)

# table(df$constructor[df$wins > 1])
# Brawn Ferrari McLaren Mercedes Red Bull Renault
colors <- c("Brawn" = "brown", 
            "Ferrari" = "red", 
            "McLaren" = "green", 
            "Mercedes" = "grey",
            "Red Bull" = "blue",
            "Renault" = "orange",
            )

hover_text <- with(df, paste(name, ": ", wins, " Wins, Constructor: ", constructor))

fig <- plot_ly(df, x = ~wins, y = ~name, type = "bar", color = ~constructor, 
               colors = colors, text = hover_text) |>
  layout(title = "Formula 1 Drivers Top 10", yaxis = list(title = 'Count'), barmode = 'stack')

fig

###

test <- data.frame(name = c("Lewis", "Lewis", "Lewis", "James", "James"),
                   year = c(2000, 2001, 2002, 2001, 2002),
                   wins = c(3, 2, 3, 1, 2),
                   constructor = c("ja", "jo", "jo", "ne", "no"),
                   links = c("https://de.wikipedia.org/", "https://de.wikipedia.org/", "https://de.wikipedia.org/", "youtube.com", "youtube.com")
)

colors <- c("ja" = "red", "jo" = "blue", "ne" = "green", "no" = "orange")

hover_text <- with(test, paste(name, ": ", wins, " Wins, Constructor: ", constructor))

fig <- plot_ly(test, x = ~wins, y = ~name, type = "bar", color = ~constructor, 
               colors = colors, text = hover_text) |>
  layout(title = "JUHU", yaxis = list(title = 'Count'), barmode = 'stack')

fig



### TESTS ----------------------------------------------------------------------

test <- data.frame(name = c("Lewis", "Lewis", "Lewis", "James", "James"),
                   year = c(2000, 2001, 2002, 2001, 2002),
                   wins = c(3, 2, 3, 1, 2),
                   constructor = c("ja", "jo", "jo", "ne", "no")
                   )

library(plotly)
colors <- c("ja" = "red", "jo" = "blue", "ne" = "green", "no" = "orange")
fig <- plot_ly(test, x = ~wins, y = ~name, type = "bar", color = ~constructor, colors = colors)
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')
fig
rm(fig)

###




###

test <- data.frame(name = c("Lewis", "Lewis", "Lewis", "James", "James"),
                   year = c(2000, 2001, 2002, 2001, 2002),
                   wins = c(3, 2, 3, 1, 2),
                   constructor = c("ja", "jo", "jo", "ne", "no")
)

library(plotly)

# Definiere Farben basierend auf der Spalte "constructor"
colors <- c("ja" = "red", "jo" = "blue", "ne" = "green", "no" = "orange")

# Erstelle benutzerdefinierten Text für das Hover-Verhalten
hover_text <- with(test, paste(name, ": ", wins, " Wins, Constructor: ", constructor))

fig <- plot_ly(test, x = ~wins, y = ~name, type = "bar", color = ~constructor, colors = colors, text = hover_text)
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack', font = list(family = "Open Sans"))

fig

###

library(tidyverse)

test <- data.frame(name = c("Lewis", "Lewis", "Lewis", "James", "James", "Michael", "Michael", "Michael", "Sebastian", "Sebastian"),
                   year = c(2000, 2001, 2002, 2001, 2002, 2000, 2001, 2002, 2001, 2002),
                   wins = c(3, 2, 3, 1, 2, 4, 5, 4, 2, 3),
                   constructor = c("ja", "jo", "jo", "ne", "no", "ja", "jo", "jo", "ne", "no"),
                   links = c("https://de.wikipedia.org/", "https://de.wikipedia.org/", "https://de.wikipedia.org/", "youtube.com", "youtube.com", "https://de.wikipedia.org/", "https://de.wikipedia.org/", "https://de.wikipedia.org/", "youtube.com", "youtube.com")
)

result <- test %>%
  group_by(name) %>%
  arrange(desc(wins)) %>%
  top_n(3, wins)

# Anzeigen des Ergebnisses
print(result)
?max()




