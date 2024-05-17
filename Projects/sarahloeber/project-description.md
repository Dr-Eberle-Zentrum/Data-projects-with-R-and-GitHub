### Project description and context

In order to characterize second language learners language proficiency,
several types of language assessments can be used. One of these
assessments is called Elicited Imitation Test (EIT), a sentence
repetition task that can measure general language proficiency as well as
implicit knowledge of a language. During the test, the test-taker
listens to recordings of sentences and has to repeat them verbatim. The
tests can either be scored manually or by using different approaches,
one of them being utilizing ASR for transcribing the test-taker response
and calculating string edit distance (Isbell et al., 2023). In this
project, I’m interested in how scores on the EIT relate to fluency, for
instance if “higher” fluency features indicate higher scores on the EIT.
Measuring fluency can be done automatically (de Jong et al., 2021) and
the features are included in the dataset.

### Dataset

The dataset we will be working with is my own dataset- and the data was
collected in March, so it’s still a bit messy but should be ready to
work with.  
The dataset contains responses of about 160 people who have taken an
EIT, randomly assigned to five groups (which are indicated by
test\_component\_id). Their responses are automatically scored using
edit distance and I’ve extracted the fluency features per answer. We can
ignore most of the columns for this project. The columns we are focusing
on are

1.  *speechrate*, *articulationrate* which are two of the
    characteristics of fluency. Simply put, higher speech rate and
    higher articulation rate indicate higher perceived fluency,

2.  *user\_id*, which is the participant number, and

3.  *distancelv*, which is the edit distance, in this case Levenshtein
    distance, between the transcription (what the participant said) and
    the correct sentence (what they should have said). The Levenshtein
    distance shows us how different these two strings are. In this
    dataset, the Levenshtein distance score is negated for comparison
    with other edit distance measures, which are not included in this
    dataset. There is a distancelv2 column, but all this is still in
    progress as I’m currently working on aggregated scores.

### Data manipulation goals

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
