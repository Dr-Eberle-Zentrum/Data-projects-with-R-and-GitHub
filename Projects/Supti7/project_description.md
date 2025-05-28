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

A short description of some of the variables are given below:

-   **work\_year** : The year the salary was paid.
-   **experience\_level** : The experience level in the job during the
    year: EN - Entry-level / MI - Mid-level / SE - Senior-level / EX -
    Executive-level / Director.
-   **job\_title** : The role worked in during the year.
-   **salary** : The total gross salary amount paid.
-   **remote\_ratio** : The overall amount of work done remotely, where
    the values are as follows: 0 no remote work (less than 20%), 50
    partially remote, 100 fully remote (more than 80%).
-   **company\_location** : The country of the employer’s main office

## Data Peperation tips

-   Use the data for 2024 only.
-   For the missing data, whether it is regarding the inclusion of
    countries for salary or remote work ratio, you can choose to remove
    the rows. Or you can choose to fill the missing values with the mean
    or median of the respective column. Trust your judgement.
-   If there is any redundancy for the job title, meaning same job with
    different recording style (e.g. “Cybersecurity Engineer” and “Cyber
    Security Engineer”), please unify them.

## Visualization Goal of the project

The goal of this project is to summarize the visual information
primarily.The purpose is to see the regional differences in remote ratio
and salaries.Use **choropleth** maps to visualize the data.

-   Show first the percentage of the remote work ratio. Choose one type
    e.g. 100% or 50% remote work ratio and generate a graph that shows
    the the total number of jobs among different countries globally
    using that ratio. It might be helpful to use the percentage for
    which you have the most available data.

-   For this first plot, use all types of job title as the focus is on
    the remote work ratio.

-   The second visualization task you can choose either of the two
    tasks:

    -   Show the average salary of top 5 jobs with entry level and/or
        mid level.
    -   Generate two more plots for North America (NA) and Europe (EU)
        with the percentage you have chosen for the first graph. If you
        have confusion regarding countries like Russia, please exclude
        them.

## Ideas for further work

-   Do a hypothesis test to compare the average salary difference
    between USA and Non-USA region. In order to do that, first you need
    to sample jobs with same title but different salary from this two
    regions.Here, you can choose the jobs that have a significant number
    of jobs in both regions, e.g. Data Scientist, Data/ML Engineer, etc.
-   The statistical test to do so, I will leave it to you.

## Quesitons of interest with this project

-   With the first task, we want to see, globally what is the number of
    jobs among different countries that have a certain remote work
    ratio. This will help us understand the **global trend of remote
    work**.

-   The second task will help us understand the **salary differences
    among different job titles and experience levels**.

-   The plots for **NA** and **EU** will help us understand the
    **regional differences in remote work ratio** as the number of jobs
    is quite large in these regions.

-   The hypothesis test will help us understand if there is a
    **significant difference in salary between USA and Non-USA regions**
    for the same job title.

Have fun and looking forward to seeing your work!

Kind regards, Supti
