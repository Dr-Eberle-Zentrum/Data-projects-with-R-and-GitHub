
    library (tidyverse)
    library (ggplot2)


    df <- readr::read_csv("/Users/huangziyi/Mammal-comeback-in-Europe-data-OWID-download .csv", show_col_types = FALSE)

    df <-lapply(df, gsub, pattern="%", replaceme="")
    df<- as_tibble(df)
    colnames(df)<- c("common_name", "species_name", "number_populations", "start_year", "end_year", "average_change")
    df[6]<-as.numeric(unlist(df[6]))
    df$common_name=with(df, reorder(common_name, average_change))
    br <-10^(0:4)



    #Plot
    plot<- ggplot(df, aes (x=df$common_name, y=df$average_change)) + 
      geom_point(color="#4682B4", size=2, alpha=1) +
      geom_segment(aes(x=common_name, xend=common_name, y=0, yend=average_change),
                   color="#4a4e69",
                   arrow = arrow(length=unit(0.02, "npc"), type = "closed"),
                   lineend = "round") +
      scale_y_continuous(trans="log10",limits = c(1, 100000),
                        # labels = str_c(br)(comma_format(big.mark = ".", decimal.mark = ","), "%"), breaks = br) 
                        )+
      geom_text (aes(label=df$average_change), nudge_y = 0.3) +
      labs(title = "Wildlife is making a comeback in Europe", 
           y = "Average relative change in the size of populations ",
           x = "") +
      theme_light() +
      coord_flip() +
      annotate ("text", x="Brown bear", y=1000,
                  label="Between 1960 and 2016, populations \n of brown bears increased by an average of 44%",
                  color="#4a4e69", hjust=0, size=3) +
      geom_text (
        aes(label=paste(df$start_year, "to", df$end_year)),
        y=1, hjust=1.5, check_overlap = TRUE, size=2.5
      )+
      geom_curve(
        aes(x=4, y=950, xend=4, yend=200),
        arrow=arrow(length= unit(0.03,"npc"),
        type="closed"),color="#4a4e69", size=1, angle = 90)


    print(plot)

    library (tidyverse)
    library (ggplot2)


    df <- readr::read_csv("/Users/huangziyi/Mammal-comeback-in-Europe-data-OWID-download .csv", show_col_types = FALSE)

    df <-lapply(df, gsub, pattern="%", replaceme="")
    df<- as_tibble(df)
    colnames(df)<- c("common_name", "species_name", "number_populations", "start_year", "end_year", "average_change")
    df[6]<-as.numeric(unlist(df[6]))
    df$common_name=with(df, reorder(common_name, average_change))
    br <-10^(0:4)



    #Plot
    plot<- ggplot(df, aes (x=df$common_name, y=df$average_change)) + 
      geom_point(color="#4682B4", size=2, alpha=1) +
      geom_segment(aes(x=common_name, xend=common_name, y=0, yend=average_change),
                   color="#4a4e69",
                   arrow = arrow(length=unit(0.02, "npc"), type = "closed"),
                   lineend = "round") +
      scale_y_continuous(trans="log10",limits = c(1, 100000),
                        # labels = str_c(br)(comma_format(big.mark = ".", decimal.mark = ","), "%"), breaks = br) 
                        )+
      geom_text (aes(label=df$average_change), nudge_y = 0.3) +
      labs(title = "Wildlife is making a comeback in Europe", 
           y = "Average relative change in the size of populations ",
           x = "") +
      theme_light() +
      coord_flip() +
      annotate ("text", x="Brown bear", y=1000,
                  label="Between 1960 and 2016, populations \n of brown bears increased by an average of 44%",
                  color="#4a4e69", hjust=0, size=3) +
      geom_text (
        aes(label=paste(df$start_year, "to", df$end_year)),
        y=1, hjust=1.5, check_overlap = TRUE, size=2.5
      )+
      library (tidyverse)
    library (ggplot2)


    df <- readr::read_csv("/Users/huangziyi/Mammal-comeback-in-Europe-data-OWID-download .csv", show_col_types = FALSE)

    df <-lapply(df, gsub, pattern="%", replaceme="")
    df<- as_tibble(df)
    colnames(df)<- c("common_name", "species_name", "number_populations", "start_year", "end_year", "average_change")
    df[6]<-as.numeric(unlist(df[6]))
    df$common_name=with(df, reorder(common_name, average_change))
    br <-10^(0:4)



    #Plot
    plot<- ggplot(df, aes (x=df$common_name, y=df$average_change)) + 
      geom_point(color="#4682B4", size=2, alpha=1) +
      geom_segment(aes(x=common_name, xend=common_name, y=0, yend=average_change),
                   color="#4a4e69",
                   arrow = arrow(length=unit(0.02, "npc"), type = "closed"),
                   lineend = "round") +
      scale_y_continuous(trans="log10",limits = c(1, 100000),
                        # labels = str_c(br)(comma_format(big.mark = ".", decimal.mark = ","), "%"), breaks = br) 
                        )+
      geom_text (aes(label=df$average_change), nudge_y = 0.3) +
      labs(title = "Wildlife is making a comeback in Europe", 
           y = "Average relative change in the size of populations ",
           x = "") +
      theme_light() +
      coord_flip() +
      annotate ("text", x="Brown bear", y=1000,
                  label="Between 1960 and 2016, populations \n of brown bears increased by an average of 44%",
                  color="#4a4e69", hjust=0, size=3) +
      geom_text (
        aes(label=paste(df$start_year, "to", df$end_year)),
        y=1, hjust=1.5, check_overlap = TRUE, size=2.5
      )+
      geom_curve(
        aes(x=4, y=950, xend=4, yend=200),
        arrow=arrow(length= unit(0.03,"npc"),
        type="closed"),color="#4a4e69", size=1, angle = 90)


    print(plot)


    print(plot)
