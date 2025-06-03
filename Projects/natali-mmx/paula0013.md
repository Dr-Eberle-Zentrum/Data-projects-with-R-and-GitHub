# Project 1: crop vs climate

## solution by paula0013

Climate change is a huge challenge for farmers worldwide. It is causing
extreme weather events, such as droughts and floods, which can have
devastating effects on crops and livestock. This project focuses on
*crop production in the region of Tübingen and how it has been affected
by climate change.*

# Read and transform the data set of the weather data from 1976 to 2021

<table>
<caption>Wetter- und Ertragsdaten Tübingen (1976–2021)</caption>
<colgroup>
<col style="width: 6%" />
<col style="width: 25%" />
<col style="width: 17%" />
<col style="width: 12%" />
<col style="width: 21%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">year</th>
<th style="text-align: left;">district</th>
<th style="text-align: left;">species</th>
<th style="text-align: right;">yield</th>
<th style="text-align: left;">climate_variable</th>
<th style="text-align: right;">climate_value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.470000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1016.50</td>
</tr>
<tr class="even">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.470000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.01</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.470000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">24.36</td>
</tr>
<tr class="even">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.770000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1016.50</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.770000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.01</td>
</tr>
<tr class="even">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.770000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">24.36</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.780000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1016.50</td>
</tr>
<tr class="even">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.780000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.01</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1979</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.780000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">24.36</td>
</tr>
<tr class="even">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.500000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">987.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.500000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.52</td>
</tr>
<tr class="even">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.500000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">30.65</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.730000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">987.20</td>
</tr>
<tr class="even">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.730000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.52</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.730000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">30.65</td>
</tr>
<tr class="even">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.840000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">987.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.840000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.52</td>
</tr>
<tr class="even">
<td style="text-align: right;">1980</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.840000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">30.65</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.490000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1169.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.490000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.490000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">29.01</td>
</tr>
<tr class="even">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.100000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1169.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.100000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.100000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">29.01</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.470000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1169.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.470000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1981</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.470000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">29.01</td>
</tr>
<tr class="even">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.960000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1066.30</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.960000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.64</td>
</tr>
<tr class="even">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.960000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">19.83</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.010000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1066.30</td>
</tr>
<tr class="even">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.010000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.64</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.010000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">19.83</td>
</tr>
<tr class="even">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1066.30</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.64</td>
</tr>
<tr class="even">
<td style="text-align: right;">1982</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">19.83</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">3.840000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">972.20</td>
</tr>
<tr class="even">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">3.840000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.78</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">3.840000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.75</td>
</tr>
<tr class="even">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.350000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">972.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.350000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.78</td>
</tr>
<tr class="even">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.350000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.75</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.610000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">972.20</td>
</tr>
<tr class="even">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.610000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.78</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1983</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.610000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.75</td>
</tr>
<tr class="even">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.090000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">988.80</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.090000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.090000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">19.01</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.610000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">988.80</td>
</tr>
<tr class="even">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.610000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.610000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">19.01</td>
</tr>
<tr class="even">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.610000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">988.80</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.610000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1984</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.610000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">19.01</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.210000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">862.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.210000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.42</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.210000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">45.06</td>
</tr>
<tr class="even">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.340000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">862.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.340000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.42</td>
</tr>
<tr class="even">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.340000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">45.06</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.390000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">862.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.390000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.42</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.390000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">45.06</td>
</tr>
<tr class="even">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.390000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1159.50</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.390000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.89</td>
</tr>
<tr class="even">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.390000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">36.51</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.170000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1159.50</td>
</tr>
<tr class="even">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.170000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.89</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.170000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">36.51</td>
</tr>
<tr class="even">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.900000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1159.50</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.900000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.89</td>
</tr>
<tr class="even">
<td style="text-align: right;">1986</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.900000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">36.51</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.490000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1076.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.490000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.68</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.490000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">39.37</td>
</tr>
<tr class="even">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.940000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1076.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.940000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.68</td>
</tr>
<tr class="even">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.940000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">39.37</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.030000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1076.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.030000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.68</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1987</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.030000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">39.37</td>
</tr>
<tr class="even">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.620000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1173.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.620000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.89</td>
</tr>
<tr class="even">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.620000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">11.05</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.400000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1173.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.400000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.89</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.400000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">11.05</td>
</tr>
<tr class="even">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.160000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1173.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.160000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.89</td>
</tr>
<tr class="even">
<td style="text-align: right;">1988</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.160000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">11.05</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.390000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">807.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.390000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.04</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.390000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">12.54</td>
</tr>
<tr class="even">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.010000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">807.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.010000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.04</td>
</tr>
<tr class="even">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.010000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">12.54</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.060000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">807.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.060000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.04</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1989</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.060000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">12.54</td>
</tr>
<tr class="even">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.590000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">961.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.590000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.13</td>
</tr>
<tr class="even">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.590000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">15.89</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.740000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">961.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.740000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.13</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.740000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">15.89</td>
</tr>
<tr class="even">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.270000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">961.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.270000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.13</td>
</tr>
<tr class="even">
<td style="text-align: right;">1990</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.270000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">15.89</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.350000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">763.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.350000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.22</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.350000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">28.62</td>
</tr>
<tr class="even">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">763.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.22</td>
</tr>
<tr class="even">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">28.62</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.810000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">763.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.810000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.22</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1991</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.810000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">28.62</td>
</tr>
<tr class="even">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.900000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">985.90</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.900000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.12</td>
</tr>
<tr class="even">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.900000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.66</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.850000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">985.90</td>
</tr>
<tr class="even">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.850000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.12</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.850000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.66</td>
</tr>
<tr class="even">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.670000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">985.90</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.670000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.12</td>
</tr>
<tr class="even">
<td style="text-align: right;">1992</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.670000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.66</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.170000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">988.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.170000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.57</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.170000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">26.79</td>
</tr>
<tr class="even">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.250000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">988.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.250000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.57</td>
</tr>
<tr class="even">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.250000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">26.79</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.670000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">988.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.670000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.57</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1993</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.670000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">26.79</td>
</tr>
<tr class="even">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.800000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1062.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.800000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.88</td>
</tr>
<tr class="even">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.800000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.64</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.980000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1062.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.980000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.88</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.980000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.64</td>
</tr>
<tr class="even">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.760000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1062.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.760000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.88</td>
</tr>
<tr class="even">
<td style="text-align: right;">1994</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.760000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.64</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.550000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1154.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.550000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.77</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.550000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.35</td>
</tr>
<tr class="even">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.810000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1154.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.810000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.77</td>
</tr>
<tr class="even">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.810000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.35</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.360000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1154.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.360000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.77</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1995</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.360000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.35</td>
</tr>
<tr class="even">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.130000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">885.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.130000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.42</td>
</tr>
<tr class="even">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.130000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">37.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.110000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">885.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.110000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.42</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.110000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">37.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.000000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">885.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.000000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.42</td>
</tr>
<tr class="even">
<td style="text-align: right;">1996</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.000000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">37.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.620000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">858.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.620000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.81</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.620000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">20.67</td>
</tr>
<tr class="even">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.060000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">858.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.060000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.81</td>
</tr>
<tr class="even">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.060000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">20.67</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.700000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">858.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.700000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.81</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.700000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">20.67</td>
</tr>
<tr class="even">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.590000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">998.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.590000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.92</td>
</tr>
<tr class="even">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.590000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">23.77</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.730000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">998.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.730000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.92</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.730000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">23.77</td>
</tr>
<tr class="even">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.680000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">998.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.680000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.92</td>
</tr>
<tr class="even">
<td style="text-align: right;">1998</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.680000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">23.77</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.350000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1158.80</td>
</tr>
<tr class="even">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.350000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.05</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.350000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.09</td>
</tr>
<tr class="even">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.330000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1158.80</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.330000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.05</td>
</tr>
<tr class="even">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.330000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.09</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.040000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1158.80</td>
</tr>
<tr class="even">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.040000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.05</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.040000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.09</td>
</tr>
<tr class="even">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.390000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1025.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.390000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.71</td>
</tr>
<tr class="even">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.390000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.36</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.460000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1025.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.460000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.71</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.460000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.36</td>
</tr>
<tr class="even">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.950000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1025.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.950000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.71</td>
</tr>
<tr class="even">
<td style="text-align: right;">2000</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.950000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.36</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.780000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1184.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.780000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.780000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.45</td>
</tr>
<tr class="even">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.100000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1184.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.100000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.100000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.45</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.200000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1184.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.200000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2001</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.200000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.45</td>
</tr>
<tr class="even">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.590000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1231.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.590000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.55</td>
</tr>
<tr class="even">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">9.590000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.06</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.930000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1231.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.930000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.55</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.930000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.06</td>
</tr>
<tr class="even">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.700000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1231.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.700000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.55</td>
</tr>
<tr class="even">
<td style="text-align: right;">2002</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.700000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.06</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.957314</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">707.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.957314</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.45</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.957314</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">23.79</td>
</tr>
<tr class="even">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.450000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">707.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.450000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.45</td>
</tr>
<tr class="even">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.450000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">23.79</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.670000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">707.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.670000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.45</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2003</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.670000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">23.79</td>
</tr>
<tr class="even">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.020000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">927.80</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.020000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.020000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.48</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.550000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">927.80</td>
</tr>
<tr class="even">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.550000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.550000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.48</td>
</tr>
<tr class="even">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.950000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">927.80</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.950000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2004</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.950000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">22.48</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.580000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">913.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.580000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.580000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">32.85</td>
</tr>
<tr class="even">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.050000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">913.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.050000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.050000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">32.85</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.280000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">913.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.280000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2005</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.280000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">32.85</td>
</tr>
<tr class="even">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.790000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">972.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.790000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.19</td>
</tr>
<tr class="even">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.790000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.78</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">972.20</td>
</tr>
<tr class="even">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.19</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.910000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.78</td>
</tr>
<tr class="even">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.850000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">972.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.850000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.19</td>
</tr>
<tr class="even">
<td style="text-align: right;">2006</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.850000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.78</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.866892</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1049.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.866892</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.47</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">7.866892</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">14.77</td>
</tr>
<tr class="even">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.510000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1049.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.510000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.47</td>
</tr>
<tr class="even">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.510000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">14.77</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.510000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">1049.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.510000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.47</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2007</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.510000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">14.77</td>
</tr>
<tr class="even">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.940000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">933.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.940000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.08</td>
</tr>
<tr class="even">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">8.940000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">12.50</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.350000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">933.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.350000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.08</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.350000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">12.50</td>
</tr>
<tr class="even">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.280000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">933.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.280000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.08</td>
</tr>
<tr class="even">
<td style="text-align: right;">2008</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.280000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">12.50</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">10.540000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">968.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">10.540000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">10.540000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">27.69</td>
</tr>
<tr class="even">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.640000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">968.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.640000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.640000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">27.69</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.390000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">968.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.390000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.390000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">27.69</td>
</tr>
<tr class="even">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">10.150000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">999.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">10.150000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.93</td>
</tr>
<tr class="even">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">10.150000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">48.91</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.240000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">999.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.240000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.93</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.240000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">48.91</td>
</tr>
<tr class="even">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.570000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">999.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.570000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">7.93</td>
</tr>
<tr class="even">
<td style="text-align: right;">2010</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.570000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">48.91</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">812.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.64</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.170000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">812.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.170000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.64</td>
</tr>
<tr class="even">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.170000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.990000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">812.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.990000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.64</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2011</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.990000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">977.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.08</td>
</tr>
<tr class="even">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.06</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.550000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">977.20</td>
</tr>
<tr class="even">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.550000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.08</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.550000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.06</td>
</tr>
<tr class="even">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.540000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">977.20</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.540000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.08</td>
</tr>
<tr class="even">
<td style="text-align: right;">2012</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.540000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">25.06</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">987.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.56</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">28.43</td>
</tr>
<tr class="even">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">987.70</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.56</td>
</tr>
<tr class="even">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">28.43</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.510000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">987.70</td>
</tr>
<tr class="even">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.510000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.56</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2013</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.510000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">28.43</td>
</tr>
<tr class="even">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">875.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.14</td>
</tr>
<tr class="even">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">5.78</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">875.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.14</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">5.78</td>
</tr>
<tr class="even">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.270000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">875.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.270000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.14</td>
</tr>
<tr class="even">
<td style="text-align: right;">2014</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.270000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">5.78</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">732.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.89</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.27</td>
</tr>
<tr class="even">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.980000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">732.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.980000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.89</td>
</tr>
<tr class="even">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.980000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.27</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.470000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">732.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.470000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.89</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2015</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.470000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.27</td>
</tr>
<tr class="even">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">954.90</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.29</td>
</tr>
<tr class="even">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">11.32</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.140000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">954.90</td>
</tr>
<tr class="even">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.140000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.29</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.140000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">11.32</td>
</tr>
<tr class="even">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.880000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">954.90</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.880000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.29</td>
</tr>
<tr class="even">
<td style="text-align: right;">2016</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">6.880000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">11.32</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">957.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">21.97</td>
</tr>
<tr class="even">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">957.10</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.40</td>
</tr>
<tr class="even">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">21.97</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.080000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">957.10</td>
</tr>
<tr class="even">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.080000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.40</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2017</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.080000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">21.97</td>
</tr>
<tr class="even">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">765.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.38</td>
</tr>
<tr class="even">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.27</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.050000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">765.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.050000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.38</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.050000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.27</td>
</tr>
<tr class="even">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.570000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">765.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.570000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.38</td>
</tr>
<tr class="even">
<td style="text-align: right;">2018</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.570000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">16.27</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">932.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.87</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.48</td>
</tr>
<tr class="even">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.930000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">932.60</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.930000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.87</td>
</tr>
<tr class="even">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">6.930000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.48</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.360000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">932.60</td>
</tr>
<tr class="even">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.360000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">9.87</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2019</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">7.360000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">10.48</td>
</tr>
<tr class="even">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">816.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.24</td>
</tr>
<tr class="even">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">5.91</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.940000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">816.00</td>
</tr>
<tr class="even">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.940000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.24</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.940000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">5.91</td>
</tr>
<tr class="even">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.070000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">816.00</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.070000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">10.24</td>
</tr>
<tr class="even">
<td style="text-align: right;">2020</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">8.070000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">5.91</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">980.90</td>
</tr>
<tr class="even">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.83</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">15.44</td>
</tr>
<tr class="even">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.370000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">980.90</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.370000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.83</td>
</tr>
<tr class="even">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">5.370000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">15.44</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.760000</td>
<td style="text-align: left;">precipitation</td>
<td style="text-align: right;">980.90</td>
</tr>
<tr class="even">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.760000</td>
<td style="text-align: left;">air_temperature</td>
<td style="text-align: right;">8.83</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2021</td>
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.760000</td>
<td style="text-align: left;">frost_days</td>
<td style="text-align: right;">15.44</td>
</tr>
</tbody>
</table>

Wetter- und Ertragsdaten Tübingen (1976–2021)

\#Visulisation \# 1. Relationship Between Crop Yields and Climate
Variables
![](paula0013_files/figure-markdown_strict/unnamed-chunk-2-1.png)

\#2.”Crop yields over the time \[in year\]
![](paula0013_files/figure-markdown_strict/unnamed-chunk-3-1.png)

\#3.Climate variables over the time \[in year\]
![](paula0013_files/figure-markdown_strict/unnamed-chunk-4-1.png)
