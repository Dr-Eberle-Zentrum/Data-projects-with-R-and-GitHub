## Volleyball Passing- USA and TU

### Topic of task

The topic of the task is to analyze the volleyball passing data of the
USA Sitting Volleyball team and the University of Tulsa (TU) Volleyball
team and determine how the number and quality of passes lead to a point
win or point loss. The data set is collected from volleyball matches
played by these teams.

### Data Set

[USA and TU Volleyball
Data](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/27560)

### Data Manipulation Goals

There are datasets for games played by the USA Sitting Volleyball team
and the University of Tulsa Volleyball team. These datasets contain
detailed information, such as: - The average number of passes made by
teams if they won or lost points. - The quality of passes during games
versus other volleyball teams (e.g., China, Russia, Brazil).

The key metrics tracked include: - **Attempts**: Total passing actions
made by the team, categorized by quality (e.g., low-quality “zeros,”
high-quality “threes”). - **Points**: The outcome following passing
attempts, broken down into points won or lost. Not all passing sequences
result in points scored, as points can also come from serves, opponent
errors, or other play actions.

For example, in the University of Tulsa data: - High-quality passes
(e.g., “threes”) had the highest success rate in terms of points won
(141 out of 190 attempts, ~74%). - Low-quality passes (e.g., “zeros”)
resulted in no points scored and 13 points lost.

The data manipulation goals are to: - Investigate the relationship
between passing attempts and point outcomes (won/lost). - Find the
correlation between the number and quality of passes and the number of
points won or lost.

### Visualization Goals

The primary visualization goal is to create a correlation graph showing
the relationship between passing score (quality of passes) and point
outcomes (points won or lost). This will help illustrate how the quality
and frequency of passing attempts impact overall performance.

#### 1. Stacked Bar Chart: Easy

-   **Purpose**: To show the breakdown of points won vs. points lost for
    each pass quality (use data from file: “Volleyball Passing - USA and
    TU.xlsx TU sort by pass score).
-   **X-Axis**: Pass score categories.
-   **Y-Axis**: Total attempts (stacked into points won and points
    lost).
-   **Highlight**: This graph would give a clear visual of the
    proportion of points won vs. points lost for each pass score.

#### 2. Scatter Plot with Trendline: Difficult

-   **Purpose**: To visually show the relationship between passing
    scores and points won/lost, with the Pearson R value indicating the
    strength and direction of the correlation.
-   **X-Axis**: Average passing scores (use data from in Directory:
    “Passing Raw Data” (totals tab)).
-   **Y-Axis**: Points won or points lost
-   **Highlight**: The scatter plot will show individual data points,
    and the trendline will indicate the correlation, with the Pearson R
    value represented in the graph’s legend. A high Pearson R (close to
    1 or -1) will show a clear upward or downward trend, while a low
    value (closer to 0) will show a more scattered distribution.
