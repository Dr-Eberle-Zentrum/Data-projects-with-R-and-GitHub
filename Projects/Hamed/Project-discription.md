## Data

The
[Auto](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/Hamed/Auto_data.csv)
dataset is a collection of various automobile models and their
characteristics. It contains both quantitative and qualitative variables
describing different aspects of cars such as fuel efficiency, engine
size, weight, acceleration, and more. The dataset is useful for
exploring regression modeling, trend analysis, and data visualization.

**Observations**: 396 cars  
**Variables**:

-   **mpg**: Miles per gallon (fuel efficiency)
-   **cylinders**: Number of cylinders in the engine
-   **displacement**: Engine displacement (cubic inches)
-   **horsepower**: Engine horsepower
-   **weight**: Vehicle weight (pounds)
-   **acceleration**: Time to accelerate from 0 to 60 mph (seconds)
-   **year**: Model year (last two digits)
-   **origin**: Origin of the car (1 = American, 2 = European, 3 =
    Japanese)
-   **name**: Car name (manufacturer and model)

------------------------------------------------------------------------

## Data Preparation

-   Ensure each variable has its own column and each observation its own
    row.
-   Convert categorical variables into factors with descriptive labels.
-   Identify and report any duplicate rows in the dataset.
-   Discuss whether duplicates are meaningful or should be removed.
-   Identify columns with missing values.
-   Summarize the number and percentage of missing values.
-   Decide how to handle the missing values (e.g., remove, impute, or
    analyze separately).
-   Create a new variable for the **power-to-weight ratio** and store it
    in a new column.

------------------------------------------------------------------------

## Data Visualization

-   Investigate the relationship between **mpg** and **horsepower**, and
    between **weight** and **acceleration**, using scatterplots with
    trendlines.
-   Perform trend analysis over the years for **mpg**, **horsepower**,
    and **acceleration**. Use appropriate line plots or smoothed curves
    to highlight how car characteristics have changed over time.
-   Highlight interesting patterns, anomalies in the visualizations.

------------------------------------------------------------------------

## Results

-   Provide a general summary of findings based on the data preparation
    and visualizations.
-   Answer the following:
    -   Which **origin** (American, European, Japanese) tends to have
        the most powerful or fastest cars?
    -   What is the relationship between the number of **cylinders** and
        **acceleration**?
    -   What is the **fastest car** for each model year?
    -   which **origin** has the most fuel-efficient cars on average?
-   Feel free to include additional observations or insights from your
    analysis that may be relevant or interesting.
