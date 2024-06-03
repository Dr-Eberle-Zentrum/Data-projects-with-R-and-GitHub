### Project description and context

In order to characterize second language learners language proficiency,
several types of language assessments can be used. One of these
assessments is called Elicited Imitation Test (EIT), a sentence
repetition task that can measure general language proficiency as well as
implicit knowledge of a language and is widely used in Second Language Acquisition (SLA)
Research. 
During the test, the test-taker listens to recordings of sentences and repeats 
them verbatim. 
The tests can either be scored manually or by using automatic approaches.
One of those automatic approaches is utilizing Automatic Speech Recognition (ASR) for transcribing 
the test-taker response and calculating string edit distance (Isbell et al., 2023),
which quantitatively characterizes the extent to which the test-taker response differs 
from the stimulus.
An aspect that can influence scores in spoken assessment situations is speech fluency. 
In this project, I am interested in how the automatic scores on the EIT are influenced by fluency, 
for instance if “higher” fluency features are reflected in higher automatic scores on the EIT.
This is a simplified question since fluency features would rather influence the transcription of the ASR and therefore the edit distance and, in case of manual scoring, the human judgement, but we will stick with the above question for now. 
Measuring fluency can be done automatically (de Jong et al., 2021) and the features are included 
in the dataset.

### Dataset

The dataset we will be working with is my own dataset- and the data was
collected in March, so it’s still a bit messy but should be ready to
work with. You can see two csv files here, one called fluency_features and one
called total_scores.
The fluency features dataset contains responses of about 160 people who have taken an
EIT in English, randomly assigned to five groups (which are indicated by
test_component_id). Their responses are automatically scored using ASR transcriptions and
edit distance and I have extracted the fluency features per answer. 
For ease of working, I have also uploaded a csv with the aggregated scores per user,
which is the total_scores file.

We can ignore most of the columns for this project. The columns we are focusing
on in the fluency features dataset are

1.  *articulationrate* and *npause* which are two of the
    characteristics of fluency. Articulation rate measures how many syllables
    have been uttered in the speaking time, whereas number of silent pauses
    refers to the amount of times the test-taker paused during speaking time.
    Simply put, higher articulation rate and
    fewer number of pauses indicate higher perceived fluency.

2.  *user\_id*, which is the participant number, and
    
3. *test_component_id*, which refers to the conditions the participants got
    assigned to randomly. For the sake of simplicity, I will not elaborate on
    them here, but it's a good way to see if there are differences between the conditions.
    
In the csv named total_scores, you will find the columns *user_id* as well as *final_score*,
which is the aggregated score of the test for each user. These range from 0 to 100. 

### Data manipulation goals

You might notice that the first few rows of the fluency features dataset are duplicated several times, 
so we first need to make sure that there are no duplicates in the dataset. 

Furthermore, in order to link everything to the aggregated scores, we should probably
aggregate the fluency features from the fluency_features dataset as well and add those as additional 
columns to the total scores. 
This can be done in a super simple way.
I would propose that per user, we just take the mean of their articulation rate as well as
the mean of their silent pauses. These are two separate values, since a "total" score for fluency
would have to take other variables into account as well. 
Furthermore, for group comparison, we should also add a column with test_component_id to the 
total scores. 


### Visualization goals

A scatterplot grouped by participant condition (test\_component\_id)
would probably look nice, something like this - but feel free to be
creative:
![](https://r-charts.com/en/tags/ggplot2/facets-ggplot2_files/figure-html/facet-wrap-ncol.png)
For this plot, I would like if there were trend lines as well

I also really liked Martin's suggestion of a 2D-density plot, which could look like this:
![](https://i.sstatic.net/DxUL8.png)
For this, it would be great to get all groups into one plot. If the differences between groups
are small, however, this might not work as intended.

### References

Daniel R. Isbell, Kathy MinHye Kim, and Xiaobin Chen. 2023. Exploring
the potential of automated speech recognition for scoring the Korean
Elicited Imitation Test. *Research Methods in Applied Linguistics*,
2(3): 100076. <https://doi.org/10.1016/j.rmal.2023.100076>

Nivja H. de Jong, Jos Pacilly, and Willemijn Heeren. 2021. PRAAT scripts
to measure speed fluency and breakdown fluency in speech automatically.
*Assessment in Education: Principles, Policy & Practice*,
28(4):456–-476. [doi:
10.1080/0969594X.2021.1951162](doi:%2010.1080/0969594X.2021.1951162).
