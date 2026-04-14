## Data cleaning & manipulation

The validation check shows that the percentage sums far exceed 100%.
More precisely, the range of the percentage sums are as follows:

<table>
<thead>
<tr>
<th style="text-align: right;">Minimum sum</th>
<th style="text-align: right;">Maximum sum</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">99.84</td>
<td style="text-align: right;">199.74</td>
</tr>
</tbody>
</table>

This is especially interesting, because education levels are mutually
exclusive, so the percentage sums should always add up to 100%. However
if one was to consider that people with `completed` education are also
counted in the more generalized education level (`some`), the following
ranges are calculated:

<table>
<thead>
<tr>
<th style="text-align: right;">Minimum sum</th>
<th style="text-align: right;">Maximum sum</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">99.5</td>
<td style="text-align: right;">100.5</td>
</tr>
</tbody>
</table>

This makes much more sense than the previous results, thus the adjusted
data will be used from now on.

Testing for implausible values and missing values:

    min(data)

    ## [1] 0

    max(data)

    ## [1] 100

    sum(is.na(data))

    ## [1] 0

There are no values below 0 or above 100, and there are no missing
values.

Are all expected country × year combinations present?

    ## [1] TRUE

All expected combinations are present, so there are no missing country ×
year combinations.

**Renaming cryptic names**

    DFData_adjusted <- DFData_adjusted %>%
      rename(
        `No education` = lu,
        `Some primary` = lp,
        `Completed primary` = lpc,
        `Some secondary` = ls,
        `Completed secondary` = lsc,
        `Some tertiary` = lh,
        `Completed tertiary` = lhc,
        `Years of schooling` = yr_sch,
        Region = region_code
      )

## Visualization 1: Regional Trends in Average Years of Schooling

![](ArminBurkhardt_files/figure-markdown_strict/unnamed-chunk-4-1.png)

## Visualization 2: Education Level Distribution by Age Group and Country Comparison

![](ArminBurkhardt_files/figure-markdown_strict/unnamed-chunk-5-1.png)

## Questions and Interpretation

The graphs above show the trends in average years of schooling across
different regions over time (Visualization 1), as well as the
distribution of education levels by age group for Germany and India in
1960 and 2010 (Visualization 2). These graphs help answer the questions
proposed in the project description:

-   Q1: Has the global education gap between regions narrowed over time?

    > Visualization 1 shows that, although the average years of
    > schooling has increased for regions ranking lower in the graph,
    > the gap between the regions has not narrowed significantly, as all
    > other regions have kept up. A possible interpretation of this
    > could be that while less developed regions have made significant
    > progress in improving access to education, people in developed
    > regions spend more time in education, pursuing higher levels of
    > education. This explanation is backed by Visualization 2, which
    > shows that the percentage of people with completed tertiary
    > education has increased significantly in developed regions, while
    > for less developed regions there has just been a shift from no
    > education to some primary and some secondary education. This could
    > explain the steady increase across all countries.

-   Q2: Are there countries where average years of schooling have
    stagnated or even declined?

    > Visualization 1 shows that this was not the case for any region.
    > All regions show a steady increase in average years of schooling
    > over time, with no decline or stagnation.

### Further investigation

To confirm this, the per country data can be analyzed to check for any
stagnation or decline in average years of schooling.

