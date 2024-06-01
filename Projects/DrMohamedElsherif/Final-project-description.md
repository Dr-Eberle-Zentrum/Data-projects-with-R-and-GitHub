### **Background**

With concerns over traffic congestion, air pollution, and
sustainability, municipalities are increasingly turning to alternative
modes of transportation such as cycling to alleviate these problems.
Recognizing the importance of promoting eco-friendly transportation
options, Tübingen has invested in improving and increasing the
availability of bike trails to encourage cycling among its residents and
visitors. To achieve this, the city of Tübingen sought to gain a nuanced
understanding of cycling patterns and trends within and around the city.
This empirical approach allows city planners and stakeholders to
identify key insights, such as peak cycling times, popular routes, and
potential areas for infrastructure improvements. Towards that goal,
numerous surveys, studies, and concept papers address the question of
how cycling can be expanded in and around Tübingen. Therefore, to
facilitate informed city planning decisions, the city has built the Bike
count dataset.

Here is the link to the official website of the city of Tübingen for
cycling information: [City of Tübingen - Cycling
Information](https://www.tuebingen.de/radfahren/31489.html)

### **Bikes Dataset**

To determine cycling traffic in and around Tübingen, the city has
strategically installed wheel counting points at three significant
cycling paths throughout Tübingen, utilizing induction loops embedded in
the ground. These counting points are located at key intersections: the
Steinlachallee/Karlstrasse underpass, the southern terminus of the
bicycle tunnel traversing the Schlossberg, and along the Neckartal cycle
path towards Hirschau. From January 2018 and till January 2024, the number and
direction of cyclists traversing these paths has been collected across
all seasons of the year, months, days of the week, and times of the day.
The data collected are organized across four distinct tables, that together represent all information needed to analyze and correlate the data:

##### **a)** **a Bike counts table:**
This has the count of bike in a specific hour for the respective counter
sites and channels (directions)  indicated by channel_id for each of the three counter sites, indicated by counter_site_id.

|time                | bike_count| channel_id| counter_site_id|
|:-------------------|----------:|----------:|---------------:|
|2018-01-01 01:00:00 |         23|  101003358|       100003358|
|2018-01-01 02:00:00 |         13|  101003358|       100003358|
|2018-01-01 03:00:00 |         19|  101003358|       100003358|
|2018-01-01 04:00:00 |          6|  101003358|       100003358|
|2018-01-01 05:00:00 |          3|  101003358|       100003358|
|2018-01-01 06:00:00 |          4|  101003358|       100003358|

##### **b)** **a Counter Site table:** 

This has the names and the locations of the three counter sites; 

| counter_site_id|counter_site                                                | longitude| latitude|counter_serial |
|---------------:|:-----------------------------------------------------------|---------:|--------:|:--------------|
|       100003359|Unterführung Steinlach/Karlstraße Südseite - Steinlachallee |  9.058865| 48.51543|Y2H17123962    |
|       100003358|Fuß- & Radtunnel Südportal - Derendinger Allee              |  9.048007| 48.51802|YTG13063794    |
|       100026408|Neckartalradweg Hirschau - parallel L371                    |  9.024960| 48.50357|Y2H21035424    |

##### **c)** **a Weather table:** 
That contains hourly weather data including temperature, wind, humidity, rain, etc. for each day of the years 2018 and 2024. 

|time                | temperature| windspeed| humidity| heaven| rain| snow| thunderstorms| fog|
|:-------------------|-----------:|---------:|--------:|------:|----:|----:|-------------:|---:|
|2018-01-01 00:00:00 |           8|         7|       71|      5|    0|    0|             0|   0|
|2018-01-01 01:00:00 |           9|         9|       71|      5|    0|    0|             0|   0|
|2018-01-01 02:00:00 |           8|        11|       87|      5|    3|    0|             0|   0|
|2018-01-01 03:00:00 |           8|        20|       76|      5|    0|    0|             0|   0|
|2018-01-01 04:00:00 |           8|        19|       76|      5|    0|    0|             0|   0|
|2018-01-01 05:00:00 |           7|        19|       81|      5|    0|    0|             0|   0|

##### **d)** **a Holidays table:** 
Finally _the Holidays table_ contains whether a specific day is a public, school or university holiday,
i.e. semester break (0=no holiday, 1=holiday). This sheet is important for correlating the bike traffic across sites with regular workdays versus holidays. 

|date       | semester_break| school_holiday| public_holiday|
|:----------|--------------:|--------------:|--------------:|
|2018-01-01 |              0|              1|              1|
|2018-01-02 |              0|              1|              0|
|2018-01-03 |              0|              1|              0|
|2018-01-04 |              0|              1|              0|
|2018-01-05 |              0|              1|              0|
|2018-01-06 |              0|              0|              1|

**Hint:** _Unfortunately, the exact data set is neither found on official website of the city of Tübingen nor online, and has no available cookbook._

### **Project Goals and Data Mining**

#### **By the end the project, there shall be clear idea about:**

**GOAL 1** The traffic load across each counter site:

**GOAL 2** The temporal variation of bike traffic across the three sites. 

**GOAL 3** Correlation between bike traffic and a) Hours of the day; b) Days of the week; c) Seasons of the year; and location of the counter site.  

