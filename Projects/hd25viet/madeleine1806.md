# Creating an RMarkdown table where:

-   Rows represent federations.
-   Columns represent age groups.
-   An additional column shows the overall mean rating for each
    federation.
-   The table is sorted by federation or by overall mean rating

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Fed</th>
<th style="text-align: right;">overall_mean</th>
<th style="text-align: right;">16–24</th>
<th style="text-align: right;">24–34</th>
<th style="text-align: right;">35–45</th>
<th style="text-align: right;">45+</th>
<th style="text-align: right;">Under 16</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">CHN</td>
<td style="text-align: right;">1900.702</td>
<td style="text-align: right;">1735.627</td>
<td style="text-align: right;">1974.962</td>
<td style="text-align: right;">2082.961</td>
<td style="text-align: right;">2072.058</td>
<td style="text-align: right;">1637.901</td>
</tr>
<tr class="even">
<td style="text-align: left;">CUB</td>
<td style="text-align: right;">1899.304</td>
<td style="text-align: right;">1827.623</td>
<td style="text-align: right;">1996.200</td>
<td style="text-align: right;">2028.557</td>
<td style="text-align: right;">2013.782</td>
<td style="text-align: right;">1630.358</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NED</td>
<td style="text-align: right;">1870.201</td>
<td style="text-align: right;">1816.230</td>
<td style="text-align: right;">1909.538</td>
<td style="text-align: right;">1969.701</td>
<td style="text-align: right;">1907.855</td>
<td style="text-align: right;">1747.681</td>
</tr>
<tr class="even">
<td style="text-align: left;">UKR</td>
<td style="text-align: right;">1870.126</td>
<td style="text-align: right;">1731.736</td>
<td style="text-align: right;">1915.529</td>
<td style="text-align: right;">2056.312</td>
<td style="text-align: right;">2001.265</td>
<td style="text-align: right;">1645.790</td>
</tr>
<tr class="odd">
<td style="text-align: left;">USA</td>
<td style="text-align: right;">1866.982</td>
<td style="text-align: right;">1825.921</td>
<td style="text-align: right;">1908.348</td>
<td style="text-align: right;">1930.334</td>
<td style="text-align: right;">1946.536</td>
<td style="text-align: right;">1723.772</td>
</tr>
<tr class="even">
<td style="text-align: left;">BIH</td>
<td style="text-align: right;">1861.449</td>
<td style="text-align: right;">1787.014</td>
<td style="text-align: right;">1890.297</td>
<td style="text-align: right;">1985.538</td>
<td style="text-align: right;">1985.268</td>
<td style="text-align: right;">1659.125</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FID</td>
<td style="text-align: right;">1857.515</td>
<td style="text-align: right;">1868.609</td>
<td style="text-align: right;">1889.282</td>
<td style="text-align: right;">1920.046</td>
<td style="text-align: right;">1895.996</td>
<td style="text-align: right;">1713.644</td>
</tr>
<tr class="even">
<td style="text-align: left;">FIN</td>
<td style="text-align: right;">1852.437</td>
<td style="text-align: right;">1741.482</td>
<td style="text-align: right;">1905.473</td>
<td style="text-align: right;">1968.781</td>
<td style="text-align: right;">1958.913</td>
<td style="text-align: right;">1687.538</td>
</tr>
</tbody>
</table>

# Ridgeline Plots

-   x-axis represents ratings
-   y-axis represents different federations
-   One plot per federation, showing how different age groups compare
    within a country

![](madeleine1806_files/figure-markdown_strict/ridgeline%20plot-1.png)
\# Heatmap - as mean-rating-colored table - y-axis represents
federations - x-axis represents age groups - color intensity represents
the mean rating for that age group in that federation

![](madeleine1806_files/figure-markdown_strict/heatmap%20plot-1.png)
