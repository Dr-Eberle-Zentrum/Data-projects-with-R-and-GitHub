# Project 2: Comparison of salaries of global remote data scientists!

## Solution by paula0013

Remote working became a norm during covid-19. And with remote work came
more concern about salary. Let’s see using the data from kaggle whether
there is any difference in salary of remote data scientists in different
countries.

# Read and transform of the data

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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">MI</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Business Intelligence Developer</td>
<td style="text-align: right;">70692</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">70692</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">100</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Data Engineer</td>
<td style="text-align: right;">110000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">110000</td>
<td style="text-align: left;">UA</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">UA</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Data Engineer</td>
<td style="text-align: right;">48000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">48000</td>
<td style="text-align: left;">UA</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">UA</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Data Scientist</td>
<td style="text-align: right;">222300</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">222300</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Data Scientist</td>
<td style="text-align: right;">119700</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">119700</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Cloud Database Engineer</td>
<td style="text-align: right;">170375</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">170375</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">100</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Cloud Database Engineer</td>
<td style="text-align: right;">102500</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">102500</td>
<td style="text-align: left;">US</td>
<td style="text-align: right;">100</td>
<td style="text-align: left;">US</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Data Engineer</td>
<td style="text-align: right;">270000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">270000</td>
<td style="text-align: left;">AU</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">AU</td>
<td style="text-align: left;">M</td>
</tr>
<tr>
<td style="text-align: right;">2024</td>
<td style="text-align: left;">SE</td>
<td style="text-align: left;">FT</td>
<td style="text-align: left;">Data Engineer</td>
<td style="text-align: right;">190000</td>
<td style="text-align: left;">USD</td>
<td style="text-align: right;">190000</td>
<td style="text-align: left;">AU</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">AU</td>
<td style="text-align: left;">M</td>
</tr>
</tbody>
</table>

# Visualisation of the percentage of the remote work ratio in worldwide comparsion

![](plot_procent_remote_Work_Worlwide.png)

# Visualisation of average salary of the top 5 entry and mid-level jobs

![](plot_top_5_jobs_Average_Salary.png)
