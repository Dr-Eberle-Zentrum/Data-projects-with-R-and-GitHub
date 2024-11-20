# Project Description

This project will use publicly available behavioral data from Kalbe &
Schwabe (2022). The original study looked at the memory performance of
the study participants, operationalised as corrected recognition. The
unprocessed data can be found [here](https://osf.io/qpm3t/), the
preprocessed data which you will use, can be found in the folder
[project-data](/Projects/celineony/project-data).

In the study participants were presented with a series of initially
neutral stimuli. The presented stimuli were images of animals and tools,
images from one of the two categories were paired with an aversive event
(electric shock). The item category paired with the aversive event is
characterized as *C**S*+ (conditioned category, CSm) and the item
category not associated with the aversive event as *C**S*− (CSm).

The purpose of this pairing was to see if the association with the shock
would affect the participants’ memory for the images. This kind of
experimental design helps to understand hoe emotional experiences can
influence memory.

## About the Data

The preprocessed data are saved as .csv files. You can find a .csv file
for each experiment separately in the above mentioned folder.

**Variables:**

-   study\_id

    -   Indicates experiemnts number

-   participant\_id

    -   The variable indicates the participants ID / number of the
        participant

-   condition -

    -   Describes the item category

    -   CSm - CS- category is the category which is not associated with
        the aversive event

    -   CSp - CS+ category is the conditioned category, item category
        associated with aversive event

-   phase - experimental phase items were first presented

    -   conditioning - items that were first presented during
        conditioning phase
    -   post-conditioning - items that were first presented during
        post-conditioning phase
    -   pre-conditioning - items that were first presented during
        pre-conditioning phase

-   hit - Hit rate

    -   Porportion of previously seen images correctly classified as
        ‘old’

-   fa - False alarm rate

    -   Porportion of new images incorrectly classified as ‘old’

## Data Manipulation

1.  Read the data into your local R environment

2.  Compute corrected recognition scores and save them as a new variable
    (e.g. “cr”)

    -   Corrected recognition is computed by subtraction false alarms
        from hits

    -   The new variable should be part of the data frame, this makes
        plotting easier

3.  If you decide to plot all four experiments, pool the data

    -   Pooling the data means combining the data from all four
        experiments, which are currently stored in separate .csv files,
        into one large file.
    -   The pooled data then contains all four experiments and you can
        filter by ‘study\_id’ in order to create the indivudual plots
        for each experiment.
    -   Note: If you pool the data keep in mind that the participants id
        starts from 1 for each experiement. If you simply merge the four
        file into one, you will have participant no. 1 four times. To
        avoid this duplication a continuous count is needed. This means
        that

## Visualization

[Here you can find the published
paper](https://www.psy.uni-hamburg.de/arbeitsbereiche/kognitionspsychologie/publikationen/kalbe-2021-journal-experimental-psychology.pdf).
Have a look at *Figure 3*. Try to recreate the figure using the provided
data. You can choose which of the four experiments you want to plot.
