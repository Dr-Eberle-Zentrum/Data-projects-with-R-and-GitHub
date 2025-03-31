## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    file <- "standard_rating_list.txt"

    df <- read_fwf(file=file, 
                   fwf_empty(file, 
                            col_names=c("ID", "Name", "Fed", "Sex", "Tit", "WTit", "OTit", "FOA", "APR25", "Gms", "K", "Birthday", "Flag")),
                            skip=1)

    ## Rows: 498022 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## 
    ## chr (8): Name, Fed, Sex, Tit, WTit, OTit, FOA, Flag
    ## dbl (5): ID, APR25, Gms, K, Birthday
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    df <- df %>%
      drop_na(Birthday, APR25) %>% # remove rows without birthday or rating
      # filter out rows with invalid birthday year
      filter(Birthday > 1900) %>%
      # remove irrelevant columns
      mutate(Tit=NULL,
             WTit=NULL,
             OTit=NULL,
             Gms=NULL,
             FOA=NULL,
             # using cut already create factor-typed column
             bin = cut(2024-Birthday, breaks=c(1,16,25,35,46,Inf), labels=c("below 16", "16-24", "25-34", "35-45", "above 45"))
             ) %>%
      filter(!is.na(bin)) 

    by_country_by_age <- group_by(df, Fed, bin) %>%
      summarise(mean_rating=mean(APR25, na.rm=TRUE), .groups="drop") %>%
      pivot_wider(names_from=bin, values_from=mean_rating) %>%
      select("Fed", "below 16", "16-24", "25-34", "35-45", "above 45") 

    by_country <- group_by(df, Fed) %>%
      summarise(mean_rating=mean(APR25, na.rm=TRUE)) 

    final_df <- left_join(by_country, by_country_by_age, by="Fed") %>%
      arrange(desc(mean_rating))

    knitr::kable(final_df, format = "pipe")

