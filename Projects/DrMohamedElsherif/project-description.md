### Background

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

### Bikes Dataset

To determine cycling traffic in and around Tübingen, the city has
strategically installed wheel counting points at three significant
cycling paths throughout Tübingen, utilizing induction loops embedded in
the ground. These counting points are located at key intersections: the
Steinlachallee/Karlstrasse underpass, the southern terminus of the
bicycle tunnel traversing the Schlossberg, and along the Neckartal cycle
path towards Hirschau. Over the course of 2011 and 2012, the number and
direction of cyclists traversing these paths has been collected across
all seasons of the year, months, days of the week, and times of the day.
The data collected are organized across four distinct tables,
encompassing crucial aspects such as weather forecast information,
holiday schedules, and detailed counts of cyclists at each counting
point.

Here is the link to the official website of the city of Tübingen for
cycling information: [City of Tübingen - Cycling
Information](https://www.tuebingen.de/radfahren/31489.html)

### Data Mining

Since the data is organized across four separate tables, several
preprocessing steps need to be done to ensure the data is clean and
ready for analysis. As a first step, it is imperative to handle missing
values, whether by imputation or exclusion, and address outliers. Next,
we may need to adjust data types if necessary. For instance, numerical
values stored as text may need to be converted, or dates may need to be
standardized for consistency. Additionally, we may need to perform joins
to combine related information, perform normalization or
standardization, or dimensionality reduction.

### Visual data exploration

Following our data processing, we then can proceed with exploratory
analysis. For this, we will rely on a variety of visualization tools in
order to get a feeling for the data characteristics and uncover possible
patterns in the data. That would help to feed the data to any AI models
in a meaningful way. Examples include visualizing bike counts per week
per counting site or across the three sites, and visualizing bike counts
across times of the day to identify peak hours, just to name a few
ideas.
