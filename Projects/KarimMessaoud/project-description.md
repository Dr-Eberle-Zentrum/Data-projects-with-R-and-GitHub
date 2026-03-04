# Global Education Attainment Over Time

Education is one of the most fundamental drivers of economic development
and social equality. Yet, access to education has been distributed
highly unequally across countries and regions throughout history. This
project uses the **Barro-Lee Education Attainment Dataset** to explore
how educational attainment has evolved globally from 1950 to 2010 —
across different age groups, countries, regions, and over time.

## Data

The data comes from the **Barro-Lee Educational Attainment Dataset
(v2.2, 2013)**, a widely used dataset in development economics:
**Source** <http://barrolee.com> (then
`Education Attainment by Age Group`,`Total population`) or directly via:
<https://github.com/barrolee/BarroLeeDataSet/blob/master/BLData/BL2013_MF_v2.2.csv>

### First lines of the data

<table style="width:100%;">
<caption>First 5 rows of the Barro-Lee dataset (selected
columns)</caption>
<colgroup>
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 5%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 4%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 2%" />
<col style="width: 4%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">BLcode</th>
<th style="text-align: center;">country</th>
<th style="text-align: center;">year</th>
<th style="text-align: center;">sex</th>
<th style="text-align: center;">agefrom</th>
<th style="text-align: center;">ageto</th>
<th style="text-align: center;">lu</th>
<th style="text-align: center;">lp</th>
<th style="text-align: center;">lpc</th>
<th style="text-align: center;">ls</th>
<th style="text-align: center;">lsc</th>
<th style="text-align: center;">lh</th>
<th style="text-align: center;">lhc</th>
<th style="text-align: center;">yr_sch</th>
<th style="text-align: center;">yr_sch_pri</th>
<th style="text-align: center;">yr_sch_sec</th>
<th style="text-align: center;">yr_sch_ter</th>
<th style="text-align: center;">pop</th>
<th style="text-align: center;">WBcode</th>
<th style="text-align: center;">region_code</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">1</td>
<td style="text-align: center;">Algeria</td>
<td style="text-align: center;">1950</td>
<td style="text-align: center;">MF</td>
<td style="text-align: center;">15</td>
<td style="text-align: center;">19</td>
<td style="text-align: center;">86.12</td>
<td style="text-align: center;">13.32</td>
<td style="text-align: center;">3.64</td>
<td style="text-align: center;">0.54</td>
<td style="text-align: center;">0.12</td>
<td style="text-align: center;">0.02</td>
<td style="text-align: center;">0.00</td>
<td style="text-align: center;">0.57</td>
<td style="text-align: center;">0.54</td>
<td style="text-align: center;">0.03</td>
<td style="text-align: center;">0.00</td>
<td style="text-align: center;">876</td>
<td style="text-align: center;">DZA</td>
<td style="text-align: center;">Middle East and North Africa</td>
</tr>
<tr>
<td style="text-align: center;">1</td>
<td style="text-align: center;">Algeria</td>
<td style="text-align: center;">1950</td>
<td style="text-align: center;">MF</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">24</td>
<td style="text-align: center;">81.48</td>
<td style="text-align: center;">16.22</td>
<td style="text-align: center;">4.30</td>
<td style="text-align: center;">1.90</td>
<td style="text-align: center;">0.75</td>
<td style="text-align: center;">0.40</td>
<td style="text-align: center;">0.16</td>
<td style="text-align: center;">0.89</td>
<td style="text-align: center;">0.75</td>
<td style="text-align: center;">0.13</td>
<td style="text-align: center;">0.01</td>
<td style="text-align: center;">756</td>
<td style="text-align: center;">DZA</td>
<td style="text-align: center;">Middle East and North Africa</td>
</tr>
<tr>
<td style="text-align: center;">1</td>
<td style="text-align: center;">Algeria</td>
<td style="text-align: center;">1950</td>
<td style="text-align: center;">MF</td>
<td style="text-align: center;">25</td>
<td style="text-align: center;">29</td>
<td style="text-align: center;">81.48</td>
<td style="text-align: center;">16.22</td>
<td style="text-align: center;">4.30</td>
<td style="text-align: center;">1.90</td>
<td style="text-align: center;">0.75</td>
<td style="text-align: center;">0.40</td>
<td style="text-align: center;">0.25</td>
<td style="text-align: center;">0.89</td>
<td style="text-align: center;">0.75</td>
<td style="text-align: center;">0.13</td>
<td style="text-align: center;">0.01</td>
<td style="text-align: center;">649</td>
<td style="text-align: center;">DZA</td>
<td style="text-align: center;">Middle East and North Africa</td>
</tr>
<tr>
<td style="text-align: center;">1</td>
<td style="text-align: center;">Algeria</td>
<td style="text-align: center;">1950</td>
<td style="text-align: center;">MF</td>
<td style="text-align: center;">30</td>
<td style="text-align: center;">34</td>
<td style="text-align: center;">81.20</td>
<td style="text-align: center;">16.80</td>
<td style="text-align: center;">3.50</td>
<td style="text-align: center;">1.60</td>
<td style="text-align: center;">0.52</td>
<td style="text-align: center;">0.40</td>
<td style="text-align: center;">0.25</td>
<td style="text-align: center;">0.85</td>
<td style="text-align: center;">0.73</td>
<td style="text-align: center;">0.11</td>
<td style="text-align: center;">0.01</td>
<td style="text-align: center;">555</td>
<td style="text-align: center;">DZA</td>
<td style="text-align: center;">Middle East and North Africa</td>
</tr>
<tr>
<td style="text-align: center;">1</td>
<td style="text-align: center;">Algeria</td>
<td style="text-align: center;">1950</td>
<td style="text-align: center;">MF</td>
<td style="text-align: center;">35</td>
<td style="text-align: center;">39</td>
<td style="text-align: center;">81.20</td>
<td style="text-align: center;">16.80</td>
<td style="text-align: center;">3.50</td>
<td style="text-align: center;">1.60</td>
<td style="text-align: center;">0.51</td>
<td style="text-align: center;">0.40</td>
<td style="text-align: center;">0.28</td>
<td style="text-align: center;">0.85</td>
<td style="text-align: center;">0.73</td>
<td style="text-align: center;">0.11</td>
<td style="text-align: center;">0.01</td>
<td style="text-align: center;">479</td>
<td style="text-align: center;">DZA</td>
<td style="text-align: center;">Middle East and North Africa</td>
</tr>
</tbody>
</table>