#### **To achieve those goals, I am providing you with a detailed step-by-step guide:**

**STEP 1**
Load all csv files into data frames. For each, create a variable and name the variable according to the
respective filename. We have date and datetime columns in the dataset, which usually must be convert all a date/datetime datatype. In R, this should have been done automatically when importing the csv so take a deep breath and say "Gott Sei Dank!" :)

**STEP 2 (Corresponds to GOAL 1)** 
Aggregate the bike_counts dataset by counter_site such that the number of bikes per hour is now
the sum of the bike_counts across all channels of each counter site. Call the resulting object bike_counts_agg

**STEP 3**
Now we need to connect between the different tables, so we can uncover some correlations/trends. Merge all datasets by the appropriate key. Use a left-join for all datasets except the weather data. The
first ‘left’ dataset should be the bike_counts_agg. For the weather data use an inner-join. Call the
result merged. 
_Hint: If you never knew what is "key" or never performed a join, ask AI. In short, I can tell you that a "key" is usually an id that identify specific variable!_ 

**STEP 4**
As you might have noticed, for the holidays dataset there is no column in the bike_counts data
that can be directly used for the merge. Therefore, you first have to create a new column which
contains just the date of the respective timestamp. In R it is possible with the as.Date() function. After the merge, drop the date column as it is not needed anymore.

**STEP 5**
For the columns contained in bike_counts and counter_sites there should be no missing values.
For the holidays columns, however, you will encounter a lot of missing values after the join. Come up with a reasonable approach to fill these missing values?

_Hint: One can handle missing values, whether by imputation or exclusion. For this the "Misty" and "Amelia" packages would be useful respectively.In general, Imputation is only recommended when a Not-At-Random pattern of missing data is found_

**STEP 6 (Corresponds to GOAL 2)**
Aggregate the bike_counts (per hour) to bike counts per week. 
_Hint: Use the {lubridate} package._

**STEP 7 (Corresponds to GOAL 3)**
Aggregate the bike_counts dataset to get the average number of bikes per hour separated by weekday
(across all counter sites).


### **Visual data exploration**
Now that we cleaned and reorganized our data and subsequently did some exploratory analysis. We will now proceed with a variety of visualization tools in order to get a feeling for the data characteristics and uncover possible trends. We will visualize each one of the three main goals:

**VISULIZAZION OF STEP 2 or GOAL 1:**  Use a line plot created using _geom_line()_ to show the total bike counts by hour for each counter site.

**VISULIZAZION OF STEP 6 or GOAL 2:** Create a faceted lineplot that shows the number of bikes per week. For each counter site there should be a facet with the respective counter site name as label, arranged such that the resulting figure has 3 rows and 1 column. The x and y axis should be shared so that the subplots are comparable. Make your graphs look nice (e.g. by adjusting the axis labels).

**VISULIZAZION OF STEP 7 or or GOAL 3:** Plot the resulting average bike count in a heatmap such that it looks like a timetable (weekday on the x-axis and hour on the y-axis).

#### END OF PROJECT
