# **Introduction**

This project analyzes self-reported mood items and stress levels in
three groups: **Women who start taking medication (sOC), Women who stop
taking medication (dOC), and continuous medication user (OC)**.
Participants recorded their mood and stress levels once a day, two to
three times per week over the course of 90 days using an app. If they
answered every prompt they received, there are between 30-33 ratings per person. 

**For the Level 2 task:** 
The dataset also contains information on the menstrual cycle phase of 
the dOC (women who stop taking medication). A regular cycle is about 28 days long, 
with ovulation occurring around day 14. The cycle lengths for the dOC group
vary a lot. The dataset contains the date of the menstrual cycle phase
and the day of the menstrual cycle phase so it should be possible to
match the cycle day with the mood and stress ratings.

# **Dataset Description**

The dataset originates from an app-based study and includes mood &
stress ratings recorded 2–3 times per week over 90 days (30-33 times in
total). The key variables include:

-   `id`: Participant ID  
-   `group`: **medication starter (sOC), medication discontinuation
    (dOC), continuous medication user (OC)**  
-   `timeStamp`: Date & time of the mood/stress rating; scheduled: when
    it was supposed to be filled out, sent: when it reached the
    participants phone, start: when the participant started filling it
    out, stop: when the participant finished filling it out
-   `stressed_24h, depressed, satisfied, motivated, aroused`: How did
    you feel today? (1–100 scale)
-   `stressed_moment, tense, challenged, burdened, overwhelmed`: How do
    you feel right now? (1–10 scale)
Stress items are `stressed_24h` and `stressed_moment` 
Mood items are `depressed`, `satisfied` , `motivated`, `aroused`

**For the Level 2 task:** 
The dataset also contains information on the menstrual cycle phase of
the dOC group. 
- `id_dOC`: Participant ID of the dOC group 
- `dOC_cycle_date`: Date of the menstrual cycle phase 
- `dOC_cycle_day`:Day of the menstrual cycle phase (normal would be 1-28 days)

# **Data manipulation goals**

-   **Data Cleaning**: Identify and handle missing data by removing incomplete entries
-   **Data Transformation**: To explore the relationship between mood and stress, 
    please visualize individual data points using a scatter plot. Each dot represents 
    a single observation, showing the association between **self-reported stress levels** and **mood**.
    Choose one negative mood item (e.g., `depressed`) and one stress item (e.g., `stressed_24h`).
    Choose one positive mood item (e.g., `satisfied`) and one stress item (e.g., `stressed_24h`).
    The trend line helps identify patterns:
    - If the line slopes downward, higher stress is linked to lower mood (negative association).
    - If the line slopes upward, higher stress is linked to higher mood (positive association).
-   **Data Aggregation**: Calculate the mean and standard deviation for each mood and stress item 
    for each participant and also for the three groups (sOC, dOC, OC).
-   reshape data if needed

# **Visualization goals**

Our goal is to visualize stress and mood trends over time for each group
and explore individual variability. We will examine how participants mood 
varies across different weekdays. The key question is:  

*How does the average mood of participants differ across weekdays?*  


To achieve this, you should::  
- Convert timestamps to weekdays using the `lubridate` package.  
- Group data by weekday and participant group to compute the average mood per day.  
- Visualize the results with a line plot:  
  - The x-axis represents weekdays (ordered from Monday to Sunday).  
  - Each group is displayed as a separate line (distinguished by color).  
  - A confidence interval (uncertainty corridor) is added to show variability.  

- check the example plot that I have provided, where you can see 
  the time series plot with an uncertainty corridor:

![time series plot](./example%20time%20series%20plot.png) 


# **Roadmap**

-   Load and inspect the dataset
-   Perform necessary data manipulation steps
-   Generate visualizations to explore trends
-   Interpret findings and discuss implications

# **Level 2**
- in case you are already done with the above tasks, you can try to 
  display a time series plot for the dOC group, highlighting the menstrual
  cycle phase and their mood and stress ratings accordingly.
- with mood/stress ratings (y-axis) and menstrual cycle phase (x-axis). 
- Keep in mind that we do not have daily mood/stress ratings, 
  but we have the information of their cycle for 90 days.

For that, I have provided an example plot: 
![Mean Stress Ratings by cycle phase](./Mean%20Stress%20Ratings%20by%20cycle%20phase.png)

     


# **Dataset**

[Download the Excel file](./stress_ratings_anonymized.xlsx)
- both tables (also for Level 2) are in the same dataset so you might want to separate them first :)
