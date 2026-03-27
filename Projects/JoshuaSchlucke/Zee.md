## Solution

### Q1: How do commit volumes vary by weekday and hour, and do different repositories show distinct rhythms?

#### Overall temporal patterns

-   To examine temporal commit patterns, the commit timestamps will be
    parsed and aggregated by weekday and hour. The results will be
    visualized using a heatmap.
-   The visualization will show:
    -   x-axis: hour of the day
    -   y-axis: day of the week
    -   fill color: number of commits.

<!-- -->

    ## Warning: package 'ggforce' was built under R version 4.5.3

![](Zee_files/figure-markdown_strict/heatmap-1.png)

-   So, the answer for this part is that, commits are concentrated
    during typical working hours, especially between approximately 8 AM
    and 5 PM, where the highest activity levels are observed. In
    contrast, early morning hours (around 01:00–7:00) consistently show
    low activity.

-   Across weekdays, Tuesday to Friday exhibit relatively high and
    consistent activity levels, while Monday shows a slower start, with
    lower activity in the morning and increasing toward the afternoon.
    Weekend activity differs noticeably: Saturday shows reduced activity
    compared to weekdays, and Sunday has the lowest overall activity.

#### Differences across repositories

-   To investigate whether different repositories show distinct temporal
    rhythms, commit activity will be compared across selected
    repositories.

-   The visualization will show:

    -   x-axis: hour of the day
    -   y-axis: day of the week
    -   fill color: number of commits
    -   panels: different repositories

![](Zee_files/figure-markdown_strict/repo_heatmap-1.png)

-   It is obvious that, differences in commit activity patterns across
    repositories.
    -   The repository *chromium/chromium* shows strong and concentrated
        activity during afternoon and evening hours, especially on
        weekdays, indicating a structured and synchronized development
        schedule.
    -   However, *freebsd/freebsd-src* exhibits consistently low and
        relatively uniform activity across all hours and days,
        suggesting a smaller or less time-concentrated contributor base.
    -   The repository *llvm/llvm-project* displays a more moderate and
        evenly distributed pattern.
    -   Meanwhile, *torvalds/linux* shows high overall activity with a
        concentrated activity during daytime (work) hours, indicating
        continuous development from a professional and/or highly active
        organization.

### Q2: How common are conventional commit prefixes (`feat`, `fix`, `docs`, `refactor`, `test`, etc.), and how do these proportions change over time?

#### Distribution of commit message prefixes

-   To analyze commit style, it is important to sort conventional
    prefixes and the others.
    -   Conventional prefixes: `feat`, `fix`, `docs`, `refactor`, etc.
-   The visualization will show:
    -   x-axis: commit type
    -   y-axis: number of commits
    -   fill: commit type

![](Zee_files/figure-markdown_strict/prefix_distribution-1.png)

-   The distribution shows that, a large majority of commit messages
    fall into the “other” category, and the conventional commit prefixes
    are relatively uncommon in the dataset. Or we can say, the prefixes’
    styles are very diverse.

#### proportions changes

-   To examine how commit message types evolve over time, the commit
    counts would be aggregated by month and type.

-   The visualization will show:

    -   x-axis: time (month)
    -   y-axis: number of commits
    -   color: commit type

![](Zee_files/figure-markdown_strict/proportions%20changes-1.png)

-   This visualization is not very informative, as the “other” category
    dominates the dataset.
-   After excluding the “other” category and focusing on the top five
    commit types, the visualization becomes clearer and allows for a
    better comparison of meaningful categories. However, the plot is
    still somewhat difficult to interpret, as the lines are highly
    irregular and overlapping. The low counts and high variability over
    time make it challenging to identify stable trends for individual
    commit types.

### Q3: Are message lengths and formats different across repositories or commit types?

#### message length across commit types

-   To analyze differences in message length, it is needed to compute
    the number of characters in each commit and compare distributions
    across commit types.

-   The visualization will show:

    -   x-axis: commit type
    -   y-axis: message length
    -   distribution: boxplot

![](Zee_files/figure-markdown_strict/length%20by%20type-1.png)

-   Commit message format and length are closely related: messages
    following conventional prefixes are typically shorter and more
    uniform, while non-standard messages vary widely in length and
    structure.

#### message length across repositories

-   To examine whether repositories differ in their communication style,
    the message lengths across the repositories would be compared.

-   The visualization will show:

    -   x-axis: repository
    -   y-axis: message length

![](Zee_files/figure-markdown_strict/across%20repositories-1.png)

-   The `torvalds/linux` repository has the highest median message
    length, indicating that commits tend to be more detailed. It also
    shows a relatively wide spread, suggesting substantial variability.

-   The `chromium/chromium` repository exhibits the greatest variability
    overall, with a wide interquartile range and numerous extreme
    outliers, indicating that message lengths vary considerably and
    occasionally become very long.

-   In contrast, `freebsd/freebsd-src` displays a much more compact
    distribution, with generally shorter and more consistent commit
    messages and fewer extreme values.

-Finally, `lvm/lvm-project` has relatively short messages overall, but
still shows several outliers, indicating occasional longer commits
despite a low central tendency.

### Q4: Which repositories show more maintenance activity (fix/docs/chore) versus feature activity (feat)?

-   To compare development activities across repositories, commits
    should firstly be classified by activities’ type:
    -   maintenance: fix, docs, chore
    -   feature: feat
    -   other: all remaining messages

![](Zee_files/figure-markdown_strict/activity-1.png)

-   The visualization shows that most repositories are overwhelmingly
    dominated by commits categorized as “other”, while maintenance
    activity (fix, docs, chore) accounts for only a very small
    proportion. Notably, feature-related commits (“feat”) are
    essentially absent from the dataset, as no visible contribution of
    this category can be observed across the selected repositories.
    Among the repositories, `lvm/lvm-project` shows slightly higher
    maintenance activity compared to the others, although the overall
    proportion remains very low.
