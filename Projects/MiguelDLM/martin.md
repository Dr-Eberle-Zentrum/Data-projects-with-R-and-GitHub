I loaded the data from the GitHub repository in one go and all data
files into one table with respective animal annotations.

    data <-
      # generate URLs to download
      str_c("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/raw/main/Projects/MiguelDLM/",
            "smooth_stress_tensor ("
            ,c("bear","hyaena","lion","wolf"),
            ").csv") |>
      # deal with blanks etc. in URLs
      URLencode() |>
      # read data
      # read_csv("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/raw/main/Projects/MiguelDLM/smooth_stress_tensor.csv") |>
      read_csv(id="animal", ) |>
      # simplify stress column name
      rename( stress = `Von Misses Stress`) |>
      # extract animal from url
      mutate( animal = str_extract(animal, "(?<=\\()[a-z]+(?=\\))") )

    ## Rows: 1606204 Columns: 6
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl (5): NodeTag, X, Y, Z, Von Misses Stress
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

Given that, I rescaled removed the top 2% of stress values and rescaled
the coordinates to a range from 0 to 1. I then segmented the data into
10 segments per dimension via rounding and dropping the maximal value
per dimension (eventually extending the dropped 2% by one more), to
ensure 10 segments.

    dataSegmented <-
      data |>
      group_by(animal) |>
      # remove 2% highest stress values
      filter( stress <= quantile(data$stress, 0.98)) |>
      # compute relative coordinate of X,Y,Z in range 0 to 1
      mutate( across(c(X,Y,Z), scales::rescale) ) |>
      # round to 1 decimal to get 10 segments
      # (but produces 11 segments due to rescale [0,1])
      mutate( across(c(X,Y,Z), ~floor(.x*10)/10) ) |>
      # drop value 1 to ensure 10 segments
      filter(X<1, Y<1, Z<1) |>
      ungroup()

Finally, I aggregated the mean stress data for each dimension and
segment in one data frame and plotted the results.

    # aggregate mean stress data for each dimension in one data frame
    dataSegmented |>
      # store the stress level per dimension and coordinate
      pivot_longer(cols=c(X,Y,Z), names_to="dimension", values_to="coord") |>
      # aggregate respective mean values
      group_by(animal, dimension, coord) |>
      summarize( stress = mean(stress), .groups="drop") |>
      # plotting
      ggplot(aes(col=animal)) +
      # per coordinate dimension
      facet_wrap(~dimension) +
      geom_point(aes(x=coord, y=stress), size=2) +
      geom_line(aes(x=coord, y=stress)) +
      labs(title="Mean stress in 10 segments of the model",
           x="Relative coordinate",
           y="Mean stress")

![](martin_files/figure-markdown_strict/plot-1.png)

Now we should start beautifying the plot…
