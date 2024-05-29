## General topic of task

The aim of the project is to look at the expectations of 15-year-old
students in terms of their educational qualifications. This should be
done on the basis of parents parent’s highest level of education in
different countries.

## Data Set

The dataset is from OECD and contains the answers of students in the
PISA student questionnaire. PISA means Programme for International
Student Assessment and measures 15-year old’s mathematical, reading and
writing competencies. The study is conducted every three years across
all OECD countries. The datset to be used contains the student
questionnaire, where they answered questions about themselves, their
family, how they think about their life, their school and schedule. You
can find the dataset here <https://www.oecd.org/pisa/data/2022database/>
. To download the data yourself you need to go to the ‘student
questionnaire data file’ in the ‘SAS Data Files’ section. This will
download a zip folder with the (it took quite some time for me to
download the data). If you ever need to import sas files, I’d advise you
to use the haven package:

    library(haven)
    # read_sas("cy08msp_stu_qqq.sas7bdat")

The whole datafile is actually so big I can’t upload it to GitHub.

I therefore created a [datset](data_PISA.Rdata) containing only students
from three different countries (Germany, Estonia, Japan; as can be seen
beneath). I would advise you to work with this dataset instead of
downloading the zip file.

Here is an [overview over the different variables](Codebook_PISA.SAS),
but the pdf containing the [whole
questionnaire](Projects/ArleneHohl/Questionnaire.pdf) might be more
helpful.

## Data manipulation goals

To reach the project goal, I chose the countries Germany, Estonia and
Japan to compare, as it aligns with the visualization goal you can find
in the next paragraph.

The next step is to build the parent’s highest level of education for
every person. To build this score, for this project you need the
following items: - parent’s highest level of education mother
(ST005Q01JA) - parent’s highest level of education mother (ST007Q01JA)
The lower the score is, the higher the completed education. I would
reverse it so higher score = higher education. I would advise to then
build a mean or sum score for the parents for every person.

Now we also need the expected education qualification of the student,
which is in the variables ST327Q01JA,ST327Q02JA, ST327Q03JA,…,
ST327Q08JA. Each of these variables describes, if a person thinks they
will reach this qualification (e.g. ST327Q01JA: ISCED level 2, 1= yes, 2
= no, 3 = don’t know). I guess it makes the most sense to find the
highest education qualification each person believes to achieve and
store this in a new column (so for each person you need to find the last
row where they said they would achieve this qualifiaction (=2)).

If you encounter any missing values, you are free to decide if you want
to drop these objects or if you want to impute them.

## visualization goals & intermediates

I plan on creating a plot looking similar to this. ![something like
this](plot_idea.png).

On the x-axis should be the parent’s highest level of education, and on
the y-axis should be the expected qualification of the student. We want
one plot for each country. The plan is to first create the single plots
for the different countries and then add them together. The circle size
should be the amount of students believing to achieve this
qualification. I also would like to have a line with the average of
expected achieved qualifiaction across all countries in each plot. And
feel free to make the plot a little prettier than the one I provided.