<table style="width:100%;">
<colgroup>
<col style="width: 50%" />
<col style="width: 5%" />
<col style="width: 29%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">country</th>
<th style="text-align: right;">year</th>
<th style="text-align: right;">Average Years of schooling</th>
<th style="text-align: right;">Yearly change</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Algeria</td>
<td style="text-align: right;">1955</td>
<td style="text-align: right;">0.8527461</td>
<td style="text-align: right;">-0.0071879</td>
</tr>
<tr>
<td style="text-align: left;">Austria</td>
<td style="text-align: right;">1955</td>
<td style="text-align: right;">5.8818503</td>
<td style="text-align: right;">-0.2081623</td>
</tr>
<tr>
<td style="text-align: left;">Denmark</td>
<td style="text-align: right;">1955</td>
<td style="text-align: right;">4.4724815</td>
<td style="text-align: right;">-0.9988670</td>
</tr>
<tr>
<td style="text-align: left;">Norway</td>
<td style="text-align: right;">1955</td>
<td style="text-align: right;">7.4351583</td>
<td style="text-align: right;">-0.0092446</td>
</tr>
<tr>
<td style="text-align: left;">Reunion</td>
<td style="text-align: right;">1955</td>
<td style="text-align: right;">2.7463252</td>
<td style="text-align: right;">-0.1013538</td>
</tr>
<tr>
<td style="text-align: left;">Spain</td>
<td style="text-align: right;">1955</td>
<td style="text-align: right;">3.7325175</td>
<td style="text-align: right;">-0.0023486</td>
</tr>
<tr>
<td style="text-align: left;">Algeria</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">0.8387921</td>
<td style="text-align: right;">-0.0139540</td>
</tr>
<tr>
<td style="text-align: left;">Austria</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">5.8576466</td>
<td style="text-align: right;">-0.0242037</td>
</tr>
<tr>
<td style="text-align: left;">France</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">4.1684695</td>
<td style="text-align: right;">-0.2730833</td>
</tr>
<tr>
<td style="text-align: left;">Myanmar</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">1.2008872</td>
<td style="text-align: right;">-0.0163697</td>
</tr>
<tr>
<td style="text-align: left;">Republic of Korea</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">3.9337826</td>
<td style="text-align: right;">-0.9222801</td>
</tr>
<tr>
<td style="text-align: left;">Reunion</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2.7000000</td>
<td style="text-align: right;">-0.0463252</td>
</tr>
<tr>
<td style="text-align: left;">Bulgaria</td>
<td style="text-align: right;">1965</td>
<td style="text-align: right;">4.4226291</td>
<td style="text-align: right;">-0.3404010</td>
</tr>
<tr>
<td style="text-align: left;">Greece</td>
<td style="text-align: right;">1965</td>
<td style="text-align: right;">6.3103308</td>
<td style="text-align: right;">-0.9254869</td>
</tr>
<tr>
<td style="text-align: left;">Japan</td>
<td style="text-align: right;">1965</td>
<td style="text-align: right;">7.3642245</td>
<td style="text-align: right;">-0.0761559</td>
</tr>
<tr>
<td style="text-align: left;">Thailand</td>
<td style="text-align: right;">1965</td>
<td style="text-align: right;">2.1876555</td>
<td style="text-align: right;">-0.2545239</td>
</tr>
<tr>
<td style="text-align: left;">Belize</td>
<td style="text-align: right;">1970</td>
<td style="text-align: right;">7.6187952</td>
<td style="text-align: right;">-0.0940427</td>
</tr>
<tr>
<td style="text-align: left;">Costa Rica</td>
<td style="text-align: right;">1970</td>
<td style="text-align: right;">3.8614125</td>
<td style="text-align: right;">-0.1900851</td>
</tr>
<tr>
<td style="text-align: left;">Germany</td>
<td style="text-align: right;">1970</td>
<td style="text-align: right;">7.2863575</td>
<td style="text-align: right;">-0.2308198</td>
</tr>
<tr>
<td style="text-align: left;">Barbados</td>
<td style="text-align: right;">1975</td>
<td style="text-align: right;">7.5037528</td>
<td style="text-align: right;">-0.6845016</td>
</tr>
<tr>
<td style="text-align: left;">Brazil</td>
<td style="text-align: right;">1975</td>
<td style="text-align: right;">2.8777516</td>
<td style="text-align: right;">-0.3337873</td>
</tr>
<tr>
<td style="text-align: left;">Germany</td>
<td style="text-align: right;">1975</td>
<td style="text-align: right;">7.2418924</td>
<td style="text-align: right;">-0.0444651</td>
</tr>
<tr>
<td style="text-align: left;">Mozambique</td>
<td style="text-align: right;">1975</td>
<td style="text-align: right;">0.9227295</td>
<td style="text-align: right;">-0.0589047</td>
</tr>
<tr>
<td style="text-align: left;">Singapore</td>
<td style="text-align: right;">1975</td>
<td style="text-align: right;">4.7875547</td>
<td style="text-align: right;">-0.0690396</td>
</tr>
<tr>
<td style="text-align: left;">Barbados</td>
<td style="text-align: right;">1980</td>
<td style="text-align: right;">7.0327176</td>
<td style="text-align: right;">-0.4710351</td>
</tr>
<tr>
<td style="text-align: left;">Belize</td>
<td style="text-align: right;">1980</td>
<td style="text-align: right;">7.5506965</td>
<td style="text-align: right;">-0.2940861</td>
</tr>
<tr>
<td style="text-align: left;">New Zealand</td>
<td style="text-align: right;">1980</td>
<td style="text-align: right;">11.4770764</td>
<td style="text-align: right;">-0.0905740</td>
</tr>
<tr>
<td style="text-align: left;">Canada</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">9.9088975</td>
<td style="text-align: right;">-0.1354541</td>
</tr>
<tr>
<td style="text-align: left;">Finland</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">7.4213538</td>
<td style="text-align: right;">-0.0918842</td>
</tr>
<tr>
<td style="text-align: left;">Hungary</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">8.8909329</td>
<td style="text-align: right;">-0.0068000</td>
</tr>
<tr>
<td style="text-align: left;">Senegal</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">2.4007236</td>
<td style="text-align: right;">-0.0260442</td>
</tr>
<tr>
<td style="text-align: left;">South Africa</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">5.0324812</td>
<td style="text-align: right;">-0.0051115</td>
</tr>
<tr>
<td style="text-align: left;">Switzerland</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">10.3261924</td>
<td style="text-align: right;">-0.7006109</td>
</tr>
<tr>
<td style="text-align: left;">Venezuela</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">5.0071133</td>
<td style="text-align: right;">-0.0489994</td>
</tr>
<tr>
<td style="text-align: left;">Viet Nam</td>
<td style="text-align: right;">1985</td>
<td style="text-align: right;">4.5587990</td>
<td style="text-align: right;">-0.3514161</td>
</tr>
<tr>
<td style="text-align: left;">Hungary</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">8.7761543</td>
<td style="text-align: right;">-0.1147786</td>
</tr>
<tr>
<td style="text-align: left;">Maldives</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">4.3352318</td>
<td style="text-align: right;">-0.4481139</td>
</tr>
<tr>
<td style="text-align: left;">Mozambique</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">0.9634252</td>
<td style="text-align: right;">-0.1294798</td>
</tr>
<tr>
<td style="text-align: left;">New Zealand</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">11.5759901</td>
<td style="text-align: right;">-0.0529757</td>
</tr>
<tr>
<td style="text-align: left;">Senegal</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">2.2983479</td>
<td style="text-align: right;">-0.1023757</td>
</tr>
<tr>
<td style="text-align: left;">Switzerland</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">10.0713270</td>
<td style="text-align: right;">-0.2548654</td>
</tr>
<tr>
<td style="text-align: left;">Venezuela</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">4.9127730</td>
<td style="text-align: right;">-0.0943403</td>
</tr>
<tr>
<td style="text-align: left;">Viet Nam</td>
<td style="text-align: right;">1990</td>
<td style="text-align: right;">4.0710920</td>
<td style="text-align: right;">-0.4877070</td>
</tr>
<tr>
<td style="text-align: left;">Albania</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">8.1013834</td>
<td style="text-align: right;">-0.1897655</td>
</tr>
<tr>
<td style="text-align: left;">Maldives</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">3.9776099</td>
<td style="text-align: right;">-0.3576219</td>
</tr>
<tr>
<td style="text-align: left;">Mozambique</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">0.9004551</td>
<td style="text-align: right;">-0.0629701</td>
</tr>
<tr>
<td style="text-align: left;">Namibia</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">5.9623941</td>
<td style="text-align: right;">-0.0719773</td>
</tr>
<tr>
<td style="text-align: left;">Senegal</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">2.1681555</td>
<td style="text-align: right;">-0.1301924</td>
</tr>
<tr>
<td style="text-align: left;">Swaziland</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">4.8199702</td>
<td style="text-align: right;">-0.0967382</td>
</tr>
<tr>
<td style="text-align: left;">Switzerland</td>
<td style="text-align: right;">1995</td>
<td style="text-align: right;">9.9396232</td>
<td style="text-align: right;">-0.1317038</td>
</tr>
<tr>
<td style="text-align: left;">Australia</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">11.1301382</td>
<td style="text-align: right;">-0.1058063</td>
</tr>
<tr>
<td style="text-align: left;">China, Hong Kong Special Administrative
Region</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">9.1786991</td>
<td style="text-align: right;">-0.0328759</td>
</tr>
<tr>
<td style="text-align: left;">Fiji</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">9.7280962</td>
<td style="text-align: right;">-0.2911467</td>
</tr>
<tr>
<td style="text-align: left;">Mauritius</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">6.6137109</td>
<td style="text-align: right;">-0.0581397</td>
</tr>
<tr>
<td style="text-align: left;">Namibia</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">5.6736929</td>
<td style="text-align: right;">-0.2887012</td>
</tr>
<tr>
<td style="text-align: left;">Paraguay</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">6.2061778</td>
<td style="text-align: right;">-0.0082044</td>
</tr>
<tr>
<td style="text-align: left;">Senegal</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">1.9141483</td>
<td style="text-align: right;">-0.2540072</td>
</tr>
<tr>
<td style="text-align: left;">South Africa</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">7.6095610</td>
<td style="text-align: right;">-0.6688223</td>
</tr>
<tr>
<td style="text-align: left;">Swaziland</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">4.3083177</td>
<td style="text-align: right;">-0.5116525</td>
</tr>
<tr>
<td style="text-align: left;">Switzerland</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">9.9066477</td>
<td style="text-align: right;">-0.0329755</td>
</tr>
<tr>
<td style="text-align: left;">Tonga</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">9.2828571</td>
<td style="text-align: right;">-0.0118182</td>
</tr>
<tr>
<td style="text-align: left;">Bahrain</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">7.1060486</td>
<td style="text-align: right;">-0.3032918</td>
</tr>
<tr>
<td style="text-align: left;">Cyprus</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">9.2450053</td>
<td style="text-align: right;">-0.5953114</td>
</tr>
<tr>
<td style="text-align: left;">Fiji</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">9.3828608</td>
<td style="text-align: right;">-0.3452354</td>
</tr>
<tr>
<td style="text-align: left;">Guatemala</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">3.9378542</td>
<td style="text-align: right;">-0.1087641</td>
</tr>
<tr>
<td style="text-align: left;">Kuwait</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">6.0420978</td>
<td style="text-align: right;">-0.0297005</td>
</tr>
<tr>
<td style="text-align: left;">Portugal</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">6.9068665</td>
<td style="text-align: right;">-0.2914182</td>
</tr>
<tr>
<td style="text-align: left;">Senegal</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">1.5710422</td>
<td style="text-align: right;">-0.3431061</td>
</tr>
<tr>
<td style="text-align: left;">Singapore</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">8.8618324</td>
<td style="text-align: right;">-0.2778033</td>
</tr>
<tr>
<td style="text-align: left;">Swaziland</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">3.5810969</td>
<td style="text-align: right;">-0.7272208</td>
</tr>
<tr>
<td style="text-align: left;">Tajikistan</td>
<td style="text-align: right;">2005</td>
<td style="text-align: right;">10.5857745</td>
<td style="text-align: right;">-0.1797596</td>
</tr>
<tr>
<td style="text-align: left;">Bahrain</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">6.9231198</td>
<td style="text-align: right;">-0.1829288</td>
</tr>
<tr>
<td style="text-align: left;">Bolivia</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">8.1324525</td>
<td style="text-align: right;">-0.1386427</td>
</tr>
<tr>
<td style="text-align: left;">Costa Rica</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">8.0017326</td>
<td style="text-align: right;">-0.1598356</td>
</tr>
<tr>
<td style="text-align: left;">Kazakhstan</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">11.3531368</td>
<td style="text-align: right;">-0.1165335</td>
</tr>
<tr>
<td style="text-align: left;">Lesotho</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">5.7997183</td>
<td style="text-align: right;">-1.0974100</td>
</tr>
<tr>
<td style="text-align: left;">New Zealand</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">11.0462601</td>
<td style="text-align: right;">-0.6741348</td>
</tr>
<tr>
<td style="text-align: left;">Norway</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">11.6554334</td>
<td style="text-align: right;">-0.2013879</td>
</tr>
<tr>
<td style="text-align: left;">Peru</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">8.8416947</td>
<td style="text-align: right;">-0.6153611</td>
</tr>
<tr>
<td style="text-align: left;">Sri Lanka</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">10.0418340</td>
<td style="text-align: right;">-0.1819569</td>
</tr>
<tr>
<td style="text-align: left;">Sweden</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">11.6843912</td>
<td style="text-align: right;">-0.0982670</td>
</tr>
<tr>
<td style="text-align: left;">Tajikistan</td>
<td style="text-align: right;">2010</td>
<td style="text-align: right;">10.4689117</td>
<td style="text-align: right;">-0.1168627</td>
</tr>
</tbody>
</table>

Surprisingly, there are many countries, even some developed ones, that
show a decline in average years of schooling in some years. However,
these declines are mostly insignificant and do not indicate a long term
stagnation or decline in education levels. Thus, the overall trend of
increasing average years of schooling over time still holds true for all
regions.

-   Q4: Which age group benefits most from education expansion?

    > Generally, the younger the group, the more they benefit from
    > education expansion, as can be interpreted from Visualization 2.
    > Looking at Germany in 2010 for instance, the group with the
    > highest percentage of completed tertiary education is the 30-34
    > age group, which is to be expected, as younger people are still in
    > the persuit of this education level.
    >
    > Looking at the trends in Visualization 2 with the context of the
    > increase in schooling years in Visualization 1, it is safe to say
    > that the percentage of people completing tertiary education will
    > be higher in the group 15-19 fifteen years down the line (eg. in
    > 2025), than the group 30-34 in 2010. Thus, the youngest groups
    > will likely end up with the highest education level on average, as
    > has been the trend so far, benefiting the most from education
    > expansion.