**Columns**

-   `BLcode`: Barro-Lee country code (numeric)
-   `lu`: percentage of the population with no education
-   `lp`: percentage of the population with some primary education
-   `lpc`:percentage of the population with completed primary education
-   `ls`: percentage of the population with some secondary education
-   `lsc`: percentage of the population with completed secondary
    education
-   `lh`: percentage of the population with some higher/tertiary
    education
-   `lhc`: percentage of the population with completed higher/tertiary
    education
-   `yr_sch`: average years of schooling
-   `WBcode`: World Bank country code  
-   `region_code`: World region (e.g. “Sub Saharan Africa”, “Latin
    America & Caribbean”, etc.)

only non-trivial column names are explained, for more information see
<http://barrolee.com/?p=43>

## Questions & Hypothesis, Data Cleaning & Manipulation, Visualization Goals

### Questions & Hypotheses

-   Has the global education gap between regions narrowed over time?
    -   Hypothesis: We expect to see faster increases in average years
        of schooling in developing regions (e.g. Sub-Saharan Africa,
        South Asia) compared to developed regions
-   Are there countries where average years of schooling have stagnated
    or even declined?
    -   Hypothesis: Some countries with political instability or
        economic crises may show stagnation or decline -How does the
        share of population with no education (`lu`) correlate with
        average years of schooling (`yr_sch`)?
-   Which age group benefits most from education expansion?
    -   Hypothesis: Younger age groups should show higher shares of
        completed secondary and tertiary education compared to older age
        groups, reflecting educational expansion over time

### Cleaning & Manipulation

This data is not tidy and poorly formatted. Therefore, plotting is hard
and it requires several cleaning steps.

-   **Pivoting:** Reconstructing the data from wide to long format (more
    precise: education level columns should be pivoted into a single
    column with the education level as values and another column with
    the corresponding percentages for easier plotting)
-   **Validation checks**:
    -   Do the shares `lu + lp + ... + lhc` sum to ~100 for each row?
    -   Are there missing or implausible values (e.g. negative
        percentages)?
    -   Are all expected country × year combinations present?
-   **Population-weighted aggregation**: When computing regional/ global
    averages, observations must be weighted by population since a simple
    mean would overrepresent small countries
-   cryptic variable names are confusing and could be therefore renamed
-   **Derived variable – dominant education level**: For each country ×
    year age group,compute which education level has the highest share

### Visualization goals:

#### Regional Trends in Average Years of Schooling

Line plot showing the evolution of average years of schooling over time
for different regions (e.g. World, Sub-Saharan Africa, South Asia, etc.)

#### Education Level Distribution by Age Group and Country Comparison

Compare 2 Countries (e.g. India vs. Germany) in 2010 with a population
pyramid style plot showing the distribution of education levels (`lu`,
…, `lhc`) across age groups. Instead of Male/Female, the two sides will
show (referring to the example from above) India (left) vs. Germany
(right), with age groups on the y-axis and education level shares as
stacked bars.

![](https://d2mvzyuse3lwjc.cloudfront.net/doc/de/UserGuide/images/Population_Pyramid_Graph/500px-Population_Pyramid_Graph.png)

#### Plot correlation between No Education and Average Years of Schooling

scatter plot to visualize whether countries with high no-education
shares consistently show low average schooling years

#### Heatmap: Average Years of Schooling by Country and Year

The goal is a choropleth map similar to the following example (if
possible):

![](https://data.europa.eu/apps/data-visualisation-guide/Maps%20e22d0627fc944d47be79a1d1a4f8acef/choropleth-population-change-joedavis-eurostat.png)
Countries with the higher gains in `yr_sch` between 1950 & 2010 should
be shown in darker colors.
