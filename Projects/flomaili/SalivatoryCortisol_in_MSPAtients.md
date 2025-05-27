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
<tr>
<th style="text-align: left;">No.;Patient Name;Age;Sex;Abslang
Test;Smoking;Alcohol;Other Diseases;Medication;MS Duration;NO test
result;Cortisol Test Result;BAI Score;Severity of BAI test</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">1;Samira
Abduli;24;Female;0;0;0;-;0;2Years;212,839;1,369;19;Moderate</td>
</tr>
</tbody>
</table>

The [dataset](data_MS.csv) is taken from [Harvard
Dataverse](https://doi.org/10.7910/DVN/APVJSO) and is publicly
available. There is just data from MS patients in there and therfore no
control group.

BAI stands for Beck-Anxiety-Inventory and it is a widely used
self-report questionnaire designed to measure the severity of anxiety
symptoms in adults and adolescents.

The Abslang test is a quick, simple test where a patient bites down on a
tongue depressor; the inability to hold the blade or pain during the
bite suggests a possible mandible (jawbone) fracture (0-negative,
1-positive).

### Priority for the tasks is indicated by the number of “+”.

-   (+++) -&gt; very important
-   (++) -&gt; important
-   (+) -&gt; less important

### Data Manipulation

-   MS Duration should be given in months as an integer. (+++)
-   Create a new column whether the patient has other conditions encoded
    with the number of the diseases, so no other diseases means 0 … (++)
-   Create a new column whether the Patient is treated with a
    Corticosteroid (+++) and another whether the patient is treated with
    a B-cell depleting therapy (Rituximab). (+)
-   Replace the column with clear names with a column where patients are
    coded according to the scheme MS\_XS\_0xx.(+)

### Visualisation goals

-   Plot the BAI Score against the Cortisol Test Result as a scatter
    plot, color-coded by sex and using different shapes to indicate
    corticosteroid intake. (+++)
-   Determine the correlation value for all subgroups and plot the
    corresponding lines on the diagram (+)
-   Divide the patients into MS duration groups with an interval of 6
    months and create a bar chart showing the average NO test value with
    standard deviation for each of these duration groups.(++)
-   Divide the patients into age groups with an interval of 15 years and
    crate a bar chart showing the mean number of diseases for each of
    these age groups. Keep in mind that MS is also counted as a
    disease.(++)
