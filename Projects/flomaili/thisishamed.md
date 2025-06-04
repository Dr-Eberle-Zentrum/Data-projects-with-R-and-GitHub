    data <- read.csv2("~/Data-projects-with-R-and-Github/Projects/flomaili/data_MS.csv")

### Clean and Prepare Data

    data <- data %>%
      mutate(
        ms_duration_clean = str_to_lower(str_replace_all(`MS.Duration`, " ", "")),
        ms_duration_value = as.numeric(str_extract(ms_duration_clean, "\\d+")),
        ms_duration_unit = case_when(
          str_detect(ms_duration_clean, "year") ~ "year",
          str_detect(ms_duration_clean, "month") ~ "month",
          TRUE ~ NA_character_
        ),
        `MS Duration (months)` = case_when(
          ms_duration_unit == "year" ~ ms_duration_value * 12,
          ms_duration_unit == "month" ~ ms_duration_value,
          TRUE ~ NA_real_
        ) %>% round()
      )

    data <- data %>%
      mutate(
        other_disease_clean = na_if(trimws(`Other.Diseases`), "-"),
        Num_Other_Diseases = case_when(
          is.na(other_disease_clean) ~ 0L,
          TRUE ~ str_count(other_disease_clean, ",") + 1L
        )
      )

    data <- data %>%
      mutate(
        medication_clean = str_to_lower(trimws(Medication)),
        Corticosteroid_Treatment = str_detect(medication_clean, "corticosteroid"),
        Bcell_Treatment = str_detect(medication_clean, "rituximab")
      )

    data <- data %>%
      mutate(Patient_ID = sprintf("MS_XS_%03d", row_number())) %>%
      select(-"Patient.Name", everything())

### Cortisol vs. BAI Score

    ggplot(data, aes(x = `Cortisol.Test.Result`, y = `BAI.Score`, color = Sex, shape = Corticosteroid_Treatment)) +
      geom_point(size = 3) +
      theme_minimal() +
      labs(title = "BAI Score vs Cortisol Test Result", x = "Cortisol", y = "BAI Score")

![](thisishamed_files/figure-markdown_strict/plot-cortisol-bai-1.png)

### Correlation by Sex and Corticosteroid Treatment

    data <- data %>%
      filter(!is.na(Sex)) %>%
      mutate(Sex_Cort = paste0(str_trim(Sex), "_", ifelse(Corticosteroid_Treatment, "+", "-")))

    ggplot(data, aes(x = `Cortisol.Test.Result`, y = `BAI.Score`, color = Sex_Cort)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE) +
      facet_wrap(~Sex_Cort) +
      theme_minimal() +
      labs(title = "Correlation per Sex & Corticosteroid Group")

    ## `geom_smooth()` using formula = 'y ~ x'

![](thisishamed_files/figure-markdown_strict/correlation-plot-1.png)

    correlations <- data %>%
      group_by(Sex_Cort) %>%
      summarise(correlation = cor(`Cortisol.Test.Result`, `BAI.Score`, use = "complete.obs"))
    correlations

    ## # A tibble: 4 × 2
    ##   Sex_Cort correlation
    ##   <chr>          <dbl>
    ## 1 Female_+     -0.0314
    ## 2 Female_-     -0.562 
    ## 3 Male_+       -0.195 
    ## 4 Male_-       -0.282

### NO Test Results by MS Duration Group

    data <- data %>%
      mutate(MS_Group = cut(`MS Duration (months)`, breaks = seq(0, max(`MS Duration (months)`, na.rm = TRUE) + 6, 6), right = FALSE))

    summary_ms <- data %>%
      group_by(MS_Group) %>%
      summarise(mean_NO = mean(`NO.test.result`, na.rm = TRUE),
                sd_NO = sd(`NO.test.result`, na.rm = TRUE))

    ggplot(summary_ms, aes(x = MS_Group, y = mean_NO)) +
      geom_point() +
      geom_errorbar(aes(ymin = mean_NO - sd_NO, ymax = mean_NO + sd_NO), width = 0.2) +
      theme_minimal() +
      labs(title = "Mean NO Test Result by MS Duration Group", x = "MS Duration Group (months)", y = "NO Test Result")

![](thisishamed_files/figure-markdown_strict/no-ms-duration-1.png)

### Median Number of Diseases by Age Group

    data <- data %>%
      mutate(Total_Diseases = Num_Other_Diseases + 1,
             Age_Group = cut(Age, breaks = seq(0, 100, by = 15), right = FALSE))

    summary_age <- data %>%
      group_by(Age_Group) %>%
      summarise(median_diseases = median(Total_Diseases, na.rm = TRUE))

    ggplot(summary_age, aes(x = Age_Group, y = median_diseases)) +
      geom_col(fill = "skyblue") +
      theme_minimal() +
      labs(title = "Median Number of Diseases by Age Group", x = "Age Group", y = "Median Disease Count")

![](thisishamed_files/figure-markdown_strict/diseases-by-age-1.png)
