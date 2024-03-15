# The Economic Impact of Remote Work on Urban Housing Markets

In this project, we’ll analyze housing prices and remote work. With the
recent surge in remote work, especially due to the pandemic, we’re
curious to see how this trend has impacted urban housing markets over
the years.

## Introduction to the Dataset

The dataset used in this analysis is from the Harvard Dataverse and
contains information on housing prices and several other relevant
variables across different countries. The variables included in the
dataset are as follows:

-   **Percentage of Workforce Working Remotely**
-   **Average Urban Housing Price Index**
-   **Urban Population Growth Rate (%)**
-   **Rural Population Growth Rate (%)**
-   **Public Transport Ridership Change (%)**
-   **Internet Infrastructure Investment (Million USD)**
-   **Environmental Impact Score (1-100)**

Here is an extract of the ([Housing\_prices.csv](Housing_prices.csv))
data:

<table style="width:100%;">
<caption>Housing prices dataset</caption>
<colgroup>
<col style="width: 1%" />
<col style="width: 4%" />
<col style="width: 6%" />
<col style="width: 13%" />
<col style="width: 11%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 12%" />
<col style="width: 16%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">Year</th>
<th style="text-align: left;">Country</th>
<th style="text-align: left;">Country Abbreviation</th>
<th style="text-align: right;">Percentage of Workforce Working
Remotely</th>
<th style="text-align: right;">Average Urban Housing Price Index</th>
<th style="text-align: right;">Urban Population Growth Rate (%)</th>
<th style="text-align: right;">Rural Population Growth Rate (%)</th>
<th style="text-align: right;">Public Transport Ridership Change
(%)</th>
<th style="text-align: right;">Internet Infrastructure Investment
(Million USD)</th>
<th style="text-align: right;">Environmental Impact Score (1-100)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">China</td>
<td style="text-align: left;">CN</td>
<td style="text-align: right;">14.583387</td>
<td style="text-align: right;">196.2923</td>
<td style="text-align: right;">3.8942331</td>
<td style="text-align: right;">0.6379331</td>
<td style="text-align: right;">1.327937</td>
<td style="text-align: right;">532.4148</td>
<td style="text-align: right;">77.53263</td>
</tr>
<tr class="even">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">United States</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">44.486241</td>
<td style="text-align: right;">175.9826</td>
<td style="text-align: right;">2.6049171</td>
<td style="text-align: right;">0.7486386</td>
<td style="text-align: right;">-5.455835</td>
<td style="text-align: right;">608.2066</td>
<td style="text-align: right;">74.96287</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">China</td>
<td style="text-align: left;">CN</td>
<td style="text-align: right;">32.993901</td>
<td style="text-align: right;">144.4369</td>
<td style="text-align: right;">0.5209549</td>
<td style="text-align: right;">1.6813219</td>
<td style="text-align: right;">8.311592</td>
<td style="text-align: right;">558.8738</td>
<td style="text-align: right;">64.55881</td>
</tr>
<tr class="even">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Germany</td>
<td style="text-align: left;">DE</td>
<td style="text-align: right;">8.817697</td>
<td style="text-align: right;">120.1093</td>
<td style="text-align: right;">-1.5781283</td>
<td style="text-align: right;">0.1868193</td>
<td style="text-align: right;">-4.817692</td>
<td style="text-align: right;">402.5573</td>
<td style="text-align: right;">70.03079</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">China</td>
<td style="text-align: left;">CN</td>
<td style="text-align: right;">32.913930</td>
<td style="text-align: right;">122.0150</td>
<td style="text-align: right;">4.4890068</td>
<td style="text-align: right;">1.5379643</td>
<td style="text-align: right;">-29.056201</td>
<td style="text-align: right;">900.8910</td>
<td style="text-align: right;">62.71897</td>
</tr>
</tbody>
</table>

Housing prices dataset

## Data Manipulation Goals

The primary goal of data manipulation in this project is to prepare the
dataset for analysis. This involves sorting the data, identifying and
handling missing values, and ensuring that the dataset is in a suitable
format for visualization and analysis.

There is one missing datapoint for “Public Transport Ridership Change%”
for Germany inthe year 2023:

<table>
<caption>Missing data table</caption>
<colgroup>
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 7%" />
<col style="width: 13%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 12%" />
<col style="width: 16%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">Year</th>
<th style="text-align: left;">Country</th>
<th style="text-align: left;">Country Abbreviation</th>
<th style="text-align: right;">Percentage of Workforce Working
Remotely</th>
<th style="text-align: right;">Average Urban Housing Price Index</th>
<th style="text-align: right;">Urban Population Growth Rate (%)</th>
<th style="text-align: right;">Rural Population Growth Rate (%)</th>
<th style="text-align: right;">Public Transport Ridership Change
(%)</th>
<th style="text-align: right;">Internet Infrastructure Investment
(Million USD)</th>
<th style="text-align: right;">Environmental Impact Score (1-100)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">China</td>
<td style="text-align: left;">CN</td>
<td style="text-align: right;">20.671496</td>
<td style="text-align: right;">98.46751</td>
<td style="text-align: right;">2.9612129</td>
<td style="text-align: right;">1.9949547</td>
<td style="text-align: right;">-10.63692</td>
<td style="text-align: right;">704.2000</td>
<td style="text-align: right;">42.11061</td>
</tr>
<tr class="even">
<td style="text-align: right;">2023</td>
<td style="text-align: left;">Germany</td>
<td style="text-align: left;">DE</td>
<td style="text-align: right;">8.757532</td>
<td style="text-align: right;">178.29228</td>
<td style="text-align: right;">1.7741289</td>
<td style="text-align: right;">0.9906452</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">481.6282</td>
<td style="text-align: right;">40.76622</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Germany</td>
<td style="text-align: left;">DE</td>
<td style="text-align: right;">49.370048</td>
<td style="text-align: right;">162.60829</td>
<td style="text-align: right;">-0.0058897</td>
<td style="text-align: right;">0.6040913</td>
<td style="text-align: right;">-28.12592</td>
<td style="text-align: right;">900.5788</td>
<td style="text-align: right;">77.16579</td>
</tr>
</tbody>
</table>

Missing data table

There is also one missing row: The data for China in 2006 is not
included.

For the visualization goals, the missing data is not a problem and will
be ignored.

## Visualization Goals

The main visualization goal is to create a scatterplot that illustrates
the relationship between housing prices and the percentage of the
workforce working remotely in different countries. This visualization
will help us understand if there is any discernible correlation between
remote work trends and urban housing market dynamics.

**Y-Axis name:** Home price growth in % **X-Axis name:** Remote worker
share in metro area 2018 - 2023

(the following images is for illustration only)

<figure>
<img src="Scatterplot.jpg" alt="Remote Work on Housing Prices" />
<figcaption aria-hidden="true">Remote Work on Housing
Prices</figcaption>
</figure>

For more advanced users, here are some more tasks to fulfill:

-   comparison of remote work and home pricing over time (scatter plot
    with dots for each and respective loess model curves; all within one
    plot)
-   to make the data (and curves) comparable: compute the standard score
    (Z-score) for each data set and use it as respective y-value for
    plotting
-   draw independent plots for each country and one for all via
    facetting, i.e. in total 4 plots
-   highlight the year 2019 as the starting point of the covid pandemy
-   draw different background colors for the area before 2019 and after
-   discuss the result of the comparison in a short text below figure
