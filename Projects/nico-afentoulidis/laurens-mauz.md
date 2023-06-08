## R Markdown

The map for the mean TV usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean TV usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/TV%20Map-1.png)

The map for the mean TV via Internet usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean TV via Internet usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/TV%20via%20Internet%20Map-1.png)

The map for the mean Radio usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean Radio usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/Radio%20Map-1.png)

The map for the mean Podcast usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean Podcast usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/Podcast%20Map-1.png)

The map for the mean Internet usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean internet usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/Internet%20Map-1.png)

The map for the mean Social Media usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean Social Media usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/Social%20Media%20Map-1.png)

The map for the mean Written Press usage:

    TV_SHP %>%
      ggplot(aes(fill=mean_tv)) +
      geom_sf() +
      scale_x_continuous(limits = c(-10, 35)) +
      scale_y_continuous(limits = c(35, 75)) +
      theme_void() +
      labs(title="Mean Written Press usage in EU",
           fill="Financial situation") 

![](laurens-mauz_files/figure-markdown_strict/Written%20Press%20Map-1.png)

The Boxplot for Greece

    media_data %>%
      dplyr::filter(isocntry == "GR") %>%
      dplyr::filter(qa1_5 != "Don't know (SPONTANEOUS)") %>%
      mutate(qd3_8 = strtoi(qd3_8)) %>%
      ggplot(aes(x=qa1_5, y=qd3_8, fill=qa1_5)) +
      geom_boxplot() +
      theme(axis.text.x = element_text(angle = 90)) +
      ggtitle(" Financial situation and social media usage",
              subtitle="Greece") +
      xlab("Financial situation") +
      ylab("Social media usage") +
      labs(fill="Financial Situation") +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"))

    ## Warning: Removed 69 rows containing non-finite values (`stat_boxplot()`).

![](laurens-mauz_files/figure-markdown_strict/Greece%20Boxplot-1.png)

The Boxplot for Spain

    media_data %>%
      dplyr::filter(isocntry == "ES") %>%
      dplyr::filter(qa1_5 != "Don't know (SPONTANEOUS)") %>%
      mutate(qd3_8 = strtoi(qd3_8)) %>%
      ggplot(aes(x=qa1_5, y=qd3_8, fill=qa1_5)) +
      geom_boxplot() +
      theme(axis.text.x = element_text(angle = 90)) +
      ggtitle(" Financial situation and social media usage",
              subtitle="Spain") +
      xlab("Financial situation") +
      ylab("Social media usage") +
      labs(fill="Financial Situation") +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"))

    ## Warning: Removed 85 rows containing non-finite values (`stat_boxplot()`).

![](laurens-mauz_files/figure-markdown_strict/Spain%20Boxplot-1.png)

The Boxplot for East-Germany

    media_data %>%
      dplyr::filter(isocntry == "DE-E") %>%
      dplyr::filter(qa1_5 != "Don't know (SPONTANEOUS)") %>%
      mutate(qd3_8 = strtoi(qd3_8), rm.na = TRUE) %>%
      ggplot(aes(x=qa1_5, y=qd3_8, fill=qa1_5)) +
      geom_boxplot() +
      ylim(0, 7.5) +
      theme(axis.text.x = element_text(angle = 90)) +
      ggtitle(" Financial situation and social media usage",
              subtitle="East-Germany") +
      xlab("Financial situation") +
      ylab("Social media usage") +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"))

    ## Warning: Removed 79 rows containing non-finite values (`stat_boxplot()`).

![](laurens-mauz_files/figure-markdown_strict/East-Germany%20Boxplot-1.png)

The Boxplot for West-Germany

    media_data %>%
      dplyr::filter(isocntry == "DE-W") %>%
      dplyr::filter(qa1_5 != "Don't know (SPONTANEOUS)") %>%
      mutate(qd3_8 = strtoi(qd3_8)) %>%
      ggplot(aes(x=qa1_5, y=qd3_8, fill=qa1_5)) +
      geom_boxplot() +
      theme(axis.text.x = element_text(angle = 90)) +
      labs(title = "Financial Situation and Social media usage",
           subtitle = "West-Germany") +
      xlab("Financial situation") +
      ylab("Social media usage") +
      labs(fill= "Financial situation") +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"))

    ## Warning: Removed 134 rows containing non-finite values (`stat_boxplot()`).

![](laurens-mauz_files/figure-markdown_strict/West-Germany%20Boxplot-1.png)
