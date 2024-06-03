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
work with.  
The dataset contains responses of about 160 people who have taken an
EIT in English, randomly assigned to five groups (which are indicated by
test_component_id). Their responses are automatically scored using
edit distance and I have extracted the fluency features per answer. I have also
removed practice and filler items of the EIT, so we only have items left
that count towards the final score.

We can ignore most of the columns for this project. The columns we are focusing
on are

1.  *articulationrate* and *npause* which are two of the
    characteristics of fluency. Articulation rate measures how many syllables
    have been uttered in the speaking time, whereas number of silent pauses
    refers to the amount of times the test-taker paused during speaking time.
    Simply put, higher articulation rate and
    fewer number of pauses indicate higher perceived fluency.

2.  *user\_id*, which is the participant number, and

3.  *lv_trunc*, which is the edit distance, in this case Levenshtein
    distance, between the transcription (what the participant said) and
    the correct sentence (what they should have said). The Levenshtein
    distance shows us how different these two strings are. In this
    dataset, the Levenshtein distance score is negated for comparison
    with other edit distance measures, which are not included in this
    dataset. 
    
4. *test_component_id*, which refers to the conditions the participants got
    assigned to randomly. For the sake of simplicity, I will not elaborate on
    them here, but it's a good way to see if there are differences between groups.

### Data manipulation goals

You might notice that the first few rows are duplicated several times, so we first 
need to make sure that there are no duplicates in the dataset. 

Since the edit distance values are negated, this might make
visualization problematic, so feel free to transform them to positive
values. However, when doing this - higher scores then mean higher
discrepancy from the target sentence so the more positive a score, the
less accurate a participant has repeated the sentence, which is a bit
counter intuitive.

### Visualization goals

A scatterplot grouped by participant condition (test\_component\_id)
would probably look nice, something like this - but feel free to be
creative:
![](https://r-charts.com/en/tags/ggplot2/facets-ggplot2_files/figure-html/facet-wrap-ncol.png)

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
