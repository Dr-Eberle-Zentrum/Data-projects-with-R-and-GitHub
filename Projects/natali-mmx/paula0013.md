# Project 1: crop vs climate

## solution by paula0013

Climate change is a huge challenge for farmers worldwide. It is causing
extreme weather events, such as droughts and floods, which can have
devastating effects on crops and livestock. This project focuses on
*crop production in the region of Tübingen and how it has been affected
by climate change.*

# Read and transform the data set of the weather data from 1976 to 2021

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 3%" />
<col style="width: 11%" />
<col style="width: 13%" />
<col style="width: 15%" />
<col style="width: 17%" />
<col style="width: 22%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">district</th>
<th style="text-align: right;">year</th>
<th style="text-align: left;">species</th>
<th style="text-align: right;">measure in yield</th>
<th style="text-align: right;">Precipitation in mm</th>
<th style="text-align: right;">air temperature in °C</th>
<th style="text-align: right;">frost days in number of days</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1979</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">6.47</td>
<td style="text-align: right;">1016.5</td>
<td style="text-align: right;">8.01</td>
<td style="text-align: right;">24.36</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1979</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.77</td>
<td style="text-align: right;">1016.5</td>
<td style="text-align: right;">8.01</td>
<td style="text-align: right;">24.36</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1979</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.78</td>
<td style="text-align: right;">1016.5</td>
<td style="text-align: right;">8.01</td>
<td style="text-align: right;">24.36</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1980</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.50</td>
<td style="text-align: right;">987.2</td>
<td style="text-align: right;">7.52</td>
<td style="text-align: right;">30.65</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1980</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.73</td>
<td style="text-align: right;">987.2</td>
<td style="text-align: right;">7.52</td>
<td style="text-align: right;">30.65</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1980</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.84</td>
<td style="text-align: right;">987.2</td>
<td style="text-align: right;">7.52</td>
<td style="text-align: right;">30.65</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1981</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.49</td>
<td style="text-align: right;">1169.1</td>
<td style="text-align: right;">8.10</td>
<td style="text-align: right;">29.01</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1981</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.10</td>
<td style="text-align: right;">1169.1</td>
<td style="text-align: right;">8.10</td>
<td style="text-align: right;">29.01</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1981</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">5.47</td>
<td style="text-align: right;">1169.1</td>
<td style="text-align: right;">8.10</td>
<td style="text-align: right;">29.01</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1982</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">5.96</td>
<td style="text-align: right;">1066.3</td>
<td style="text-align: right;">8.64</td>
<td style="text-align: right;">19.83</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1982</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">4.01</td>
<td style="text-align: right;">1066.3</td>
<td style="text-align: right;">8.64</td>
<td style="text-align: right;">19.83</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1982</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.91</td>
<td style="text-align: right;">1066.3</td>
<td style="text-align: right;">8.64</td>
<td style="text-align: right;">19.83</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1983</td>
<td style="text-align: left;">grain maize</td>
<td style="text-align: right;">3.84</td>
<td style="text-align: right;">972.2</td>
<td style="text-align: right;">8.78</td>
<td style="text-align: right;">25.75</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1983</td>
<td style="text-align: left;">spring barley</td>
<td style="text-align: right;">3.35</td>
<td style="text-align: right;">972.2</td>
<td style="text-align: right;">8.78</td>
<td style="text-align: right;">25.75</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tübingen, Landkreis</td>
<td style="text-align: right;">1983</td>
<td style="text-align: left;">winter wheat</td>
<td style="text-align: right;">4.61</td>
<td style="text-align: right;">972.2</td>
<td style="text-align: right;">8.78</td>
<td style="text-align: right;">25.75</td>
</tr>
</tbody>
</table>
