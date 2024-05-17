# Data Project by Meri

## What is this about?

Diet is a major predictor of health and lifespan as well as a complex
“enviroment” an individual needs to adapt to. High Sugar diets (HSD) in
particular are known to cause Insulin resistance, leading to Type II
diabetes, a disease that claimed 1.5 million lives in 2019 [1]. Thus
understanding how HSDs effect a biological system is essential in
developing lines of treatment for diet-linked diseases like diabetes.
Here is where *Drosophila melanogaster*, the fruit fly, comes into play.
This fly is a popular model organism in biological research, as it
offers a short developmental time and life span, as well as conserved
gene regulatory and metabolic networks, that share high similarities
with their human counterparts. The Goal of this project would be to
define how the life span, developmental time and metabolism of *D.
melanogaster* are effected by a HSD diet.

## What is this dataset?

I have taken all data from a paper from 2011[2].

This publication focuses on the comparison of two *Drosophila* species,
*Drosophila melanogaster* and *Drosophila mojavensis*, aiming to
characterize if these two ecologically different species to several
dietary composition. While interesting, for this project I’d like you to
focus on *D. melanogaster* and how the dietary composition effects
survival, developmental time and concentration of biomolecules.

I have compiled the relevant data into an [excel
table](/Projects/merinehlsen/flydata.xlsx).

This dataset includes multiple characteristics for each of the three
measurements, namely:

1.  dietary composity
2.  genetics
3.  sex

Let’s look at all of them individually in detail.

### 1. Dietary composition (hereafter diet)

The publication looks at three different diets, characterized by the
respecive amounts of protein (from yeast) and carbohydrates/ sugar (from
sucrose) in ratio to each other. They establish them as high
protein:sugar ratio (HPS), equal protein:sugar ratio (EPS), and low
protein:sugar ratio (LPS), with following percentages of protein and
sugar:

> Our high protein:sugar ratio diet contained 7.1% protein and 17.9%
> carbohydrate, the EPS diet was 4.3% protein and 21.2% carbohydrate,
> and the LPS was only 2.5% protein and 24.6% carbohydrate.

If you are interested in the exact weights and volumes used for each
diet, you can find those in table 1 of the paper. Importantly though,
these three diets are as close in caloric content (=isocaloric) as
possible, to ensure, that the observed effects are caused by composition
rather than calories. While not perfectly matched (see below), caloric
content can be disregarded in the analysis here.

<table>
<thead>
<tr class="header">
<th>Diet</th>
<th>caloric value (kJ/ 100 g)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>HPS</td>
<td>452</td>
</tr>
<tr class="even">
<td>EPS</td>
<td>456</td>
</tr>
<tr class="odd">
<td>LPS</td>
<td>469</td>
</tr>
</tbody>
</table>

### 2. Genetics

To account for intra-species variation the authors study 5 genetically
different isofemale *D. melanogaster* lines. This is also interesting to
this project as genetics can play huge effects in risk of diabetes or
other metabolic diseases.

### 3. Sex

Lastly both survival and the Metabolic Pools are assesed for
specifically for female and male flies. The developmental time on the
other hand is determined independent on sex (mainly because the sex of
larvae and pupae can not be determined easily by eye).

------------------------------------------------------------------------

Now onto the actual measurements of this dataset. Each one of these are
compiled in a separate sheet of the excel table.

### 1. Survival

Survival here is given as the number of adults that eclose from the
pupae stage per vial.

### 2. Developmental Time

As holometabolous insects fruit flies undergo complete metamorphosis,
meaning that their life cycle is made up by four distinct stages: egg,
larvae, pupae and adult. Every transition from one stage to the next is
an important bottleneck in development. Thus de- or ascelerations of the
life cycle indicate biological relevancy.

![Life cycle of the fruit fly](/Projects/merinehlsen/fly_lifecycle.png)

Life cycle of *Drosophila melanogaster* [3]

The paper asseses the time between transition from larvae to pupae and
pupae to eclosion (= emergence of the adult fly), from what they
conclude the duration of the following three “Stages” in development.

<table>
<thead>
<tr class="header">
<th>ID</th>
<th>Stages</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>L-P</td>
<td>first instar larvae to first pupation</td>
</tr>
<tr class="even">
<td>P-E</td>
<td>first pupation to first eclosion</td>
</tr>
<tr class="odd">
<td>L-E</td>
<td>first instar larvae to first eclosion</td>
</tr>
</tbody>
</table>

### 3. Metabolic Pools

Lastly the paper looks at metabolic markers, specifically the dry
weight, protein and triglyceride (TGA) content. Triglycerides in
particular play an important role in regulating metabolism in
development of *Drosophila melanogaster*. In short dietary sugars are
utilized to synthesis TGAs to store energy later to be mobilized during
development when individuals are not actively feeding i.e. late larval
and all pupal stages.

Protein and TGA content were determined with standard colorimetric
assays. For these 5 flies are pooled to reach suffient concentrations
and also reduce noise. The dry mass is also determined for these 5 flies
(= 1 homogenate).

## Goals

### Data Manipulation

In all tables you will find the mean per group as well as the standard
deviation (SD) for each measurement. While this is not the most elegant
to work with, I’d like you to keep the SD as a rough measurement for
variance.

All three characteristics (Survival, Developmental time and the
metabolic pools) are kept in slightly different table formats, which
stays true - though slightly more pointed due to my hand - to the
original presentation in the publication. First I’d like you to combine
the three tables into one conise table, so that the values for all
measurements are easily findable from giving any combination of the
three characteristics (dietary composity, genetics and sex). So you will
have to reformat the individual tables to a singular format. What this
format will look like, I will leave to you.

So in short: Compile data into a more easily acessible format.

### Visualization

This was one of my big caviates with this paper: I think the
visualization here could be much improved. I am not a fan of barplots,
so that’s the one thing I’d ask you to avoide. Boxplots are the obvious
answer here and please do use them plenty, but I would be interested, if
you can find a nice way to include multiple measurements into one plot
e.g. developmental time and survival or metabolic.

The overarching question I’m asking about the paper is basically if any
of the measurements are “related”, meaning that e.g. protein content can
predict TGA content. Also rather than just looking at the mean of each
measurement, I am interested if the variance (by SD here) behaves in a
similar way.

------------------------------------------------------------------------

### Sources

[1] WHO
<https://www.who.int/news-room/fact-sheets/detail/diabetes#>:~:text=Type%202%20diabetes%20affects%20how,2%20diabetes%20is%20often%20preventable

[2] Luciano M. Matzkin, Sarah Johnson, Christopher Paight, Goran
Bozinovic, Therese A. Markow, Dietary Protein and Sugar Differentially
Affect Development and Metabolic Pools in Ecologically Diverse
Drosophila123, The Journal of Nutrition, Volume 141, Issue 6, 2011,
Pages 1127-1133, ISSN 0022-3166,
<https://doi.org/10.3945/jn.111.138438>.
(<https://www.sciencedirect.com/science/article/pii/S0022316622029753>)

[3] Ong, Cynthia & Yung, Lin-Yue & Cai, Yu & Bay, Boon-Huat & Baeg,
Gyeong. (2014). Drosophila melanogaster as a model organism to study
nanotoxicity. Nanotoxicology. 9. 1-8. 10.3109/17435390.2014.940405.
