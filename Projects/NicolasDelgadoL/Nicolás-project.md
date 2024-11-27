## Social media app-preference of young adults by personality profile

Hello there!

In this project, you are tasked with generating a spider-web diagram on
the relation between social-media applications use and the personality
profiles of more than 3000 users. We want to focus on the data regarding
“young adults” (18 to 34) in particular. The social media platforms
included are Whatsapp, Facebook and Instagram, and the personality
profiles are are based the “Big-5” trait-model of personality, which
measures Openness, Conscientiousness, Extraversion, Agreeableness and
Neuroticism by means of a standardized questionnaire.

### Data

The data can be found under the “suplementary material” of [this
paper](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.00936/full),
on the right side of the page. The “Data sheet 1” contains an
explanation of the variables in “Data sheet 2”; this is where all the
info really is. Here you will find the variables: Age Gender, Education,
has\_whatsapp, has\_facebook and has\_instagram, followed by 45
variables encoding for the personality questionnaire answers. Luckily,
we can ignore this and focus on the personality trait final scores,
encoded as BFI\_Extra, BFI\_Agree, BFI\_Consc, BFI\_Neuro and BFI\_Open.
We can also ignore the subdivisions (e.g. BFI\_Open\_Aesth,
BFI\_Open\_Idea).

Tables 1 through 5 present important summary statistics that relate
social media use to age (1), gender (2), education (3) and personality
profile (4-5), respectively, but the format cannot be directly worked
with, so any valuable info contained here has to be recreated form “Data
sheet 2”.

### Data manipulation

We want to focus on the 18 to 34 age group (arbitrarily), so you will
have to filter the data accordingly. We also want to disregard the
differences in gender and education level to look only at those
associated with personality, which means you will have to average across
those variables.

We are interested in the personality-trait values of users of single
apps (W, F, I), but also of users of multiple apps or of none (W-F, F-I,
W-I, W-F-I, none). This gives us 8 different combinations (represented
for instance in Table 5). The aim is to plot a different “web” in the
diagram for each of these possibilities, so you might want to create
separate columns to store the values for the combinations, which are not
explicitly included in “Data sheet 2” (tip: the variables has\_whatsapp,
has\_facebook, has\_instagram encode the info of each user’s app use).

### Data visualization

The goal is to create a spider-web diagram that looks like the one in
the example below. In a such a diagram, the distance from the center
represents the average score of the personality trait, and the “angle”
represents the trait itself. You should include a title and a legend.
The personality components should be labeled in five points on the
margin of the diagram. The filling of the different social media
platforms should be semitransparent and of different colors, so that the
overlaps and the differences between the “webs” are more apparent.
Ideally, labeled concentric circles (0.2, 4.0 …) should also be included
to show the degree of association with each personality trait.

Note the illustration below includes Twitter, snapchat and LinkedIn,
which are not part of the data. Instead, the legend should include the 8
combinations of social media use mentioned above.

Which conclusions/hypotyhesis can we draw from the resulting graph? Do
they match some of the results of the study (found in “Presentation 1”)?

Best of luck on your implementation!

<figure>
<img src="Example%20spider-web%20diagram.png%20=200x"
alt="Example spider-web diagram" />
<figcaption aria-hidden="true">Example spider-web diagram</figcaption>
</figure>
