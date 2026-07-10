# Social Media Advertising and Campaign Performance

------------------------------------------------------------------------

Social media advertising is an important part of modern marketing and
public relations. This project explores how social media advertising
campaigns differ across platforms, customer segments, and campaign
goals.

The focus of this project lies on cleaning, restructuring, and
visualizing advertising campaign data. I am especially interested in how
different advertising strategies lead to audience interaction and
financial performance.

# Dataset

------------------------------------------------------------------------

The original dataset can be found on Kaggle, which is an online platform
where users can publish, share, and download datasets for data analysis
projects.

<https://www.kaggle.com/datasets/jsonk11/social-media-advertising-dataset/data>

However, since Kaggle requires user registration to download the
dataset, a local copy of the CSV file can be found within ‘Minseo’
project folder.

### Summary of the Dataset

<table style="width:100%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 8%" />
<col style="width: 4%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 8%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 4%" />
<col style="width: 3%" />
<col style="width: 5%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 4%" />
<col style="width: 7%" />
</colgroup>
<thead>
<tr>
<th style="text-align: right;">Campaign_ID</th>
<th style="text-align: left;">Target_Audience</th>
<th style="text-align: left;">Campaign_Goal</th>
<th style="text-align: left;">Duration</th>
<th style="text-align: left;">Channel_Used</th>
<th style="text-align: right;">Conversion_Rate</th>
<th style="text-align: left;">Acquisition_Cost</th>
<th style="text-align: right;">ROI</th>
<th style="text-align: left;">Location</th>
<th style="text-align: left;">Language</th>
<th style="text-align: right;">Clicks</th>
<th style="text-align: right;">Impressions</th>
<th style="text-align: right;">Engagement_Score</th>
<th style="text-align: left;">Customer_Segment</th>
<th style="text-align: left;">Date</th>
<th style="text-align: left;">Company</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">529013</td>
<td style="text-align: left;">Men 35-44</td>
<td style="text-align: left;">Product Launch</td>
<td style="text-align: left;">15 Days</td>
<td style="text-align: left;">Instagram</td>
<td style="text-align: right;">0.15</td>
<td style="text-align: left;">$500.00</td>
<td style="text-align: right;">5.7900000</td>
<td style="text-align: left;">Las Vegas</td>
<td style="text-align: left;">Spanish</td>
<td style="text-align: right;">500</td>
<td style="text-align: right;">3000</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Health</td>
<td style="text-align: left;">2/25/2022</td>
<td style="text-align: left;">Aura Align</td>
</tr>
<tr>
<td style="text-align: right;">275352</td>
<td style="text-align: left;">Women 45-60</td>
<td style="text-align: left;">Market Expansion</td>
<td style="text-align: left;">15 Days</td>
<td style="text-align: left;">Facebook</td>
<td style="text-align: right;">0.01</td>
<td style="text-align: left;">$500.00</td>
<td style="text-align: right;">7.2100000</td>
<td style="text-align: left;">Los Angeles</td>
<td style="text-align: left;">French</td>
<td style="text-align: right;">500</td>
<td style="text-align: right;">3000</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">Home</td>
<td style="text-align: left;">5/12/2022</td>
<td style="text-align: left;">Hearth Harmony</td>
</tr>
<tr>
<td style="text-align: right;">692322</td>
<td style="text-align: left;">Men 45-60</td>
<td style="text-align: left;">Product Launch</td>
<td style="text-align: left;">15 Days</td>
<td style="text-align: left;">Instagram</td>
<td style="text-align: right;">0.08</td>
<td style="text-align: left;">$500.00</td>
<td style="text-align: right;">0.4300000</td>
<td style="text-align: left;">Austin</td>
<td style="text-align: left;">Spanish</td>
<td style="text-align: right;">500</td>
<td style="text-align: right;">3000</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">Technology</td>
<td style="text-align: left;">6/19/2022</td>
<td style="text-align: left;">Cyber Circuit</td>
</tr>
<tr>
<td style="text-align: right;">675757</td>
<td style="text-align: left;">Men 25-34</td>
<td style="text-align: left;">Increase Sales</td>
<td style="text-align: left;">15 Days</td>
<td style="text-align: left;">Pinterest</td>
<td style="text-align: right;">0.03</td>
<td style="text-align: left;">$500.00</td>
<td style="text-align: right;">0.9098236</td>
<td style="text-align: left;">Miami</td>
<td style="text-align: left;">Spanish</td>
<td style="text-align: right;">293</td>
<td style="text-align: right;">1937</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">Health</td>
<td style="text-align: left;">9/8/2022</td>
<td style="text-align: left;">Well Wish</td>
</tr>
<tr>
<td style="text-align: right;">535900</td>
<td style="text-align: left;">Men 45-60</td>
<td style="text-align: left;">Market Expansion</td>
<td style="text-align: left;">15 Days</td>
<td style="text-align: left;">Pinterest</td>
<td style="text-align: right;">0.13</td>
<td style="text-align: left;">$500.00</td>
<td style="text-align: right;">1.4228282</td>
<td style="text-align: left;">Austin</td>
<td style="text-align: left;">French</td>
<td style="text-align: right;">293</td>
<td style="text-align: right;">1937</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">Home</td>
<td style="text-align: left;">8/24/2022</td>
<td style="text-align: left;">Hearth Harmony</td>
</tr>
<tr>
<td style="text-align: right;">323031</td>
<td style="text-align: left;">Women 35-44</td>
<td style="text-align: left;">Product Launch</td>
<td style="text-align: left;">15 Days</td>
<td style="text-align: left;">Facebook</td>
<td style="text-align: right;">0.02</td>
<td style="text-align: left;">$500.00</td>
<td style="text-align: right;">6.9000000</td>
<td style="text-align: left;">Austin</td>
<td style="text-align: left;">Spanish</td>
<td style="text-align: right;">500</td>
<td style="text-align: right;">3001</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">Technology</td>
<td style="text-align: left;">1/15/2022</td>
<td style="text-align: left;">Cyber Circuit</td>
</tr>
</tbody>
</table>

