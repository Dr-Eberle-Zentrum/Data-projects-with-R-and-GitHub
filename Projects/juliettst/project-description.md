# Project Overview

Sleep is fundamental to physical health, cognitive function, and
emotional wellbeing. Despite widespread recognition of sleep’s
importance, the precise temporal dynamics linking daily sleep patterns
to affective states and depressive symptoms remain incompletely
understood. While cross-sectional studies have established associations
between sleep disturbance and mood disorders, longitudinal intensive
measurement approaches are needed to disentangle cause from consequence
and identify the timescales over which these relationships unfold.

This project examines the bidirectional relationships between sleep
patterns, daily mood fluctuations, and depressive symptoms using
intensive longitudinal data collected over approximately 19 months. By
leveraging daily sleep monitoring alongside planned assessments of
affect and depression screening, we study the temporal precedence and
dynamic influences among these key health indicators. Understanding
these relationships has implications for both prevention (identifying
early warning signs) and intervention (optimizing timing and targets of
treatment).

# Research Questions and Hypotheses

## Hypothesis 1: Acute Sleep-Mood Relationship

**Main hypothesis**: Reduced nocturnal sleep duration on day *t*
predicts lower positive affect and higher negative affect on day *t+1*,
controlling for day *t* mood (autoregressive effects).

**Research question**: What is the magnitude of the lagged effect of
nocturnal sleep duration on next-day positive and negative affect?

## Hypothesis 2: Cumulative Sleep Patterns and Depression Development

**H2a**: Lower mean sleep duration across 2-week blocks (weeks 1-2, 3-4,
5-6) predicts higher BDI scores, with effects strengthening over time
(test interaction: time × sleep duration).

**H2b**: Greater sleep irregularity predicts higher BDI scores beyond
mean duration effects.

**H2c**: The predictive value of sleep deprivation on BDI increases over
time (test: week × sleep interaction), reflecting cumulative burden.

**H2d**: Daytime sleep partially compensates for nocturnal sleep loss in
predicting BDI (test: total 24-hour sleep vs. nocturnal-only sleep
models; interaction between day and night sleep).

# Dataset Description

Here is the data folder: [Open data
folder](Week4%20Homework-%20Sleep%20synthetic%20project/)

## Data Source and Structure

The dataset consists of sleep monitoring data collected via a wearable
device throughout an extended period. The data spans from February 7,
2024 through September 8, 2025, providing nearly continuous daily sleep
recordings across approximately 19 months.

Second and third dataset contains PANAS (Positive and negative affect
schedule) daily mood ratings and BDI (Beck Depression Inventory) scores
at multiple timepoints, but these are available in another files and
have to be combined.

Participants names differ in the sleep annd PANAS+BDI files, they are
named in the following way:

<table>
<thead>
<tr>
<th>BDI + Panas subject ID</th>
<th>Sleep data subject ID</th>
</tr>
</thead>
<tbody>
<tr>
<td>SUBJ1</td>
<td>7G8F</td>
</tr>
<tr>
<td>SUBJ2</td>
<td>15JL</td>
</tr>
<tr>
<td>SUBJ3</td>
<td>ELJT</td>
</tr>
<tr>
<td>SUBJ4</td>
<td>FYKQ</td>
</tr>
<tr>
<td>SUBJ5</td>
<td>HT2J</td>
</tr>
<tr>
<td>SUBJ6</td>
<td>PBL7</td>
</tr>
<tr>
<td>SUBJ7</td>
<td>S7YA</td>
</tr>
<tr>
<td>SUBJ8</td>
<td>WONX</td>
</tr>
<tr>
<td>SUBJ9</td>
<td>YB6F</td>
</tr>
<tr>
<td>SUBJ10</td>
<td>JS27</td>
</tr>
</tbody>
</table>

## Data Format

### Sleep Data

The dataset is provided as CSV files with the following structure:

    ## von,bis,"leicht (s)","tief (s)","rem (s)","wach (s)",Aufwachen,"Dauer des Schlafs (s)","Dauer bis zum Wachwerden (s)","Schnarchen (s)",Schnarchepisoden,"Durchschnittliche Herzfrequenz","Herzfrequenz (min)","Herzfrequenz (max)","Night events"
    ## 2024-02-07T00:15:00+01:00,2024-02-07T08:05:00+01:00,6120,21960,0,120,0,120,0,0,0,54,50,64,
    ## 2024-02-08T00:09:00+01:00,2024-02-08T08:01:00+01:00,20400,7800,0,120,0,120,0,0,0,52,48,65,

### PANAS Data

The second dataset contains daily mood ratings with the following
structure:

    ## participant,date,PANAS_positive,PANAS_negative
    ## P001,2024-02-07,28,15
    ## P001,2024-02-08,32,12

**Columns**: - `participant`: Participant identifier - `date`:
Assessment date (YYYY-MM-DD format) - `PANAS_positive`: Positive Affect
score (range: 10-50) - `PANAS_negative`: Negative Affect score (range:
10-50)

### BDI Data

The third dataset contains depression screening scores:

    ## participant,date,BDI_score
    ## P001,2024-02-14,8
    ## P001,2024-02-28,6

**Columns**: - `participant`: Participant identifier - `date`:
Assessment date (YYYY-MM-DD format) - `BDI_score`: Beck Depression
Inventory total score (range: 0-63)

Variable Definitions

