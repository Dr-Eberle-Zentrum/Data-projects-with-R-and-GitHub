# This is my solution for Yue’s project.

## Import Data

    library(tidyverse)
data <- read.csv("https://data.cityofnewyork.us/api/views/c3uy-2p5r/rows.csv?accessType=DOWNLOAD")
# Data manipulation for first graph.
data_task1 <- data |>
  select(Name, Data.Value) |>
  group_by(Name) |>
  summarise(Mean_value = mean(Data.Value, na.rm = TRUE))
# visualization for first graph
ggplot(data_task1, aes(x = Name, y = Mean_value))+
  geom_bar(stat = "identity", show.legend = TRUE, fill = "blue")+
  labs(
    title = "Average Valus of pollutants",
    x = "Name",
    y = "Mean_Value"
  )+
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size = 5)
  )

## Data Cleaning

    #cleaning the data
    dt_clean <- dt[1:(nrow(dt)-3), ] %>% 
      #calculate the missing value
      rowwise() %>%
      mutate(
        na_count = sum(is.na(c(Total, Male, Female))),
        Total = if_else(na_count > 0 & na_count < 3 & is.na(Total), Male + Female, Total),
        Male = if_else(na_count > 0 & na_count < 3 & is.na(Male), Total - Female, Male),
        Female = if_else(na_count > 0 & na_count < 3 & is.na(Female), Total - Male, Female)
      ) %>%
      ungroup() %>% 
      select(-na_count) %>%
      mutate(Hierarchy = (str_count(University, ("\\G ")) / 2),
             University = str_replace_all(University, "\\G ", ""))  #Calculate the hierarchy, Remove the spaces

    #create Unis_Total:I'm not sure I understand the task correctly. Is it asking for this total of three universities to be added up like I did?
      dt_plot <- dt_clean %>% 
        group_by(Semester) %>%
        summarise(
          University = "Unis_Total",
          Total = sum(Total, na.rm = TRUE),
          Female = sum(Female, na.rm = TRUE),
          Male = sum(Male, na.rm = TRUE),
          Type = "Total",
          .groups = "drop"
        ) %>%
      ungroup() %>%
      bind_rows(
        dt_clean %>% 
          filter(University %in% c("Universität Bielefeld", "Universität Bochum", "Universität Bonn")) %>% 
          mutate(Type = "Uni")
      )

## Ploting

    last_points <- dt_plot %>%
      group_by(University) %>%
      filter(Semester == max(Semester))

    dt_plot %>% 
      mutate(Semester = as.factor(Semester)) %>% 
      ggplot(aes(x = Semester, y = Total, group = University, color = Type)) +
      geom_point() +
      geom_line() +
      geom_label(data = last_points, aes(label = University), nudge_x = 1.3, nudge_y = 1200, color = "black")

![](Selena-qian_files/figure-markdown_strict/plot-1.png)

    #Because the Total value after summing is too large, the lines of the other three universities do not show up well. Do I need to adjust the scale of the y-axis?

## Animation

    #Since this section causes R to not be able to knit out the markdown file, I've turned this section completely into a comment. 
    #This code actually runs and generates gifs and html. But tbh I haven't gone very deep into the gganimate package, especially in the export to html part, I tried a lot of methods provided by chatgpt, including using htmltools::save_html(), directly using anim_save() and html_renderer(). htmlwidgets::as_widget() and so on, but all of them failed. The code below seems to work. It is provided by chatgpt.

    #The error message by kniting is as follows:
    ########Error: Failed to knit md file.########
    # Quitting from lines 77-117 [animation] (Selena-qian.Rmd)  
    # Error in `device()`:  
    # ! Unable to start png() device  
    # Backtrace:  
    #  1. gganimate::animate(...)  
    #  2. gganimate:::animate.gganim(...)  
    #  4. gganimate:::draw_frames(...)  
    #  6. grDevices (local) device(files[i], width = 800, height = 600, units = "in", res = 96)  
    # Execution halted


    # knitr::opts_chunk$set(dev = "png", dev.args = list(type = "cairo"))
    # options(bitmapType = "cairo")
    # 
    # library(gganimate)
    # library(htmlwidgets)
    # library(htmltools)
    # 
    # dt_year <- dt_plot %>%
    #   mutate(Year = as.numeric(str_extract(Semester, "\\d{4}")))
    # 
    # last_points <- dt_year %>%
    #   group_by(University) %>%
    #   filter(Semester == max(Semester))
    # 
    # animation <- ggplot(dt_year, aes(x = as.integer(Year), y = Total, group = University, color = Type)) +
    #   geom_point() +
    #   geom_line() +
    #   geom_label(data = last_points, aes(label = University), nudge_x = 1.3, nudge_y = 1200, color = "black") +
    #   theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
    #   scale_x_continuous(
    #   breaks = seq(min(dt_year$Year), max(dt_year$Year), by = 1),
    #   labels = dt_year$Semester %>% unique()) +
    #   transition_reveal(along = Year) +  # Transition along the Semester
    #   ease_aes("linear")
    # 
    # 
    # 
    # gif_file <- "animation.gif"
    # animate(animation, renderer = gifski_renderer(gif_file), width = 800, height = 600)
    # 
    # html_content <- tags$html(
    #   tags$body(
    #     tags$h2("Animation"),
    #     tags$img(src = gif_file)
    #   )
    # )
    # 
    # save_html(html_content, file = "animation.html")
