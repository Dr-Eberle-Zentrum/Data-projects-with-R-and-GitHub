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
<https://raw.githubusercontent.com/barrolee/BarroLeeDataSet/refs/heads/master/BLData/BL2013_MF_v2.2.csv>

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

Note: The education level variables are mutually exclusive: a person is
only counted in the variable corresponding to their **highest** attained
education level

only non-trivial column names are explained, for more information see
<http://barrolee.com/?p=43>

## Questions & Hypothesis, Data Cleaning & Manipulation, Visualization Goals

### Questions & Hypotheses

-   **Q1:** Has the global education gap between regions narrowed over
    time?

    -   *Hypothesis*: We expect to see faster increases in average years
        of schooling in developing regions (e.g. Sub-Saharan Africa,
        South Asia) compared to developed regions

-   **Q2:** Are there countries where average years of schooling have
    stagnated or even declined?

    -   *Hypothesis*: Some countries with political instability or
        economic crises may show stagnation or decline

-   **Q3:** Do countries with a higher share of population with no
    education (`lu`) tend to have lower average years of schooling
    (`yr_sch`)? Is this relationship consistent across regions?

-   **Q4:** Which age group benefits most from education expansion?

    -   *Hypothesis*: Middle age groups (30–55) should show the clearest
        differences between 1960 and 2010, as younger cohorts (15–25)
        may not have completed tertiary education yet regardless of
        access

### Cleaning & Manipulation

These steps apply globally before any visualization: - **Validation
checks**: - Do the shares `lu + lp + ... + lhc` sum to ~100 for each
row? - Are there missing or implausible values (e.g. negative
percentages)? - Are all expected country × year combinations present? -
**Renaming**: Cryptic variable names should be renamed to more readable
labels (e.g. `lu`: `No Education`, `lp`: `Some Primary`, etc.)

### Visualization goals:

#### Viz-1: Regional Trends in Average Years of Schooling *(addresses Q1, Q2)*

Load the data directly from the raw URL above. Then compute
population-weighted regional average years of schooling (`yr_sch`) for
each region and year and plot their evolution over time (1950-2010)
using a line plot with one line per region.

-   **Manipulation needed here:** Population-weighted aggregation: when
    computing regional/global averages, observations must be weighted by
    `pop`, since a simple mean would overrepresent small countries
-   This directly addresses **Q1** (convergence between regions) and
    **Q2** (stagnation/decline visible as flat or falling lines)

#### Viz-2: Education Level Distribution by Age Group and Country Comparison *(addresses Q4, Q1)*

Compare a country from a developed region (e.g. Germany) to one from a
developing region (e.g. India) for the years `1960` and `2010` using a
population pyramid style plot with facetting to show both years side by
side.

-   **Manipulation needed here:** Pivot the education level columns
    (`lu`, `lp`, …, `lhc`) from wide to long format, with one column for
    education level and one for the corresponding percentage
-   Instead of Male/Female, the two sides show Germany (left) vs. India
    (right)
-   Age groups on the y-axis, education level shares as stacked bars
-   Use `facet_wrap` or `facet_grid` to show 1960 and 2010 side by side,
    allowing a 50-year comparison
-   This directly addresses **Q4** (which age groups benefit most) as
    well as **Q1**

![](https://d2mvzyuse3lwjc.cloudfront.net/doc/de/UserGuide/images/Population_Pyramid_Graph/500px-Population_Pyramid_Graph.png)

#### **OPTIONAL** Viz-3: Weighted Mean Education Level vs. Time *(addresses Q1, Q2, Q3)*

For each country and year, compute a **weighted mean education level**
using numeric placeholders for each level (1 = no education, …, 7 =
completed tertiary):

    mean_edu = mean(level * percentage)

These group-level means can then be weighted by the relative size of
each age group within a country and year to get a single mean education
level per country per year. Use this indicator to:

-   Create a scatter plot of `lu` (no education share) vs. `yr_sch`,
    colored by region, for a selected year (addressing **Q3**)
-   Optionally use the derived indicator to study timelines or compare
    countries (addressing **Q1** and **Q2**)

#### **OPTIONAL** Viz-4: Choropleth Map: Gain in Average Years of Schooling 1950–2010 *(addresses Q1, Q2)*

Compute the absolute increase in `yr_sch` between 1950 & 2010 per
country and display it on a world map.

-   Countries with the higher gains in `yr_sch` between 1950 & 2010
    should be shown in darker colors
-   For the color scale, either a sequential colormap (darker = higher
    gain) or a **diverging colormap** (see below) can be used
-   Makes regional patterns and outliers (stagnation/decline)
    immediately visible

![](https://data.europa.eu/apps/data-visualisation-guide/Maps%20e22d0627fc944d47be79a1d1a4f8acef/choropleth-population-change-joedavis-eurostat.png)
