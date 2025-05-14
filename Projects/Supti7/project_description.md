# Comparison of salaries of global remote data scientists!

Remote working became a norm during covid-19. And with remote work came
more concern about salary. Let’s see using the
[data](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/Supti7/Salaries_data_scientists.csv)
from
[kaggle](https://www.kaggle.com/datasets/abhinavshaw09/data-science-job-salaries-2024?resource=download)
whether there is any difference in salary of remote data scientists in
different countries.

Here is a first look at the data:

<table>
<colgroup>
<col style="width: 5%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 18%" />
<col style="width: 4%" />
<col style="width: 9%" />
<col style="width: 8%" />
<col style="width: 10%" />
<col style="width: 7%" />
<col style="width: 9%" />
<col style="width: 7%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">work_year</th>
<th style="text-align: left;">experience_level</th>
<th style="text-align: left;">employment_type</th>
<th style="text-align: left;">job_title</th>
<th style="text-align: right;">salary</th>
<th style="text-align: left;">salary_currency</th>
<th style="text-align: right;">salary_in_usd</th>
<th style="text-align: left;">employee_residence</th>
<th style="text-align: right;">remote_ratio</th>
<th style="text-align: left;">company_location</th>
<th style="text-align: left;">company_size</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">AI Engineer</td>
<td style="text-align: right;">90000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">90000</td>
<td style="text-align: left;">AE</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">AE</td>
<td style="text-align: left;">L</td>
</tr>
<tr class="even">
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Machine Learning Engineer</td>
<td style="text-align: right;">180500</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">180500</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Machine Learning Engineer</td>
<td style="text-align: right;">96200</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">96200</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr class="even">
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Machine Learning Engineer</td>
<td style="text-align: right;">235000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">235000</td>
<td style="text-align: left;">AU</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">AU</td>
<td style="text-align: left;">M</td>
</tr>
<tr class="odd">
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Machine Learning Engineer</td>
<td style="text-align: right;">175000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">175000</td>
<td style="text-align: left;">AU</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">AU</td>
<td style="text-align: left;">M</td>
</tr>
<tr class="even">
<td style="text-align: right;">2024</td>
<td style="text-align: left;">MI</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Business Intelligence Developer</td>
<td style="text-align: right;">95413</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">95413</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">100</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
</tbody>
</table>

## Visualization Goal of the project

The goal of this project is to summarize the visual information
primarily.The purpose is to see the regional differences in remote ratio
and salaries.Use choropleth maps to visualize the data.

-   Show first the percentage of data scientists working remotely
    globally.
-   Generate two plots in one figure showing the percentage of remote
    work between Europe and America.

Have fun and looking forward to seeing your work!

Kind regards, Supti
