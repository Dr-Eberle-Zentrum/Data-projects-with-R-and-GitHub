## Description

This dataset accompanies a study examining the relationship between
xerostomia (dry mouth) and salivary cortisol levels in Multiple
Sclerosis (MS) patients. Data were collected from MS patients diagnosed
according to the McDonald Criteria, with saliva samples taken at 10:00
AM to measure cortisol levels using an ELISA kit. The dataset includes
xerostomia assessments, medication use, anxiety scores, and statistical
analyses to explore cortisol as a potential biomarker for xerostomia in
MS patients.

## Dataset

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">No.;Patient Name;Age;Sex;Abslang
Test;Smoking;Alcohol;Other Diseases;Medication;MS Duration;NO test
result;Cortisol Test Result;BAI Score;Severity of BAI test</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">1;Samira
Abduli;24;Female;0;0;0;-;0;2Years;212,839;1,369;19;Moderate</td>
</tr>
</tbody>
</table>

The data is taken from Harvard Dataverse and is publicly available.
There is just data from MS patients in there and therfore no control
group.

### Data Manipulation

-   MS Duration should be given in months as an integer
-   Create a new column whether the patient has other conditions encoded
    with the number of the diseases, so no other diseases means 0 …
-   Create a new column whether the Patient is treated with a
    Corticosteroid and another whether the patient is treated with a
    B-cell depleting therapy (Rituximab)
-   Delete the Patient name column

### Visualisation goals

-   Plot the BAI Score against the Cortisol Test Result as a scatter
    plot, color-coded by sex and using different shapes to indicate
    corticosteroid intake.
-   Determine the correlation value for all subgroups and plot the
    corresponding lines on the diagram
-   Divide the patients into age groups with an interval of 15 years and
    create a bar chart showing the average NO test value with standard
    deviation for each subgroup.
