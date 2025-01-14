# This is the initial solution

# Visualization of chart one

    ggplot(data_for1, aes(x = pass_score, y = count, fill = result))+
      geom_bar(stat = "identity", position = "stack")+
      labs(
        title = "Attempts by Pass Score", 
        x = "pass score", 
        y = "attempts", 
        fill = "result"
      ) +
      scale_fill_manual(values = c("won" = "blue", "lost" = "red"),
                        labels = c("won", "lost"))

![](Yuguang_solution_Project2_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    ## New names:
    ## • `attempts` -> `attempts...1`
    ## • `attempts` -> `attempts...4`

# Visualization for chart two

    ggplot(data_for2, aes(x = points, y = passing_points, color = type)) +
      geom_point(size = 3) +
      geom_smooth(method = "lm", se = FALSE, aes(group = type)) + 
      labs(
        title = "Passing Points vs Points Won and Lost",
        x = "Points",
        y = "Passing Points",
        color = "Result"
      )

![](Yuguang_solution_Project2_files/figure-markdown_strict/unnamed-chunk-5-1.png)
