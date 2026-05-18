# Demographic shift in Germany

## Relationship Quality, Fertility Intentions and more 

### An Analysis of the FReDA Data-set

------
 
  In many countries, such as Japan, South Korea, Spain, Italy, Finland, and Germany, societies are struggling with low birth rates. Considering that a fertility rate of 2.1 is necessary to achieve stable demographic conditions, the fertility rates in these countries—Germany (1.3) and South Korea (0.7)—lead to significant problems.

  A persistently low fertility rate means that, over time, the population becomes older on average. This demographic shift creates a cascade of economic and social challenges.
From this huge problem many questions arise: 
How can pension systems be sustained in the future?
Is the so called "Generationenvertrag" in Germany still intact or on the edge of breaking apart?
How can "old societies" finance Health Care systems (Older people require significantly more medical care and cost more)?
How is the economy effected by the shortage of young people entering the job market?

  To prevent the potential negative effects of low fertility rates, many sociologists think about how to prevent (or at least weaken) the ongoing demographic shift. 
One approach for example is to analyse, how effective migration is to reduce workforce-shortage (how can the integration of migrants into the labor market be more efficient?). 

  In this project, we focus on another (in my opinion important) approach:
We want to analyse the reasons behind low fertility rates. 
Only when we understand why people in relationships decide to have no children and which circumstances prevent them from having children, we can make informed policy recommendations, that address the causes rather than just treating the symptoms. 

The Dataset used to analyse this is called FReDA. It is a very big family demography panel study by the Leibnitz Institute for Social Sciences.
To use their own words: "FReDA - The German Family Demography Panel Study" is a scientific study that focuses thematically on family life and intimate relationships in Germany. The study provides researchers with representative, reliable, high-quality data, thus enabling them to conduct up-to-date analyses of the German population and of families in Germany."

It is a panel study. Therefore we have 9 waves (Surveys) reaching from 2021 to 2024.
If we merge these 9 waves togheter we get a total of 194.931 observations and 2316 variables!
I already did the job of filtering relevant variables. So in the Dataset provided are "just" 107.921observations and 203 variables. 
Also, I already merged these 9 waves into 4 waves representing the years 2021 to 2024 (so wave 1 are all waves/surveys from 2021, wave 2 all waves/surveys from 2022 and so on). 
Hint: You can see the codebooks with all variables, questions and scales online. 



[⬇️ **FReDA_panel_4waves_long_labeled.csv.zip**](FReDA_panel_4waves_long_labeled.csv.zip)

Hint: Ignore error message that file is too big. Just open it.

----

## Your Tasks: 

### Task 1

Of course: To analyse reasons of low fertility rates is a very big task. Therefore we just focus on the quality of relationships and how it is effecting fertility intentions.
The variable used to measure the quality of a relationship is called "sat3". It is the satisfaction with the relationship (0=Not satisfied, 10=very satisfied). 
The variable used to measure the general fertility intention is called "frt68".
Question in Survey:"Do you want children or more children at all?" (1=Not at all. 5=Yes, certaintly).
The variable used to measure a more specific intention of getting children is called "frt69"
Question in Survey:"Do you plan to have a child in the next 3 years?" (1=Not at all. 5=Yes, certainly).

1.1. What is the correlation between satisfaction with relationship with the general intention to get children and the correlation between satisfaction with relationship with the more specific intention to get children (in the next 3 years). 

1.2. Make a wonderful graph! On the x-axis: sat3. On the y-axis frt69. I want to see how much percent of people are in each box (there are 55 boxes because sat3 goes from 0 to 10 and frt69 goes from 1 to 5. So you have to visualize all possible combinations of variables. E.g. x% have answered: sat3=0 and frt69=1, y% have answered sat3=1 and frt69=1, and so on.). 

1.3. Why do you think that people who are satisfied with their relationship the most are seemingly less likely to get children in the near future? 

1.4. What statistical problems do we run into? (Hint: Look at the distribution in the variable sat3. How many percent are unsatisfied or very unsatisfied?)

### Task 2

Now we want to see if there are regional differences between East and West Germany on how a good relationship should look like. 
  Perhaps different viewpoints on this matter lead to different regional definitions of relationship quality?
  We focus on different viewpoints on the role of a mother in a family. A rather conservative ideal of a good relationship is, when the woman is staying at home to care for the family. A variable which could measures this view is called "val1i3". Question in survey: "Women should take care of the family more than their career." (1=Not at all, 5=Yes, absolutely). 
  Another relevant variable in this context is called "val1i5" Question in survey: "A child under the age of 6 is suffering, if the mother works." (1=Not at all, 5=Yes, absoluetly). 
  The variable "east" is used to differentiate between East and West Germany. It measures if someone is living in East Germany (0=No, I do not live in East Germany, 1=Yes, I live in East Germany). For simplification, we assume that everyone who is not living in East Germany, is living in West Germany since the surveys from FReDA are only handed out in Germany. 

2.1. Which region has more conservative viewpoints regarding the role a mother should play in the family? Which region has more egalitarian viewpoints?

2.2. Make a wonderful graph! It should visualize the regional differences between East and West Germany according to these different values on the role of woman in families. Think for yourself what kind of graph would suit best to visualize this.

### Task 3 (optional)

  If you really want to show of you can also think about other variables in the Dataset who could effect fertility intentions (frt68, frt69). For example: What role does trust in institutions play? What happens with the correlation beween satisfaction with relationship and fertility intentions, when we control for trust in institutions? 
  You can research the Dataset for yourself for potential variables and questions that could be relevant for fertility intentions.
  In the end, if you really want to show off, you can also do a multiple regression analysis to see which variables have the biggest effect on fertility intentions.
  
  Finally, you can think about policies, that would improve fertility rates based on the results of your analysis. For example: If you find out that people with low trust in institutions are less likely to have children, you could think about policies that would increase trust in institutions.






