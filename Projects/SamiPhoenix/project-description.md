The data provides the number of species from every class and how they
are classified according to the red list.

Link to the Data: <https://www.iucnredlist.org/statistics> On the site
you will also see, that they are ordered by the Kingdom as well, this is
not yet represented by the data

# Tasks:

## 1. Data import and wrangling

### a) Download the csv-file from the provided link

### b) Import csv into R

### c) Have a look at the Kingdoms (on website table), and find a way to add that information to the data in its own column.

### d) Change the Column names to their full names, as displayed below the table in the Website.

## 2. Data Manipulation

### a) The legend on the website also states that “‘Possibly Extinct’ and ‘Possibly Extinct in the Wild’” are not from the IUCN, as such take them out of your data

### b) Make sure that the Total species for each class is correct

### c) Integrate “LR/cd - Lower Risk/conservation dependent” into “NT - Near Threatened (includes LR/nt - Lower Risk/near threatened)”.

### d) Make sure the total is still correct

## 3. Data Visualisation

### a) Create a separate table that displays the columns as the percent of the total they represent

### b) We want to compare the different Kingdoms, and if they have been affected to different extends:

Calculate how many percent of each Kingdoms’ Species are EX or EW, plot
these in a simple bar diagram, one bar per Kingdom. Plot2 Exclude any
Kingdoms that have total of less than 1000 Species from the plot. \###
c) Next we are interested in the most and least affected classes, as
well as which Kingdom they belong to: Show in a Barplot, the 10 most and
10 least affected Classes, color them according to their Kingdom and
place a legend that explains the colors. Affected being defined as how
many percent are at least Critically Endangered (or EX/EW) Plot1
![image](Projects/SamiPhoenix/dependencies/Plot1)

IUCN Red List Categories: EX - Extinct, EW - Extinct in the Wild, CR -
Critically Endangered (includes CR(PE) and CR(PEW)), EN - Endangered,
VU - Vulnerable, LR/cd - Lower Risk/conservation dependent, NT - Near
Threatened (includes LR/nt - Lower Risk/near threatened), DD - Data
Deficient, LC - Least Concern (includes LR/lc - Lower Risk/least
concern).
