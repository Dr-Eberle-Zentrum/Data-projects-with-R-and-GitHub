    #1
    data %>% 
      ggplot(aes(x = Cpu, y = Price)) +
      geom_point(alpha = 0.25) +
      geom_density2d(alpha = 0.75)

![](SamiPhoenix_files/figure-markdown_strict/Visualisation-1.png)

    #2
    data %>% 
      ggplot(aes(x = Company, y = Price)) +
      geom_boxplot()

![](SamiPhoenix_files/figure-markdown_strict/Visualisation-2.png)