The dataset contains information about social media advertising
campaigns, including audience targeting, campaign goals, platforms,
engagement scores, clicks, impressions, acquisition costs, and ROI.

The data is provided as a CSV file and includes the following variables:

## Variables

<table>
<thead>
<tr>
<th>Variable</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Campaign_ID</code></td>
<td>Unique identifier of the advertising campaign</td>
</tr>
<tr>
<td><code>Target_Audience</code></td>
<td>Demographic group targeted by the campaign</td>
</tr>
<tr>
<td><code>Campaign_Goal</code></td>
<td>Objective of the campaign</td>
</tr>
<tr>
<td><code>Duration</code></td>
<td>Campaign duration written as text values</td>
</tr>
<tr>
<td><code>Channel_Used</code></td>
<td>Social media platform used for the campaign</td>
</tr>
<tr>
<td><code>Conversion_Rate</code></td>
<td>Percentage of successful conversions</td>
</tr>
<tr>
<td><code>Acquisition_Cost</code></td>
<td>Customer acquisition cost</td>
</tr>
<tr>
<td><code>ROI</code></td>
<td>Return on investment</td>
</tr>
<tr>
<td><code>Location</code></td>
<td>Campaign location</td>
</tr>
<tr>
<td><code>Language</code></td>
<td>Language used for the campaign</td>
</tr>
<tr>
<td><code>Clicks</code></td>
<td>Number of advertisement clicks</td>
</tr>
<tr>
<td><code>Impressions</code></td>
<td>Number of advertisement impressions</td>
</tr>
<tr>
<td><code>Engagement_Score</code></td>
<td>Standardized audience engagement score</td>
</tr>
<tr>
<td><code>Customer_Segment</code></td>
<td>Targeted customer category</td>
</tr>
<tr>
<td><code>Date</code></td>
<td>Campaign date</td>
</tr>
<tr>
<td><code>Company</code></td>
<td>Company running the campaign</td>
</tr>
</tbody>
</table>

# Tasks for Data Clean Up

------------------------------------------------------------------------

Before the data can be analyzed, several variables need to be cleaned or
restructured.

- convert `Duration` values into numeric day values
- clean currency-formatted variables such as `Acquisition_Cost`
- convert `Date` into a proper date format
- split `Target_Audience` into separate demographic variables, such as
  gender and age group
- create a cleaned dataset for later manipulation and visualization

These steps are important because several variables are not immediately
ready for numerical analysis. For example, campaign duration is stored
as text, acquisition cost contains currency symbols, and the target
audience combines multiple demographic categories in one column.

# Tasks for Data Manipulation

------------------------------------------------------------------------

## 1. Which campaign goals bring the highest engagement scores?

One important question is which campaign goals are most effective at
generating audience interaction on social media.

To answer this question, the data will be grouped by `Campaign_Goal`.
For each campaign goal, create a nicely formatted summary table showing:

- the average of `Engagement_Score`
- the standard deviation of `Engagement_Score`
- the number of campaigns

The standard deviation should help show whether engagement scores are
consistent within each campaign goal or vary strongly between campaigns.
Also, this overall table should help identify whether certain campaign
goals are more successful at attracting audience involvement.

## 2. Which age group has the highest click-through rate?

Another important question is which age groups are most likely to
interact with advertisements after seeing them.

Instead of only comparing raw click counts, I will calculate a
click-through rate.

Click-through rate will be calculated as `Clicks / Impressions`.

To make the analysis more precise, each age range should be decomposed
into individual ages. For example, the campaign targeting 25-34 should
be counted for every age from 25 to 34. After restructuring the data
caculate the average click-through rate for each individual age! To
answer this question, the `Target_Audience` column should first be split
into separate demographic variables. Then the average click-through rate
will be calculated for each age group.

This makes the comparison fairer than using only raw click counts,
because campaigns with more impressions naturally tend to have more
clicks.

**Tip:** Check whether the `Target_Audience` column has been properly
split into separate gender and age group variables.

## Additional task of data visualization

As an additional challenge, a small data visualization could also be
created here:

Create a age-separated click-through rate plot using faceting by gender.
The plot should show click-through rate by exact age separately for male
and female target audiences.

**Tip:** Campaigns labeled as targeting “all” should be counted for both
men and women.

# Tasks for Data Visualization

------------------------------------------------------------------------

Create a line graph showing how average ROI changes with campaign
duration across different social media platforms.

The data should be grouped by `Duration` and `Channel_Used`.

The final graph should show:

- campaign duration on the x-axis
- average ROI on the y-axis
- separate lines for different social media platforms

This visualization should help explore whether longer advertising
campaigns are associated with higher ROI, and whether this pattern
differs across social media platforms.

**Tip:** Check whether the `Duration` column has been converted into
numeric day values before creating the graph.