The dataset contains German-language column headers with the following
English translations and descriptions:

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th>German Column Name</th>
<th>English Translation</th>
<th>Description</th>
<th>Units</th>
</tr>
</thead>
<tbody>
<tr>
<td>von</td>
<td>from</td>
<td>Sleep period start timestamp</td>
<td>ISO 8601 datetime</td>
</tr>
<tr>
<td>bis</td>
<td>to</td>
<td>Sleep period end timestamp</td>
<td>ISO 8601 datetime</td>
</tr>
<tr>
<td>leicht (s)</td>
<td>light (s)</td>
<td>Light sleep duration</td>
<td>seconds</td>
</tr>
<tr>
<td>tief (s)</td>
<td>deep (s)</td>
<td>Deep sleep duration</td>
<td>seconds</td>
</tr>
<tr>
<td>rem (s)</td>
<td>rem (s)</td>
<td>REM sleep duration</td>
<td>seconds</td>
</tr>
<tr>
<td>wach (s)</td>
<td>awake (s)</td>
<td>Time awake during sleep period</td>
<td>seconds</td>
</tr>
<tr>
<td>Aufwachen</td>
<td>Awakenings</td>
<td>Number of awakenings</td>
<td>count</td>
</tr>
<tr>
<td>Dauer des Schlafs (s)</td>
<td>Sleep duration (s)</td>
<td>Total sleep period duration</td>
<td>seconds</td>
</tr>
<tr>
<td>Dauer bis zum Wachwerden (s)</td>
<td>Duration until waking (s)</td>
<td>Time until final awakening</td>
<td>seconds</td>
</tr>
<tr>
<td>Schnarchen (s)</td>
<td>Snoring (s)</td>
<td>Snoring duration</td>
<td>seconds</td>
</tr>
<tr>
<td>Schnarchepisoden</td>
<td>Snoring episodes</td>
<td>Number of snoring episodes</td>
<td>count</td>
</tr>
<tr>
<td>Durchschnittliche Herzfrequenz</td>
<td>Average heart rate</td>
<td>Mean HR during sleep</td>
<td>bpm</td>
</tr>
<tr>
<td>Herzfrequenz (min)</td>
<td>Heart rate (min)</td>
<td>Minimum HR during sleep</td>
<td>bpm</td>
</tr>
<tr>
<td>Herzfrequenz (max)</td>
<td>Heart rate (max)</td>
<td>Maximum HR during sleep</td>
<td>bpm</td>
</tr>
<tr>
<td>Night events</td>
<td>Night events</td>
<td>Recorded nocturnal events</td>
<td>text</td>
</tr>
</tbody>
</table>

# Data Manipulation Goals

## 1. Data Cleaning and Validation

**Tasks**:

-   Parse and validate datetime formats
-   Identify and resolve duplicate date entries
    -   Delete them if they are full duplicates
    -   If they start on end at the same time leave the longer one
-   Flag physiologically implausible values (e.g., total sleep &gt; 16
    hours, heart rate &lt; 30 or &gt; 200 bpm)
-   Create data quality flags for each observation
    -   How many missing observations
    -   How many duplicates
    -   **Document**: Create flag variable indicating dates with
        multiple entries (summary table in Markdown with corresponding
        information for each data file)

**Rationale**: Sleep data from wearable devices often contain artifacts,
and multiple entries per date suggest data streaming or synchronization
issues that require resolution.

## 2. Feature Engineering

**Core sleep variables**:

-   **Total sleep duration**: *waking up time - falling asleep time* (in
    hours)
-   **Number of sleep events**: number of entries from each night
-   **Sleep regularity/variability:** Mean deviation from the average
    (total and over each week)

**Temporal variables**:

-   **Date**: Extract date from “von” timestamp

-   **Day of week**: For testing weekly periodicity (text weekdays)

-   **Study day**: Sequential numbering, taking the first day of the
    data collection

-   **Week**: as above

## 3. Data Validation Checks

**Consistency checks**:

-   Verify `sleep duration` ≈ `light + deep + rem + awake`

-   Confirm timestamps logical (bis &gt; von)

-   Check sleep period duration matches timestamp difference

-   Identify outliers: sleep duration &lt; 3 hours or &gt; 12 hours

-   Flag sequences with &gt;3 consecutive missing days

**Physiological plausibility**:

-   Heart rate should remain within 40-100 bpm range during sleep for
    healthy adults

# Visualization Goals

## Primary Visualizations

**1. Sleep Architecture Over Time** (Longitudinal Overview)

-   **Type**: Stacked area chart or ribbon plot
-   **X-axis**: Date or Study day/week
-   **Y-axis**: Sleep duration (hours)
-   **Overlay**: Smoothed trend line (LOESS or moving average)
-   **Purpose**: Visualize sleep stage composition evolution, identify
    periods of disruption
-   

**2. Sleep Duration Distribution** (Variability assessment)

-   **Type**: Density ridges by 2-week blocks
-   **X-axis**: Density, grouped by 2-week periods
-   **Y-axis**: Sleep duration (hours)
-   **Purpose**: Assess sleep regularity and identify high-variability
    periods

**3. Overview of BDI Scores**

-   **Type**: Violin Plot
-   **X-axis**: Density/Occurence
-   **Y-axis**: Score on the BDI
-   **Purpose**: Visual description of the sample

**4. Circadian Pattern Visualization** (Exploratory)

-   **Type**: Circular histogram or rose diagram
-   **Dimension**: Sleep onset time (hour of day)
-   **Color**: Total sleep duration
-   **Facets**: By month or 4-week blocks
-   **Purpose**: Detect circadian stability

**5. Summary Statistics Table**

-   **Type**: Formatted markdown table
-   **Content**:
    -   Overall means and SDs for all sleep variables
-   Statistics by 2-week block (for H2)
-   Missingness percentages
-   Outlier counts before/after cleaning
-   **Purpose**: Provide quantitative summary for reproducibility