<table>
<thead>
<tr>
<th style="text-align: left;">Fed</th>
<th style="text-align: right;">mean_rating</th>
<th style="text-align: right;">below 16</th>
<th style="text-align: right;">16-24</th>
<th style="text-align: right;">25-34</th>
<th style="text-align: right;">35-45</th>
<th style="text-align: right;">above 45</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">NON</td>
<td style="text-align: right;">2564.500</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">2564.500</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">CUB</td>
<td style="text-align: right;">1941.712</td>
<td style="text-align: right;">1665.968</td>
<td style="text-align: right;">1885.176</td>
<td style="text-align: right;">2009.319</td>
<td style="text-align: right;">2039.182</td>
<td style="text-align: right;">2009.836</td>
</tr>
<tr>
<td style="text-align: left;">BIH</td>
<td style="text-align: right;">1934.607</td>
<td style="text-align: right;">1699.621</td>
<td style="text-align: right;">1812.250</td>
<td style="text-align: right;">1923.701</td>
<td style="text-align: right;">1999.206</td>
<td style="text-align: right;">1981.751</td>
</tr>
<tr>
<td style="text-align: left;">MYA</td>
<td style="text-align: right;">1917.426</td>
<td style="text-align: right;">1652.611</td>
<td style="text-align: right;">1772.000</td>
<td style="text-align: right;">1893.522</td>
<td style="text-align: right;">1954.941</td>
<td style="text-align: right;">1964.498</td>
</tr>
<tr>
<td style="text-align: left;">FIN</td>
<td style="text-align: right;">1916.444</td>
<td style="text-align: right;">1707.103</td>
<td style="text-align: right;">1786.681</td>
<td style="text-align: right;">1910.691</td>
<td style="text-align: right;">1992.398</td>
<td style="text-align: right;">1955.388</td>
</tr>
<tr>
<td style="text-align: left;">SRB</td>
<td style="text-align: right;">1912.044</td>
<td style="text-align: right;">1657.771</td>
<td style="text-align: right;">1775.522</td>
<td style="text-align: right;">1898.519</td>
<td style="text-align: right;">1975.574</td>
<td style="text-align: right;">1970.373</td>
</tr>
<tr>
<td style="text-align: left;">KOS</td>
<td style="text-align: right;">1906.109</td>
<td style="text-align: right;">1607.316</td>
<td style="text-align: right;">1853.719</td>
<td style="text-align: right;">1868.889</td>
<td style="text-align: right;">1955.057</td>
<td style="text-align: right;">1939.668</td>
</tr>
<tr>
<td style="text-align: left;">NED</td>
<td style="text-align: right;">1903.981</td>
<td style="text-align: right;">1761.653</td>
<td style="text-align: right;">1840.350</td>
<td style="text-align: right;">1938.054</td>
<td style="text-align: right;">1976.723</td>
<td style="text-align: right;">1902.765</td>
</tr>
<tr>
<td style="text-align: left;">UKR</td>
<td style="text-align: right;">1896.574</td>
<td style="text-align: right;">1664.897</td>
<td style="text-align: right;">1772.076</td>
<td style="text-align: right;">1976.746</td>
<td style="text-align: right;">2063.388</td>
<td style="text-align: right;">1993.814</td>
</tr>
<tr>
<td style="text-align: left;">GER</td>
<td style="text-align: right;">1889.695</td>
<td style="text-align: right;">1684.138</td>
<td style="text-align: right;">1791.569</td>
<td style="text-align: right;">1891.149</td>
<td style="text-align: right;">1943.909</td>
<td style="text-align: right;">1929.801</td>
</tr>
<tr>
<td style="text-align: left;">MNE</td>
<td style="text-align: right;">1881.261</td>
<td style="text-align: right;">1578.988</td>
<td style="text-align: right;">1738.929</td>
<td style="text-align: right;">1962.662</td>
<td style="text-align: right;">1975.857</td>
<td style="text-align: right;">1977.656</td>
</tr>
<tr>
<td style="text-align: left;">SCO</td>
<td style="text-align: right;">1880.642</td>
<td style="text-align: right;">1783.675</td>
<td style="text-align: right;">1780.548</td>
<td style="text-align: right;">1896.368</td>
<td style="text-align: right;">1936.095</td>
<td style="text-align: right;">1905.066</td>
</tr>
<tr>
<td style="text-align: left;">USA</td>
<td style="text-align: right;">1880.308</td>
<td style="text-align: right;">1749.892</td>
<td style="text-align: right;">1855.639</td>
<td style="text-align: right;">1915.576</td>
<td style="text-align: right;">1937.289</td>
<td style="text-align: right;">1942.613</td>
</tr>
<tr>
<td style="text-align: left;">AND</td>
<td style="text-align: right;">1878.784</td>
<td style="text-align: right;">1643.200</td>
<td style="text-align: right;">1778.842</td>
<td style="text-align: right;">1894.350</td>
<td style="text-align: right;">2041.545</td>
<td style="text-align: right;">1908.333</td>
</tr>
<tr>
<td style="text-align: left;">INA</td>
<td style="text-align: right;">1878.198</td>
<td style="text-align: right;">1661.015</td>
<td style="text-align: right;">1863.465</td>
<td style="text-align: right;">1939.324</td>
<td style="text-align: right;">1910.580</td>
<td style="text-align: right;">1950.698</td>
</tr>
<tr>
<td style="text-align: left;">AUT</td>
<td style="text-align: right;">1877.107</td>
<td style="text-align: right;">1708.020</td>
<td style="text-align: right;">1817.810</td>
<td style="text-align: right;">1890.293</td>
<td style="text-align: right;">1927.328</td>
<td style="text-align: right;">1895.947</td>
</tr>
<tr>
<td style="text-align: left;">NGR</td>
<td style="text-align: right;">1872.730</td>
<td style="text-align: right;">1746.750</td>
<td style="text-align: right;">1837.807</td>
<td style="text-align: right;">1889.046</td>
<td style="text-align: right;">1913.923</td>
<td style="text-align: right;">1915.024</td>
</tr>
<tr>
<td style="text-align: left;">LIE</td>
<td style="text-align: right;">1866.182</td>
<td style="text-align: right;">1607.667</td>
<td style="text-align: right;">1799.250</td>
<td style="text-align: right;">2198.000</td>
<td style="text-align: right;">1951.333</td>
<td style="text-align: right;">1907.636</td>
</tr>
<tr>
<td style="text-align: left;">SSD</td>
<td style="text-align: right;">1862.461</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1908.444</td>
<td style="text-align: right;">1869.118</td>
<td style="text-align: right;">1834.109</td>
<td style="text-align: right;">1793.250</td>
</tr>
<tr>
<td style="text-align: left;">MNC</td>
<td style="text-align: right;">1860.032</td>
<td style="text-align: right;">1548.267</td>
<td style="text-align: right;">1850.429</td>
<td style="text-align: right;">2029.429</td>
<td style="text-align: right;">2024.417</td>
<td style="text-align: right;">1903.025</td>
</tr>
<tr>
<td style="text-align: left;">SLO</td>
<td style="text-align: right;">1850.301</td>
<td style="text-align: right;">1616.889</td>
<td style="text-align: right;">1742.183</td>
<td style="text-align: right;">1903.741</td>
<td style="text-align: right;">1987.085</td>
<td style="text-align: right;">1904.659</td>
</tr>
<tr>
<td style="text-align: left;">SUI</td>
<td style="text-align: right;">1848.445</td>
<td style="text-align: right;">1667.993</td>
<td style="text-align: right;">1779.657</td>
<td style="text-align: right;">1866.570</td>
<td style="text-align: right;">1893.036</td>
<td style="text-align: right;">1879.734</td>
</tr>
<tr>
<td style="text-align: left;">FID</td>
<td style="text-align: right;">1847.470</td>
<td style="text-align: right;">1746.331</td>
<td style="text-align: right;">1873.464</td>
<td style="text-align: right;">1915.560</td>
<td style="text-align: right;">1883.720</td>
<td style="text-align: right;">1911.217</td>
</tr>
<tr>
<td style="text-align: left;">DOM</td>
<td style="text-align: right;">1847.309</td>
<td style="text-align: right;">1665.903</td>
<td style="text-align: right;">1762.947</td>
<td style="text-align: right;">1839.637</td>
<td style="text-align: right;">1899.977</td>
<td style="text-align: right;">1919.580</td>
</tr>
<tr>
<td style="text-align: left;">ENG</td>
<td style="text-align: right;">1847.041</td>
<td style="text-align: right;">1699.065</td>
<td style="text-align: right;">1778.499</td>
<td style="text-align: right;">1867.336</td>
<td style="text-align: right;">1917.930</td>
<td style="text-align: right;">1885.529</td>
</tr>
<tr>
<td style="text-align: left;">MAR</td>
<td style="text-align: right;">1845.743</td>
<td style="text-align: right;">1720.286</td>
<td style="text-align: right;">1758.014</td>
<td style="text-align: right;">1861.144</td>
<td style="text-align: right;">1904.978</td>
<td style="text-align: right;">1918.290</td>
</tr>
<tr>
<td style="text-align: left;">CHA</td>
<td style="text-align: right;">1842.600</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1738.500</td>
<td style="text-align: right;">1948.000</td>
<td style="text-align: right;">1840.000</td>
</tr>
<tr>
<td style="text-align: left;">PNG</td>
<td style="text-align: right;">1840.750</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1572.000</td>
<td style="text-align: right;">1603.000</td>
<td style="text-align: right;">1903.000</td>
<td style="text-align: right;">1890.111</td>
</tr>
<tr>
<td style="text-align: left;">HUN</td>
<td style="text-align: right;">1836.801</td>
<td style="text-align: right;">1644.722</td>
<td style="text-align: right;">1720.645</td>
<td style="text-align: right;">1872.155</td>
<td style="text-align: right;">1936.525</td>
<td style="text-align: right;">1882.895</td>
</tr>
<tr>
<td style="text-align: left;">GAM</td>
<td style="text-align: right;">1836.720</td>
<td style="text-align: right;">1691.000</td>
<td style="text-align: right;">1788.000</td>
<td style="text-align: right;">1789.000</td>
<td style="text-align: right;">1828.000</td>
<td style="text-align: right;">1871.571</td>
</tr>
<tr>
<td style="text-align: left;">ALB</td>
<td style="text-align: right;">1836.195</td>
<td style="text-align: right;">1593.447</td>
<td style="text-align: right;">1713.547</td>
<td style="text-align: right;">1849.327</td>
<td style="text-align: right;">1875.528</td>
<td style="text-align: right;">1929.029</td>
</tr>
<tr>
<td style="text-align: left;">WLS</td>
<td style="text-align: right;">1835.891</td>
<td style="text-align: right;">1595.594</td>
<td style="text-align: right;">1743.377</td>
<td style="text-align: right;">1840.148</td>
<td style="text-align: right;">1901.415</td>
<td style="text-align: right;">1878.298</td>
</tr>
<tr>
<td style="text-align: left;">SOL</td>
<td style="text-align: right;">1833.867</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1849.667</td>
<td style="text-align: right;">1818.545</td>
<td style="text-align: right;">1955.000</td>
</tr>
<tr>
<td style="text-align: left;">CRO</td>
<td style="text-align: right;">1833.379</td>
<td style="text-align: right;">1592.380</td>
<td style="text-align: right;">1725.877</td>
<td style="text-align: right;">1871.422</td>
<td style="text-align: right;">1937.746</td>
<td style="text-align: right;">1908.072</td>
</tr>
<tr>
<td style="text-align: left;">SYR</td>
<td style="text-align: right;">1828.295</td>
<td style="text-align: right;">1621.956</td>
<td style="text-align: right;">1738.371</td>
<td style="text-align: right;">1771.391</td>
<td style="text-align: right;">1857.795</td>
<td style="text-align: right;">1980.634</td>
</tr>
<tr>
<td style="text-align: left;">JPN</td>
<td style="text-align: right;">1828.040</td>
<td style="text-align: right;">1663.919</td>
<td style="text-align: right;">1773.907</td>
<td style="text-align: right;">1845.333</td>
<td style="text-align: right;">1902.424</td>
<td style="text-align: right;">1865.188</td>
</tr>
<tr>
<td style="text-align: left;">IOM</td>
<td style="text-align: right;">1827.286</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1777.000</td>
<td style="text-align: right;">2278.000</td>
<td style="text-align: right;">1780.250</td>
<td style="text-align: right;">1813.133</td>
</tr>
<tr>
<td style="text-align: left;">MLI</td>
<td style="text-align: right;">1826.600</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1465.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1938.500</td>
<td style="text-align: right;">1857.222</td>
</tr>
<tr>
<td style="text-align: left;">CZE</td>
<td style="text-align: right;">1824.925</td>
<td style="text-align: right;">1632.751</td>
<td style="text-align: right;">1748.581</td>
<td style="text-align: right;">1882.941</td>
<td style="text-align: right;">1919.587</td>
<td style="text-align: right;">1857.627</td>
</tr>
<tr>
<td style="text-align: left;">BRU</td>
<td style="text-align: right;">1824.273</td>
<td style="text-align: right;">1716.750</td>
<td style="text-align: right;">1727.250</td>
<td style="text-align: right;">1839.250</td>
<td style="text-align: right;">1916.667</td>
<td style="text-align: right;">1846.636</td>
</tr>
<tr>
<td style="text-align: left;">CAN</td>
<td style="text-align: right;">1822.966</td>
<td style="text-align: right;">1685.421</td>
<td style="text-align: right;">1792.630</td>
<td style="text-align: right;">1874.070</td>
<td style="text-align: right;">1913.622</td>
<td style="text-align: right;">1898.027</td>
</tr>
<tr>
<td style="text-align: left;">LUX</td>
<td style="text-align: right;">1822.960</td>
<td style="text-align: right;">1606.216</td>
<td style="text-align: right;">1762.404</td>
<td style="text-align: right;">1871.654</td>
<td style="text-align: right;">1894.172</td>
<td style="text-align: right;">1855.860</td>
</tr>
<tr>
<td style="text-align: left;">ISL</td>
<td style="text-align: right;">1822.192</td>
<td style="text-align: right;">1584.366</td>
<td style="text-align: right;">1703.107</td>
<td style="text-align: right;">1846.267</td>
<td style="text-align: right;">1872.455</td>
<td style="text-align: right;">1900.591</td>
</tr>
<tr>
<td style="text-align: left;">ETH</td>
<td style="text-align: right;">1822.171</td>
<td style="text-align: right;">1595.000</td>
<td style="text-align: right;">1748.286</td>
<td style="text-align: right;">1806.600</td>
<td style="text-align: right;">1865.378</td>
<td style="text-align: right;">1913.308</td>
</tr>
<tr>
<td style="text-align: left;">EST</td>
<td style="text-align: right;">1821.115</td>
<td style="text-align: right;">1569.639</td>
<td style="text-align: right;">1696.262</td>
<td style="text-align: right;">1921.613</td>
<td style="text-align: right;">2051.101</td>
<td style="text-align: right;">1986.272</td>
</tr>
<tr>
<td style="text-align: left;">DEN</td>
<td style="text-align: right;">1817.707</td>
<td style="text-align: right;">1683.670</td>
<td style="text-align: right;">1758.515</td>
<td style="text-align: right;">1807.796</td>
<td style="text-align: right;">1861.718</td>
<td style="text-align: right;">1829.049</td>
</tr>
<tr>
<td style="text-align: left;">MAC</td>
<td style="text-align: right;">1816.133</td>
<td style="text-align: right;">1571.000</td>
<td style="text-align: right;">1663.136</td>
<td style="text-align: right;">1877.600</td>
<td style="text-align: right;">2015.000</td>
<td style="text-align: right;">2045.583</td>
</tr>
<tr>
<td style="text-align: left;">JCI</td>
<td style="text-align: right;">1815.211</td>
<td style="text-align: right;">1605.200</td>
<td style="text-align: right;">1677.111</td>
<td style="text-align: right;">1760.000</td>
<td style="text-align: right;">2049.000</td>
<td style="text-align: right;">1912.833</td>
</tr>
<tr>
<td style="text-align: left;">ZAM</td>
<td style="text-align: right;">1814.884</td>
<td style="text-align: right;">1629.531</td>
<td style="text-align: right;">1755.671</td>
<td style="text-align: right;">1818.106</td>
<td style="text-align: right;">1867.338</td>
<td style="text-align: right;">1849.274</td>
</tr>
<tr>
<td style="text-align: left;">SWE</td>
<td style="text-align: right;">1814.012</td>
<td style="text-align: right;">1647.873</td>
<td style="text-align: right;">1727.409</td>
<td style="text-align: right;">1806.102</td>
<td style="text-align: right;">1867.853</td>
<td style="text-align: right;">1852.099</td>
</tr>
<tr>
<td style="text-align: left;">YEM</td>
<td style="text-align: right;">1811.465</td>
<td style="text-align: right;">1733.167</td>
<td style="text-align: right;">1719.071</td>
<td style="text-align: right;">1786.409</td>
<td style="text-align: right;">1850.963</td>
<td style="text-align: right;">1952.667</td>
</tr>
<tr>
<td style="text-align: left;">BUL</td>
<td style="text-align: right;">1809.014</td>
<td style="text-align: right;">1551.984</td>
<td style="text-align: right;">1685.694</td>
<td style="text-align: right;">1868.179</td>
<td style="text-align: right;">1941.842</td>
<td style="text-align: right;">1935.230</td>
</tr>
<tr>
<td style="text-align: left;">GCI</td>
<td style="text-align: right;">1807.258</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1669.000</td>
<td style="text-align: right;">1840.400</td>
<td style="text-align: right;">1806.160</td>
</tr>
<tr>
<td style="text-align: left;">MKD</td>
<td style="text-align: right;">1806.698</td>
<td style="text-align: right;">1549.656</td>
<td style="text-align: right;">1687.822</td>
<td style="text-align: right;">1819.725</td>
<td style="text-align: right;">1913.323</td>
<td style="text-align: right;">1955.689</td>
</tr>
<tr>
<td style="text-align: left;">ISR</td>
<td style="text-align: right;">1805.835</td>
<td style="text-align: right;">1625.821</td>
<td style="text-align: right;">1736.651</td>
<td style="text-align: right;">1879.112</td>
<td style="text-align: right;">1907.580</td>
<td style="text-align: right;">1880.863</td>
</tr>
<tr>
<td style="text-align: left;">IRL</td>
<td style="text-align: right;">1803.740</td>
<td style="text-align: right;">1704.022</td>
<td style="text-align: right;">1794.072</td>
<td style="text-align: right;">1805.245</td>
<td style="text-align: right;">1833.701</td>
<td style="text-align: right;">1824.945</td>
</tr>
<tr>
<td style="text-align: left;">BRA</td>
<td style="text-align: right;">1799.521</td>
<td style="text-align: right;">1633.883</td>
<td style="text-align: right;">1718.892</td>
<td style="text-align: right;">1833.123</td>
<td style="text-align: right;">1857.223</td>
<td style="text-align: right;">1870.842</td>
</tr>
<tr>
<td style="text-align: left;">LBA</td>
<td style="text-align: right;">1799.030</td>
<td style="text-align: right;">1654.069</td>
<td style="text-align: right;">1737.232</td>
<td style="text-align: right;">1804.126</td>
<td style="text-align: right;">1823.570</td>
<td style="text-align: right;">1836.808</td>
</tr>
<tr>
<td style="text-align: left;">FAI</td>
<td style="text-align: right;">1795.896</td>
<td style="text-align: right;">1565.167</td>
<td style="text-align: right;">1723.567</td>
<td style="text-align: right;">1836.500</td>
<td style="text-align: right;">1877.744</td>
<td style="text-align: right;">1820.926</td>
</tr>
<tr>
<td style="text-align: left;">ARG</td>
<td style="text-align: right;">1791.929</td>
<td style="text-align: right;">1615.206</td>
<td style="text-align: right;">1716.111</td>
<td style="text-align: right;">1804.433</td>
<td style="text-align: right;">1827.549</td>
<td style="text-align: right;">1865.192</td>
</tr>
<tr>
<td style="text-align: left;">SUD</td>
<td style="text-align: right;">1791.369</td>
<td style="text-align: right;">1610.000</td>
<td style="text-align: right;">1760.571</td>
<td style="text-align: right;">1739.355</td>
<td style="text-align: right;">1825.689</td>
<td style="text-align: right;">1792.387</td>
</tr>
<tr>
<td style="text-align: left;">SVK</td>
<td style="text-align: right;">1791.283</td>
<td style="text-align: right;">1623.232</td>
<td style="text-align: right;">1735.569</td>
<td style="text-align: right;">1848.746</td>
<td style="text-align: right;">1869.105</td>
<td style="text-align: right;">1813.420</td>
</tr>
<tr>
<td style="text-align: left;">CMR</td>
<td style="text-align: right;">1791.188</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1784.000</td>
<td style="text-align: right;">1747.750</td>
<td style="text-align: right;">1814.929</td>
<td style="text-align: right;">1798.500</td>
</tr>
<tr>
<td style="text-align: left;">CHN</td>
<td style="text-align: right;">1789.047</td>
<td style="text-align: right;">1650.115</td>
<td style="text-align: right;">1796.522</td>
<td style="text-align: right;">2013.275</td>
<td style="text-align: right;">2102.283</td>
<td style="text-align: right;">2116.914</td>
</tr>
<tr>
<td style="text-align: left;">COL</td>
<td style="text-align: right;">1787.204</td>
<td style="text-align: right;">1603.270</td>
<td style="text-align: right;">1722.549</td>
<td style="text-align: right;">1860.575</td>
<td style="text-align: right;">1872.461</td>
<td style="text-align: right;">1850.054</td>
</tr>
<tr>
<td style="text-align: left;">MGL</td>
<td style="text-align: right;">1785.885</td>
<td style="text-align: right;">1645.798</td>
<td style="text-align: right;">1785.200</td>
<td style="text-align: right;">1903.688</td>
<td style="text-align: right;">1972.870</td>
<td style="text-align: right;">1876.831</td>
</tr>
<tr>
<td style="text-align: left;">COD</td>
<td style="text-align: right;">1785.800</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1646.000</td>
<td style="text-align: right;">1739.000</td>
<td style="text-align: right;">1819.143</td>
</tr>
<tr>
<td style="text-align: left;">RUS</td>
<td style="text-align: right;">1785.763</td>
<td style="text-align: right;">1551.026</td>
<td style="text-align: right;">1668.573</td>
<td style="text-align: right;">1925.998</td>
<td style="text-align: right;">2007.715</td>
<td style="text-align: right;">1953.646</td>
</tr>
<tr>
<td style="text-align: left;">DJI</td>
<td style="text-align: right;">1784.810</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1702.200</td>
<td style="text-align: right;">1840.400</td>
<td style="text-align: right;">1797.091</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">SEN</td>
<td style="text-align: right;">1777.794</td>
<td style="text-align: right;">1622.500</td>
<td style="text-align: right;">1734.000</td>
<td style="text-align: right;">1756.200</td>
<td style="text-align: right;">1771.000</td>
<td style="text-align: right;">1845.833</td>
</tr>
<tr>
<td style="text-align: left;">AHO</td>
<td style="text-align: right;">1776.115</td>
<td style="text-align: right;">1596.250</td>
<td style="text-align: right;">1722.765</td>
<td style="text-align: right;">1764.300</td>
<td style="text-align: right;">1857.750</td>
<td style="text-align: right;">1857.741</td>
</tr>
<tr>
<td style="text-align: left;">QAT</td>
<td style="text-align: right;">1776.000</td>
<td style="text-align: right;">1581.400</td>
<td style="text-align: right;">1578.800</td>
<td style="text-align: right;">1735.278</td>
<td style="text-align: right;">2067.333</td>
<td style="text-align: right;">2139.727</td>
</tr>
<tr>
<td style="text-align: left;">LBR</td>
<td style="text-align: right;">1775.732</td>
<td style="text-align: right;">1661.000</td>
<td style="text-align: right;">1753.571</td>
<td style="text-align: right;">1842.000</td>
<td style="text-align: right;">1816.353</td>
<td style="text-align: right;">1754.923</td>
</tr>
<tr>
<td style="text-align: left;">AFG</td>
<td style="text-align: right;">1774.857</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1639.933</td>
<td style="text-align: right;">1764.655</td>
<td style="text-align: right;">1812.086</td>
<td style="text-align: right;">1805.667</td>
</tr>
<tr>
<td style="text-align: left;">TJK</td>
<td style="text-align: right;">1774.670</td>
<td style="text-align: right;">1546.700</td>
<td style="text-align: right;">1700.291</td>
<td style="text-align: right;">1875.947</td>
<td style="text-align: right;">1938.450</td>
<td style="text-align: right;">1829.826</td>
</tr>
<tr>
<td style="text-align: left;">ANG</td>
<td style="text-align: right;">1772.699</td>
<td style="text-align: right;">1629.620</td>
<td style="text-align: right;">1719.624</td>
<td style="text-align: right;">1798.912</td>
<td style="text-align: right;">1843.198</td>
<td style="text-align: right;">1883.699</td>
</tr>
<tr>
<td style="text-align: left;">URU</td>
<td style="text-align: right;">1771.868</td>
<td style="text-align: right;">1574.036</td>
<td style="text-align: right;">1712.333</td>
<td style="text-align: right;">1818.333</td>
<td style="text-align: right;">1826.599</td>
<td style="text-align: right;">1805.913</td>
</tr>
<tr>
<td style="text-align: left;">SOM</td>
<td style="text-align: right;">1769.000</td>
<td style="text-align: right;">1607.000</td>
<td style="text-align: right;">1643.375</td>
<td style="text-align: right;">1854.000</td>
<td style="text-align: right;">1777.000</td>
<td style="text-align: right;">1774.500</td>
</tr>
<tr>
<td style="text-align: left;">BEL</td>
<td style="text-align: right;">1767.594</td>
<td style="text-align: right;">1627.619</td>
<td style="text-align: right;">1718.309</td>
<td style="text-align: right;">1800.933</td>
<td style="text-align: right;">1827.356</td>
<td style="text-align: right;">1788.958</td>
</tr>
<tr>
<td style="text-align: left;">PUR</td>
<td style="text-align: right;">1767.012</td>
<td style="text-align: right;">1593.525</td>
<td style="text-align: right;">1687.990</td>
<td style="text-align: right;">1802.467</td>
<td style="text-align: right;">1854.774</td>
<td style="text-align: right;">1818.852</td>
</tr>
<tr>
<td style="text-align: left;">BLR</td>
<td style="text-align: right;">1766.353</td>
<td style="text-align: right;">1566.557</td>
<td style="text-align: right;">1688.185</td>
<td style="text-align: right;">1946.896</td>
<td style="text-align: right;">1985.412</td>
<td style="text-align: right;">1937.695</td>
</tr>
<tr>
<td style="text-align: left;">NRU</td>
<td style="text-align: right;">1765.895</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1731.000</td>
<td style="text-align: right;">1787.143</td>
<td style="text-align: right;">1785.000</td>
</tr>
<tr>
<td style="text-align: left;">ARM</td>
<td style="text-align: right;">1765.839</td>
<td style="text-align: right;">1593.025</td>
<td style="text-align: right;">1717.538</td>
<td style="text-align: right;">1947.189</td>
<td style="text-align: right;">2023.177</td>
<td style="text-align: right;">1989.286</td>
</tr>
<tr>
<td style="text-align: left;">EGY</td>
<td style="text-align: right;">1765.184</td>
<td style="text-align: right;">1578.363</td>
<td style="text-align: right;">1659.008</td>
<td style="text-align: right;">1781.894</td>
<td style="text-align: right;">1826.825</td>
<td style="text-align: right;">1871.251</td>
</tr>
<tr>
<td style="text-align: left;">MEX</td>
<td style="text-align: right;">1763.813</td>
<td style="text-align: right;">1612.246</td>
<td style="text-align: right;">1731.828</td>
<td style="text-align: right;">1816.281</td>
<td style="text-align: right;">1834.551</td>
<td style="text-align: right;">1858.690</td>
</tr>
<tr>
<td style="text-align: left;">STP</td>
<td style="text-align: right;">1762.257</td>
<td style="text-align: right;">1553.000</td>
<td style="text-align: right;">1702.812</td>
<td style="text-align: right;">1766.000</td>
<td style="text-align: right;">1826.111</td>
<td style="text-align: right;">1858.000</td>
</tr>
<tr>
<td style="text-align: left;">LTU</td>
<td style="text-align: right;">1761.957</td>
<td style="text-align: right;">1544.485</td>
<td style="text-align: right;">1678.515</td>
<td style="text-align: right;">1860.834</td>
<td style="text-align: right;">1911.551</td>
<td style="text-align: right;">1854.977</td>
</tr>
<tr>
<td style="text-align: left;">IVB</td>
<td style="text-align: right;">1760.000</td>
<td style="text-align: right;">1578.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1549.000</td>
<td style="text-align: right;">1858.250</td>
</tr>
<tr>
<td style="text-align: left;">ESP</td>
<td style="text-align: right;">1758.335</td>
<td style="text-align: right;">1601.683</td>
<td style="text-align: right;">1682.743</td>
<td style="text-align: right;">1798.489</td>
<td style="text-align: right;">1822.215</td>
<td style="text-align: right;">1791.122</td>
</tr>
<tr>
<td style="text-align: left;">RWA</td>
<td style="text-align: right;">1757.137</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1735.417</td>
<td style="text-align: right;">1720.667</td>
<td style="text-align: right;">1762.929</td>
<td style="text-align: right;">1804.615</td>
</tr>
<tr>
<td style="text-align: left;">KSA</td>
<td style="text-align: right;">1756.529</td>
<td style="text-align: right;">1631.250</td>
<td style="text-align: right;">1758.257</td>
<td style="text-align: right;">1747.457</td>
<td style="text-align: right;">1755.302</td>
<td style="text-align: right;">1802.875</td>
</tr>
<tr>
<td style="text-align: left;">SMR</td>
<td style="text-align: right;">1754.818</td>
<td style="text-align: right;">1804.000</td>
<td style="text-align: right;">1697.667</td>
<td style="text-align: right;">1509.750</td>
<td style="text-align: right;">1746.200</td>
<td style="text-align: right;">1882.111</td>
</tr>
<tr>
<td style="text-align: left;">BER</td>
<td style="text-align: right;">1753.610</td>
<td style="text-align: right;">1538.000</td>
<td style="text-align: right;">1524.778</td>
<td style="text-align: right;">1750.500</td>
<td style="text-align: right;">1770.773</td>
<td style="text-align: right;">1802.744</td>
</tr>
<tr>
<td style="text-align: left;">PAK</td>
<td style="text-align: right;">1753.483</td>
<td style="text-align: right;">1573.774</td>
<td style="text-align: right;">1708.760</td>
<td style="text-align: right;">1726.453</td>
<td style="text-align: right;">1751.643</td>
<td style="text-align: right;">1841.503</td>
</tr>
<tr>
<td style="text-align: left;">CHI</td>
<td style="text-align: right;">1752.812</td>
<td style="text-align: right;">1567.631</td>
<td style="text-align: right;">1652.750</td>
<td style="text-align: right;">1792.551</td>
<td style="text-align: right;">1853.916</td>
<td style="text-align: right;">1878.575</td>
</tr>
<tr>
<td style="text-align: left;">HAI</td>
<td style="text-align: right;">1752.708</td>
<td style="text-align: right;">1586.400</td>
<td style="text-align: right;">1689.560</td>
<td style="text-align: right;">1879.375</td>
<td style="text-align: right;">1865.571</td>
<td style="text-align: right;">1955.000</td>
</tr>
<tr>
<td style="text-align: left;">PLE</td>
<td style="text-align: right;">1752.403</td>
<td style="text-align: right;">1672.600</td>
<td style="text-align: right;">1724.000</td>
<td style="text-align: right;">1749.044</td>
<td style="text-align: right;">1785.938</td>
<td style="text-align: right;">1823.544</td>
</tr>
<tr>
<td style="text-align: left;">PHI</td>
<td style="text-align: right;">1752.158</td>
<td style="text-align: right;">1601.643</td>
<td style="text-align: right;">1723.636</td>
<td style="text-align: right;">1858.963</td>
<td style="text-align: right;">1837.525</td>
<td style="text-align: right;">1883.052</td>
</tr>
<tr>
<td style="text-align: left;">LAT</td>
<td style="text-align: right;">1750.886</td>
<td style="text-align: right;">1569.206</td>
<td style="text-align: right;">1687.406</td>
<td style="text-align: right;">1891.463</td>
<td style="text-align: right;">1952.031</td>
<td style="text-align: right;">1859.164</td>
</tr>
<tr>
<td style="text-align: left;">IRQ</td>
<td style="text-align: right;">1750.344</td>
<td style="text-align: right;">1570.876</td>
<td style="text-align: right;">1661.830</td>
<td style="text-align: right;">1728.556</td>
<td style="text-align: right;">1803.357</td>
<td style="text-align: right;">1862.342</td>
</tr>
<tr>
<td style="text-align: left;">VIE</td>
<td style="text-align: right;">1750.237</td>
<td style="text-align: right;">1613.806</td>
<td style="text-align: right;">1781.062</td>
<td style="text-align: right;">1913.828</td>
<td style="text-align: right;">1996.055</td>
<td style="text-align: right;">2005.836</td>
</tr>
<tr>
<td style="text-align: left;">ERI</td>
<td style="text-align: right;">1749.833</td>
<td style="text-align: right;">1685.000</td>
<td style="text-align: right;">1686.833</td>
<td style="text-align: right;">1728.667</td>
<td style="text-align: right;">1868.667</td>
<td style="text-align: right;">1856.500</td>
</tr>
<tr>
<td style="text-align: left;">TKM</td>
<td style="text-align: right;">1749.208</td>
<td style="text-align: right;">1572.403</td>
<td style="text-align: right;">1778.464</td>
<td style="text-align: right;">1906.360</td>
<td style="text-align: right;">1996.183</td>
<td style="text-align: right;">1980.789</td>
</tr>
<tr>
<td style="text-align: left;">CIV</td>
<td style="text-align: right;">1748.987</td>
<td style="text-align: right;">1564.000</td>
<td style="text-align: right;">1707.529</td>
<td style="text-align: right;">1767.091</td>
<td style="text-align: right;">1820.062</td>
<td style="text-align: right;">1795.846</td>
</tr>
<tr>
<td style="text-align: left;">ITA</td>
<td style="text-align: right;">1747.754</td>
<td style="text-align: right;">1599.773</td>
<td style="text-align: right;">1691.725</td>
<td style="text-align: right;">1784.020</td>
<td style="text-align: right;">1792.543</td>
<td style="text-align: right;">1786.983</td>
</tr>
<tr>
<td style="text-align: left;">MAW</td>
<td style="text-align: right;">1747.283</td>
<td style="text-align: right;">1582.417</td>
<td style="text-align: right;">1690.333</td>
<td style="text-align: right;">1755.785</td>
<td style="text-align: right;">1794.317</td>
<td style="text-align: right;">1738.742</td>
</tr>
<tr>
<td style="text-align: left;">FIJ</td>
<td style="text-align: right;">1746.569</td>
<td style="text-align: right;">1536.333</td>
<td style="text-align: right;">1689.000</td>
<td style="text-align: right;">1708.647</td>
<td style="text-align: right;">1756.900</td>
<td style="text-align: right;">1887.417</td>
</tr>
<tr>
<td style="text-align: left;">MRI</td>
<td style="text-align: right;">1746.341</td>
<td style="text-align: right;">1527.250</td>
<td style="text-align: right;">1635.571</td>
<td style="text-align: right;">1766.692</td>
<td style="text-align: right;">1774.300</td>
<td style="text-align: right;">1857.100</td>
</tr>
<tr>
<td style="text-align: left;">COM</td>
<td style="text-align: right;">1744.667</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1714.500</td>
<td style="text-align: right;">1759.750</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">NZL</td>
<td style="text-align: right;">1744.593</td>
<td style="text-align: right;">1612.398</td>
<td style="text-align: right;">1711.161</td>
<td style="text-align: right;">1804.520</td>
<td style="text-align: right;">1826.466</td>
<td style="text-align: right;">1829.599</td>
</tr>
<tr>
<td style="text-align: left;">GUA</td>
<td style="text-align: right;">1743.695</td>
<td style="text-align: right;">1643.567</td>
<td style="text-align: right;">1694.167</td>
<td style="text-align: right;">1800.736</td>
<td style="text-align: right;">1812.736</td>
<td style="text-align: right;">1790.325</td>
</tr>
<tr>
<td style="text-align: left;">ZIM</td>
<td style="text-align: right;">1743.669</td>
<td style="text-align: right;">1621.145</td>
<td style="text-align: right;">1715.016</td>
<td style="text-align: right;">1780.671</td>
<td style="text-align: right;">1832.753</td>
<td style="text-align: right;">1740.550</td>
</tr>
<tr>
<td style="text-align: left;">NCA</td>
<td style="text-align: right;">1743.103</td>
<td style="text-align: right;">1627.472</td>
<td style="text-align: right;">1696.507</td>
<td style="text-align: right;">1756.278</td>
<td style="text-align: right;">1784.082</td>
<td style="text-align: right;">1858.719</td>
</tr>
<tr>
<td style="text-align: left;">SEY</td>
<td style="text-align: right;">1742.929</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1574.000</td>
<td style="text-align: right;">1738.000</td>
<td style="text-align: right;">2003.250</td>
<td style="text-align: right;">1571.333</td>
</tr>
<tr>
<td style="text-align: left;">ARU</td>
<td style="text-align: right;">1741.731</td>
<td style="text-align: right;">1540.375</td>
<td style="text-align: right;">1657.500</td>
<td style="text-align: right;">1868.125</td>
<td style="text-align: right;">1738.625</td>
<td style="text-align: right;">1792.316</td>
</tr>
<tr>
<td style="text-align: left;">BIZ</td>
<td style="text-align: right;">1739.500</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1739.500</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">NOR</td>
<td style="text-align: right;">1736.251</td>
<td style="text-align: right;">1632.969</td>
<td style="text-align: right;">1710.937</td>
<td style="text-align: right;">1762.582</td>
<td style="text-align: right;">1744.927</td>
<td style="text-align: right;">1756.748</td>
</tr>
<tr>
<td style="text-align: left;">BDI</td>
<td style="text-align: right;">1735.478</td>
<td style="text-align: right;">1419.000</td>
<td style="text-align: right;">1672.000</td>
<td style="text-align: right;">1785.143</td>
<td style="text-align: right;">1824.600</td>
<td style="text-align: right;">1830.000</td>
</tr>
<tr>
<td style="text-align: left;">MDA</td>
<td style="text-align: right;">1733.096</td>
<td style="text-align: right;">1547.523</td>
<td style="text-align: right;">1690.387</td>
<td style="text-align: right;">1863.486</td>
<td style="text-align: right;">1968.414</td>
<td style="text-align: right;">1824.235</td>
</tr>
<tr>
<td style="text-align: left;">BAN</td>
<td style="text-align: right;">1732.601</td>
<td style="text-align: right;">1596.781</td>
<td style="text-align: right;">1685.882</td>
<td style="text-align: right;">1746.598</td>
<td style="text-align: right;">1788.243</td>
<td style="text-align: right;">1783.635</td>
</tr>
<tr>
<td style="text-align: left;">GEO</td>
<td style="text-align: right;">1732.362</td>
<td style="text-align: right;">1540.491</td>
<td style="text-align: right;">1635.934</td>
<td style="text-align: right;">1860.987</td>
<td style="text-align: right;">2012.646</td>
<td style="text-align: right;">1931.636</td>
</tr>
<tr>
<td style="text-align: left;">LBN</td>
<td style="text-align: right;">1731.875</td>
<td style="text-align: right;">1611.902</td>
<td style="text-align: right;">1663.969</td>
<td style="text-align: right;">1761.493</td>
<td style="text-align: right;">1834.411</td>
<td style="text-align: right;">1809.177</td>
</tr>
<tr>
<td style="text-align: left;">MTN</td>
<td style="text-align: right;">1731.832</td>
<td style="text-align: right;">1626.833</td>
<td style="text-align: right;">1680.324</td>
<td style="text-align: right;">1685.333</td>
<td style="text-align: right;">1769.387</td>
<td style="text-align: right;">1806.758</td>
</tr>
<tr>
<td style="text-align: left;">UZB</td>
<td style="text-align: right;">1731.209</td>
<td style="text-align: right;">1589.633</td>
<td style="text-align: right;">1711.132</td>
<td style="text-align: right;">1935.111</td>
<td style="text-align: right;">1941.866</td>
<td style="text-align: right;">1858.493</td>
</tr>
<tr>
<td style="text-align: left;">CAF</td>
<td style="text-align: right;">1729.250</td>
<td style="text-align: right;">1676.250</td>
<td style="text-align: right;">1692.000</td>
<td style="text-align: right;">1850.250</td>
<td style="text-align: right;">1701.000</td>
<td style="text-align: right;">1691.000</td>
</tr>
<tr>
<td style="text-align: left;">BAR</td>
<td style="text-align: right;">1728.599</td>
<td style="text-align: right;">1585.824</td>
<td style="text-align: right;">1582.547</td>
<td style="text-align: right;">1803.949</td>
<td style="text-align: right;">1852.450</td>
<td style="text-align: right;">1872.606</td>
</tr>
<tr>
<td style="text-align: left;">ROU</td>
<td style="text-align: right;">1726.929</td>
<td style="text-align: right;">1563.745</td>
<td style="text-align: right;">1655.387</td>
<td style="text-align: right;">1806.558</td>
<td style="text-align: right;">1859.146</td>
<td style="text-align: right;">1824.800</td>
</tr>
<tr>
<td style="text-align: left;">ESA</td>
<td style="text-align: right;">1725.802</td>
<td style="text-align: right;">1563.373</td>
<td style="text-align: right;">1682.018</td>
<td style="text-align: right;">1798.281</td>
<td style="text-align: right;">1840.854</td>
<td style="text-align: right;">1768.444</td>
</tr>
<tr>
<td style="text-align: left;">VEN</td>
<td style="text-align: right;">1725.752</td>
<td style="text-align: right;">1555.535</td>
<td style="text-align: right;">1637.087</td>
<td style="text-align: right;">1837.850</td>
<td style="text-align: right;">1836.133</td>
<td style="text-align: right;">1808.744</td>
</tr>
<tr>
<td style="text-align: left;">POR</td>
<td style="text-align: right;">1725.109</td>
<td style="text-align: right;">1579.820</td>
<td style="text-align: right;">1636.606</td>
<td style="text-align: right;">1753.926</td>
<td style="text-align: right;">1814.254</td>
<td style="text-align: right;">1792.894</td>
</tr>
<tr>
<td style="text-align: left;">NCL</td>
<td style="text-align: right;">1724.667</td>
<td style="text-align: right;">1584.750</td>
<td style="text-align: right;">1699.333</td>
<td style="text-align: right;">1817.000</td>
<td style="text-align: right;">1914.000</td>
<td style="text-align: right;">1842.667</td>
</tr>
<tr>
<td style="text-align: left;">AUS</td>
<td style="text-align: right;">1723.916</td>
<td style="text-align: right;">1611.822</td>
<td style="text-align: right;">1690.466</td>
<td style="text-align: right;">1777.035</td>
<td style="text-align: right;">1795.085</td>
<td style="text-align: right;">1771.224</td>
</tr>
<tr>
<td style="text-align: left;">POL</td>
<td style="text-align: right;">1723.632</td>
<td style="text-align: right;">1575.532</td>
<td style="text-align: right;">1641.729</td>
<td style="text-align: right;">1769.764</td>
<td style="text-align: right;">1831.398</td>
<td style="text-align: right;">1808.393</td>
</tr>
<tr>
<td style="text-align: left;">MOZ</td>
<td style="text-align: right;">1722.856</td>
<td style="text-align: right;">1738.000</td>
<td style="text-align: right;">1679.960</td>
<td style="text-align: right;">1734.261</td>
<td style="text-align: right;">1794.370</td>
<td style="text-align: right;">1682.125</td>
</tr>
<tr>
<td style="text-align: left;">GAB</td>
<td style="text-align: right;">1722.667</td>
<td style="text-align: right;">1513.500</td>
<td style="text-align: right;">1703.500</td>
<td style="text-align: right;">1840.000</td>
<td style="text-align: right;">1697.125</td>
<td style="text-align: right;">1994.500</td>
</tr>
<tr>
<td style="text-align: left;">ECU</td>
<td style="text-align: right;">1718.539</td>
<td style="text-align: right;">1546.694</td>
<td style="text-align: right;">1634.288</td>
<td style="text-align: right;">1800.654</td>
<td style="text-align: right;">1954.661</td>
<td style="text-align: right;">1926.311</td>
</tr>
<tr>
<td style="text-align: left;">JAM</td>
<td style="text-align: right;">1718.516</td>
<td style="text-align: right;">1566.800</td>
<td style="text-align: right;">1662.296</td>
<td style="text-align: right;">1814.869</td>
<td style="text-align: right;">1879.710</td>
<td style="text-align: right;">1897.700</td>
</tr>
<tr>
<td style="text-align: left;">TUN</td>
<td style="text-align: right;">1713.884</td>
<td style="text-align: right;">1563.854</td>
<td style="text-align: right;">1619.346</td>
<td style="text-align: right;">1765.980</td>
<td style="text-align: right;">1857.945</td>
<td style="text-align: right;">1833.487</td>
</tr>
<tr>
<td style="text-align: left;">FRA</td>
<td style="text-align: right;">1712.587</td>
<td style="text-align: right;">1577.251</td>
<td style="text-align: right;">1654.285</td>
<td style="text-align: right;">1773.954</td>
<td style="text-align: right;">1798.651</td>
<td style="text-align: right;">1740.547</td>
</tr>
<tr>
<td style="text-align: left;">ISV</td>
<td style="text-align: right;">1711.560</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1689.000</td>
<td style="text-align: right;">1750.667</td>
<td style="text-align: right;">1685.000</td>
<td style="text-align: right;">1693.833</td>
</tr>
<tr>
<td style="text-align: left;">MLT</td>
<td style="text-align: right;">1708.945</td>
<td style="text-align: right;">1552.846</td>
<td style="text-align: right;">1662.268</td>
<td style="text-align: right;">1711.000</td>
<td style="text-align: right;">1785.750</td>
<td style="text-align: right;">1781.333</td>
</tr>
<tr>
<td style="text-align: left;">CAM</td>
<td style="text-align: right;">1706.462</td>
<td style="text-align: right;">1591.250</td>
<td style="text-align: right;">1677.667</td>
<td style="text-align: right;">1539.000</td>
<td style="text-align: right;">1565.500</td>
<td style="text-align: right;">2038.667</td>
</tr>
<tr>
<td style="text-align: left;">GEQ</td>
<td style="text-align: right;">1704.333</td>
<td style="text-align: right;">2332.000</td>
<td style="text-align: right;">1537.000</td>
<td style="text-align: right;">1662.200</td>
<td style="text-align: right;">1830.500</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">HON</td>
<td style="text-align: right;">1704.066</td>
<td style="text-align: right;">1548.124</td>
<td style="text-align: right;">1680.491</td>
<td style="text-align: right;">1749.448</td>
<td style="text-align: right;">1787.600</td>
<td style="text-align: right;">1836.222</td>
</tr>
<tr>
<td style="text-align: left;">GUM</td>
<td style="text-align: right;">1702.170</td>
<td style="text-align: right;">1596.381</td>
<td style="text-align: right;">1713.000</td>
<td style="text-align: right;">1818.556</td>
<td style="text-align: right;">1694.786</td>
<td style="text-align: right;">1737.273</td>
</tr>
<tr>
<td style="text-align: left;">NEP</td>
<td style="text-align: right;">1700.570</td>
<td style="text-align: right;">1608.720</td>
<td style="text-align: right;">1640.565</td>
<td style="text-align: right;">1728.802</td>
<td style="text-align: right;">1722.394</td>
<td style="text-align: right;">1735.595</td>
</tr>
<tr>
<td style="text-align: left;">LCA</td>
<td style="text-align: right;">1699.000</td>
<td style="text-align: right;">1600.500</td>
<td style="text-align: right;">1694.571</td>
<td style="text-align: right;">1874.000</td>
<td style="text-align: right;">1697.571</td>
<td style="text-align: right;">1661.143</td>
</tr>
<tr>
<td style="text-align: left;">ALG</td>
<td style="text-align: right;">1694.578</td>
<td style="text-align: right;">1524.980</td>
<td style="text-align: right;">1627.223</td>
<td style="text-align: right;">1723.114</td>
<td style="text-align: right;">1818.231</td>
<td style="text-align: right;">1830.188</td>
</tr>
<tr>
<td style="text-align: left;">BAH</td>
<td style="text-align: right;">1690.278</td>
<td style="text-align: right;">1505.667</td>
<td style="text-align: right;">1656.059</td>
<td style="text-align: right;">1706.667</td>
<td style="text-align: right;">1791.000</td>
<td style="text-align: right;">1739.696</td>
</tr>
<tr>
<td style="text-align: left;">JOR</td>
<td style="text-align: right;">1689.961</td>
<td style="text-align: right;">1559.033</td>
<td style="text-align: right;">1610.160</td>
<td style="text-align: right;">1716.836</td>
<td style="text-align: right;">1757.026</td>
<td style="text-align: right;">1827.640</td>
</tr>
<tr>
<td style="text-align: left;">SLE</td>
<td style="text-align: right;">1689.706</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1585.000</td>
<td style="text-align: right;">1621.714</td>
<td style="text-align: right;">1696.250</td>
<td style="text-align: right;">1854.500</td>
</tr>
<tr>
<td style="text-align: left;">UAE</td>
<td style="text-align: right;">1688.203</td>
<td style="text-align: right;">1525.168</td>
<td style="text-align: right;">1621.132</td>
<td style="text-align: right;">1818.837</td>
<td style="text-align: right;">1973.056</td>
<td style="text-align: right;">2039.769</td>
</tr>
<tr>
<td style="text-align: left;">GRE</td>
<td style="text-align: right;">1687.907</td>
<td style="text-align: right;">1557.444</td>
<td style="text-align: right;">1610.567</td>
<td style="text-align: right;">1745.093</td>
<td style="text-align: right;">1776.318</td>
<td style="text-align: right;">1768.186</td>
</tr>
<tr>
<td style="text-align: left;">PAR</td>
<td style="text-align: right;">1685.308</td>
<td style="text-align: right;">1527.228</td>
<td style="text-align: right;">1646.392</td>
<td style="text-align: right;">1749.211</td>
<td style="text-align: right;">1759.724</td>
<td style="text-align: right;">1822.874</td>
</tr>
<tr>
<td style="text-align: left;">BOT</td>
<td style="text-align: right;">1682.289</td>
<td style="text-align: right;">1563.830</td>
<td style="text-align: right;">1641.756</td>
<td style="text-align: right;">1733.067</td>
<td style="text-align: right;">1826.102</td>
<td style="text-align: right;">1835.231</td>
</tr>
<tr>
<td style="text-align: left;">SKN</td>
<td style="text-align: right;">1682.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1682.000</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">AZE</td>
<td style="text-align: right;">1681.802</td>
<td style="text-align: right;">1538.668</td>
<td style="text-align: right;">1643.735</td>
<td style="text-align: right;">1858.697</td>
<td style="text-align: right;">1985.359</td>
<td style="text-align: right;">1879.518</td>
</tr>
<tr>
<td style="text-align: left;">SGP</td>
<td style="text-align: right;">1679.972</td>
<td style="text-align: right;">1553.884</td>
<td style="text-align: right;">1654.903</td>
<td style="text-align: right;">1873.956</td>
<td style="text-align: right;">1798.661</td>
<td style="text-align: right;">1896.632</td>
</tr>
<tr>
<td style="text-align: left;">CRC</td>
<td style="text-align: right;">1679.860</td>
<td style="text-align: right;">1544.426</td>
<td style="text-align: right;">1605.601</td>
<td style="text-align: right;">1763.059</td>
<td style="text-align: right;">1792.072</td>
<td style="text-align: right;">1806.070</td>
</tr>
<tr>
<td style="text-align: left;">BUR</td>
<td style="text-align: right;">1679.647</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1658.000</td>
<td style="text-align: right;">1628.200</td>
<td style="text-align: right;">1709.700</td>
</tr>
<tr>
<td style="text-align: left;">TLS</td>
<td style="text-align: right;">1676.829</td>
<td style="text-align: right;">1663.000</td>
<td style="text-align: right;">1647.737</td>
<td style="text-align: right;">1658.444</td>
<td style="text-align: right;">1748.400</td>
<td style="text-align: right;">1710.909</td>
</tr>
<tr>
<td style="text-align: left;">BRN</td>
<td style="text-align: right;">1676.424</td>
<td style="text-align: right;">1506.667</td>
<td style="text-align: right;">1583.739</td>
<td style="text-align: right;">1664.286</td>
<td style="text-align: right;">1785.706</td>
<td style="text-align: right;">2027.556</td>
</tr>
<tr>
<td style="text-align: left;">MAD</td>
<td style="text-align: right;">1676.387</td>
<td style="text-align: right;">1557.972</td>
<td style="text-align: right;">1642.066</td>
<td style="text-align: right;">1720.475</td>
<td style="text-align: right;">1734.838</td>
<td style="text-align: right;">1739.287</td>
</tr>
<tr>
<td style="text-align: left;">GHA</td>
<td style="text-align: right;">1675.475</td>
<td style="text-align: right;">1618.952</td>
<td style="text-align: right;">1606.548</td>
<td style="text-align: right;">1712.578</td>
<td style="text-align: right;">1693.125</td>
<td style="text-align: right;">1743.833</td>
</tr>
<tr>
<td style="text-align: left;">UGA</td>
<td style="text-align: right;">1672.232</td>
<td style="text-align: right;">1541.450</td>
<td style="text-align: right;">1630.704</td>
<td style="text-align: right;">1774.096</td>
<td style="text-align: right;">1810.212</td>
<td style="text-align: right;">1866.212</td>
</tr>
<tr>
<td style="text-align: left;">PAN</td>
<td style="text-align: right;">1670.979</td>
<td style="text-align: right;">1547.654</td>
<td style="text-align: right;">1631.721</td>
<td style="text-align: right;">1766.157</td>
<td style="text-align: right;">1813.247</td>
<td style="text-align: right;">1779.884</td>
</tr>
<tr>
<td style="text-align: left;">TTO</td>
<td style="text-align: right;">1670.975</td>
<td style="text-align: right;">1526.550</td>
<td style="text-align: right;">1603.365</td>
<td style="text-align: right;">1824.872</td>
<td style="text-align: right;">1838.381</td>
<td style="text-align: right;">1795.192</td>
</tr>
<tr>
<td style="text-align: left;">RSA</td>
<td style="text-align: right;">1669.936</td>
<td style="text-align: right;">1569.493</td>
<td style="text-align: right;">1629.361</td>
<td style="text-align: right;">1760.540</td>
<td style="text-align: right;">1786.192</td>
<td style="text-align: right;">1733.461</td>
</tr>
<tr>
<td style="text-align: left;">THA</td>
<td style="text-align: right;">1668.532</td>
<td style="text-align: right;">1529.036</td>
<td style="text-align: right;">1609.082</td>
<td style="text-align: right;">1707.861</td>
<td style="text-align: right;">1758.484</td>
<td style="text-align: right;">1899.463</td>
</tr>
<tr>
<td style="text-align: left;">TOG</td>
<td style="text-align: right;">1667.915</td>
<td style="text-align: right;">1517.000</td>
<td style="text-align: right;">1664.727</td>
<td style="text-align: right;">1631.769</td>
<td style="text-align: right;">1723.786</td>
<td style="text-align: right;">1697.167</td>
</tr>
<tr>
<td style="text-align: left;">HKG</td>
<td style="text-align: right;">1665.985</td>
<td style="text-align: right;">1583.018</td>
<td style="text-align: right;">1641.708</td>
<td style="text-align: right;">1735.033</td>
<td style="text-align: right;">1776.684</td>
<td style="text-align: right;">1828.281</td>
</tr>
<tr>
<td style="text-align: left;">TPE</td>
<td style="text-align: right;">1665.955</td>
<td style="text-align: right;">1591.896</td>
<td style="text-align: right;">1642.792</td>
<td style="text-align: right;">1837.167</td>
<td style="text-align: right;">1810.857</td>
<td style="text-align: right;">1781.091</td>
</tr>
<tr>
<td style="text-align: left;">CPV</td>
<td style="text-align: right;">1658.634</td>
<td style="text-align: right;">1512.100</td>
<td style="text-align: right;">1605.318</td>
<td style="text-align: right;">1693.333</td>
<td style="text-align: right;">1764.158</td>
<td style="text-align: right;">1658.906</td>
</tr>
<tr>
<td style="text-align: left;">SUR</td>
<td style="text-align: right;">1657.051</td>
<td style="text-align: right;">1570.931</td>
<td style="text-align: right;">1592.560</td>
<td style="text-align: right;">1792.000</td>
<td style="text-align: right;">1895.125</td>
<td style="text-align: right;">1969.900</td>
</tr>
<tr>
<td style="text-align: left;">TAN</td>
<td style="text-align: right;">1656.741</td>
<td style="text-align: right;">1619.375</td>
<td style="text-align: right;">1616.952</td>
<td style="text-align: right;">1631.500</td>
<td style="text-align: right;">1668.000</td>
<td style="text-align: right;">1732.706</td>
</tr>
<tr>
<td style="text-align: left;">GRL</td>
<td style="text-align: right;">1655.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1655.000</td>
</tr>
<tr>
<td style="text-align: left;">CYP</td>
<td style="text-align: right;">1654.275</td>
<td style="text-align: right;">1534.172</td>
<td style="text-align: right;">1647.386</td>
<td style="text-align: right;">1678.379</td>
<td style="text-align: right;">1740.735</td>
<td style="text-align: right;">1763.648</td>
</tr>
<tr>
<td style="text-align: left;">NAM</td>
<td style="text-align: right;">1653.654</td>
<td style="text-align: right;">1550.100</td>
<td style="text-align: right;">1627.211</td>
<td style="text-align: right;">1724.524</td>
<td style="text-align: right;">1739.154</td>
<td style="text-align: right;">1853.429</td>
</tr>
<tr>
<td style="text-align: left;">GUY</td>
<td style="text-align: right;">1652.548</td>
<td style="text-align: right;">1580.000</td>
<td style="text-align: right;">1589.458</td>
<td style="text-align: right;">1710.700</td>
<td style="text-align: right;">1754.500</td>
<td style="text-align: right;">1685.900</td>
</tr>
<tr>
<td style="text-align: left;">KAZ</td>
<td style="text-align: right;">1649.046</td>
<td style="text-align: right;">1546.658</td>
<td style="text-align: right;">1630.051</td>
<td style="text-align: right;">1849.057</td>
<td style="text-align: right;">1888.610</td>
<td style="text-align: right;">1783.206</td>
</tr>
<tr>
<td style="text-align: left;">VIN</td>
<td style="text-align: right;">1647.625</td>
<td style="text-align: right;">1684.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1521.500</td>
<td style="text-align: right;">1674.667</td>
<td style="text-align: right;">1715.000</td>
</tr>
<tr>
<td style="text-align: left;">PER</td>
<td style="text-align: right;">1647.075</td>
<td style="text-align: right;">1531.201</td>
<td style="text-align: right;">1622.136</td>
<td style="text-align: right;">1780.478</td>
<td style="text-align: right;">1796.865</td>
<td style="text-align: right;">1835.780</td>
</tr>
<tr>
<td style="text-align: left;">TUR</td>
<td style="text-align: right;">1645.514</td>
<td style="text-align: right;">1579.172</td>
<td style="text-align: right;">1617.004</td>
<td style="text-align: right;">1708.534</td>
<td style="text-align: right;">1716.313</td>
<td style="text-align: right;">1682.371</td>
</tr>
<tr>
<td style="text-align: left;">PLW</td>
<td style="text-align: right;">1637.725</td>
<td style="text-align: right;">1510.000</td>
<td style="text-align: right;">1553.467</td>
<td style="text-align: right;">1618.000</td>
<td style="text-align: right;">1626.600</td>
<td style="text-align: right;">1675.389</td>
</tr>
<tr>
<td style="text-align: left;">MAS</td>
<td style="text-align: right;">1636.767</td>
<td style="text-align: right;">1556.753</td>
<td style="text-align: right;">1611.181</td>
<td style="text-align: right;">1734.266</td>
<td style="text-align: right;">1763.724</td>
<td style="text-align: right;">1738.111</td>
</tr>
<tr>
<td style="text-align: left;">KGZ</td>
<td style="text-align: right;">1634.813</td>
<td style="text-align: right;">1546.794</td>
<td style="text-align: right;">1632.714</td>
<td style="text-align: right;">1820.753</td>
<td style="text-align: right;">1776.388</td>
<td style="text-align: right;">1699.179</td>
</tr>
<tr>
<td style="text-align: left;">IRI</td>
<td style="text-align: right;">1633.108</td>
<td style="text-align: right;">1546.181</td>
<td style="text-align: right;">1615.503</td>
<td style="text-align: right;">1697.953</td>
<td style="text-align: right;">1688.717</td>
<td style="text-align: right;">1678.163</td>
</tr>
<tr>
<td style="text-align: left;">KEN</td>
<td style="text-align: right;">1630.705</td>
<td style="text-align: right;">1534.590</td>
<td style="text-align: right;">1618.333</td>
<td style="text-align: right;">1656.342</td>
<td style="text-align: right;">1723.592</td>
<td style="text-align: right;">1722.803</td>
</tr>
<tr>
<td style="text-align: left;">NIG</td>
<td style="text-align: right;">1629.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1629.000</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr>
<td style="text-align: left;">CAY</td>
<td style="text-align: right;">1627.710</td>
<td style="text-align: right;">1527.286</td>
<td style="text-align: right;">1686.667</td>
<td style="text-align: right;">1636.500</td>
<td style="text-align: right;">1779.750</td>
<td style="text-align: right;">1725.333</td>
</tr>
<tr>
<td style="text-align: left;">BOL</td>
<td style="text-align: right;">1626.757</td>
<td style="text-align: right;">1521.631</td>
<td style="text-align: right;">1606.425</td>
<td style="text-align: right;">1768.005</td>
<td style="text-align: right;">1767.882</td>
<td style="text-align: right;">1789.258</td>
</tr>
<tr>
<td style="text-align: left;">BHU</td>
<td style="text-align: right;">1626.000</td>
<td style="text-align: right;">1574.429</td>
<td style="text-align: right;">1602.200</td>
<td style="text-align: right;">1653.100</td>
<td style="text-align: right;">1730.667</td>
<td style="text-align: right;">1573.500</td>
</tr>
<tr>
<td style="text-align: left;">KOR</td>
<td style="text-align: right;">1624.503</td>
<td style="text-align: right;">1557.009</td>
<td style="text-align: right;">1642.149</td>
<td style="text-align: right;">1695.021</td>
<td style="text-align: right;">1718.158</td>
<td style="text-align: right;">1648.703</td>
</tr>
<tr>
<td style="text-align: left;">ANT</td>
<td style="text-align: right;">1624.167</td>
<td style="text-align: right;">1538.000</td>
<td style="text-align: right;">1598.200</td>
<td style="text-align: right;">1564.000</td>
<td style="text-align: right;">1481.000</td>
<td style="text-align: right;">1894.000</td>
</tr>
<tr>
<td style="text-align: left;">DMA</td>
<td style="text-align: right;">1620.357</td>
<td style="text-align: right;">1532.500</td>
<td style="text-align: right;">1470.000</td>
<td style="text-align: right;">1753.000</td>
<td style="text-align: right;">1582.600</td>
<td style="text-align: right;">1682.750</td>
</tr>
<tr>
<td style="text-align: left;">KUW</td>
<td style="text-align: right;">1612.957</td>
<td style="text-align: right;">1519.059</td>
<td style="text-align: right;">1603.237</td>
<td style="text-align: right;">1578.542</td>
<td style="text-align: right;">1638.558</td>
<td style="text-align: right;">1684.406</td>
</tr>
<tr>
<td style="text-align: left;">LES</td>
<td style="text-align: right;">1608.780</td>
<td style="text-align: right;">1605.500</td>
<td style="text-align: right;">1590.086</td>
<td style="text-align: right;">1625.058</td>
<td style="text-align: right;">1615.667</td>
<td style="text-align: right;">1669.500</td>
</tr>
<tr>
<td style="text-align: left;">LAO</td>
<td style="text-align: right;">1607.192</td>
<td style="text-align: right;">1526.000</td>
<td style="text-align: right;">1544.875</td>
<td style="text-align: right;">1610.071</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1787.000</td>
</tr>
<tr>
<td style="text-align: left;">VAN</td>
<td style="text-align: right;">1606.833</td>
<td style="text-align: right;">1531.333</td>
<td style="text-align: right;">1731.500</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1584.000</td>
</tr>
<tr>
<td style="text-align: left;">GRN</td>
<td style="text-align: right;">1605.200</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1584.333</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1622.000</td>
<td style="text-align: right;">1651.000</td>
</tr>
<tr>
<td style="text-align: left;">MDV</td>
<td style="text-align: right;">1600.654</td>
<td style="text-align: right;">1504.172</td>
<td style="text-align: right;">1562.840</td>
<td style="text-align: right;">1626.778</td>
<td style="text-align: right;">1643.471</td>
<td style="text-align: right;">1716.500</td>
</tr>
<tr>
<td style="text-align: left;">OMA</td>
<td style="text-align: right;">1598.695</td>
<td style="text-align: right;">1494.036</td>
<td style="text-align: right;">1581.515</td>
<td style="text-align: right;">1627.873</td>
<td style="text-align: right;">1644.400</td>
<td style="text-align: right;">1630.375</td>
</tr>
<tr>
<td style="text-align: left;">IND</td>
<td style="text-align: right;">1588.278</td>
<td style="text-align: right;">1527.953</td>
<td style="text-align: right;">1557.457</td>
<td style="text-align: right;">1643.618</td>
<td style="text-align: right;">1647.640</td>
<td style="text-align: right;">1648.994</td>
</tr>
<tr>
<td style="text-align: left;">SWZ</td>
<td style="text-align: right;">1583.612</td>
<td style="text-align: right;">1656.250</td>
<td style="text-align: right;">1565.760</td>
<td style="text-align: right;">1583.579</td>
<td style="text-align: right;">1579.231</td>
<td style="text-align: right;">1626.400</td>
</tr>
<tr>
<td style="text-align: left;">SRI</td>
<td style="text-align: right;">1544.736</td>
<td style="text-align: right;">1496.639</td>
<td style="text-align: right;">1525.698</td>
<td style="text-align: right;">1647.063</td>
<td style="text-align: right;">1707.876</td>
<td style="text-align: right;">1678.064</td>
</tr>
</tbody>
</table>

## Including Plots

You can also embed plots, for example:

![](solution_by_hiuyan_files/figure-markdown_strict/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
