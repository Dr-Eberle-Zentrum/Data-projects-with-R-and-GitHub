# Task description

## Introduction

This project explores the distribution of **classical chess ratings**
across different age groups and countries using the official FIDE rating
list from March 2025. The goal is to identify trends in rating strength
by age, compare different federations, and analyze how age-based
performance varies across regions. How do chess skills develop, and do
certain federations have stronger youth or veteran players?

## Dataset

The dataset is sourced from the [FIDE rating list Mar
2025](https://ratings.fide.com/download_lists.phtml).  We specifically
use the **standard (classical) rating list** in the **fixed-width TXT
format** provided on the website.

It contains numerical and categorical variables describing players’
demographic characteristics, including:  
- **Player ID**: Unique identifier for each player  
- **Name**: Player’s full name  
- **Federation**: The country of the player  
- **Title**: GM, IM, FM, etc. (if available)  
- **Rating**: Current rating  
- **Birth year**: Year of birth (some values may be missing)

Since some records have missing values, **we will drop any entries with
missing data** to maintain data integrity.

## Dataset Manipulation

To prepare the data for visualization, the following steps will be
taken:  
1. **Loading Data Correctly**: The dataset will be loaded directly from
the TXT file as a **fixed-width table** in R.  
2. **Cleaning missing values**: Entries with missing birth years or
ratings will be removed.  
3. **Grouping players by age categories**: Creating bins such as:  
- Under 16  
- 16–24  
- 24–34  
- 35–45  
- 45+  
- (This column will be treated as a **factor** in R for proper
categorical handling.)  
4. **Aggregating ratings by federation**:  
- Computing \*\* mean ratings\*\* for each country within each age
group.  
- Creating an **RMarkdown table** where: - Rows represent federations. -
Columns represent age groups. - An additional column shows the **overall
mean rating** for each federation. - The table will be sorted either
**by federation or by overall mean rating** (TBD).  
5. **Filtering federations for analysis**:  
- The focus will be on the **top 10 federations** ranked by **mean
rating** (either across all players or within a specific age segment,
TBD).

## Data Visualization

To analyze rating distributions across age groups and federations, we
will use various visualization techniques:

-   **Ridgeline Plots** (formerly referred to as density plots):
    -   We will create **ridgeline plots** (as seen
        [here](https://r-graph-gallery.com/ridgeline-plot.html)), where
        the x-axis represents ratings and the y-axis represents
        different federations: One plot per federation, showing how
        different age groups compare within a country.  
    -   **Facetting** will be used to split visualizations into smaller,
        more readable plots.
-   **Heatmap Representation**:
    -   We will construct a **mean-rating-colored table** where:
        -   The y-axis represents **federations**.
        -   The x-axis represents **age groups**.
        -   The color intensity represents the **mean rating** for that
            age group in that federation.
    -   **Clustering will be applied only to federations**, ensuring
        that age groups remain in their natural order.
    -   No strict color preferences, but a colorblind-friendly palette
        (e.g., viridis in R) will be used to improve accessibility.

These visualizations will provide insights into whether certain age
groups dominate in specific federations, whether younger players
outperform older ones consistently, and how the chess landscape differs
across regions.
