# Fun with languages

There are over 7000 languages spoken in the world. In some regions
multiple languages are spoken, some languages are spoken across multiple
regions. The provided dataset collects information about over 7000
languages (including sign languages), such as geographical information,
information about religion and about language families.

# Questions

-   How are these languages distributed?
-   Where is the place with the most diversity (regarding languages)?
-   How are sign languages distributed?
-   How are writing systems distributed?
-   What are the languages and the language families with the most
    speakers?
-   What languages have the most speakers in their family?

# Dataset

The dataset is quite extensive and can be downloaded
[here:](https://huggingface.co/datasets/lukeslp/world-languages/tree/main)
(`world_languages_integrated.json`) as a .json file, You can either
convert it to a .csv or use the jsonlite package in R. There is a lot of
information in the dataset, but for simplicity’s sake I will only be
interested in:

-   the language names
-   the countries the language is spoken in
-   the (number of) speakers of the language
-   the language family
-   the number of speakers of the language families
-   the writing systems
-   longitude and latitude data

# Copyright

The dataset uses a MIT license, which means that we can use, manipulate
and even distribute the dataset, but we need to credit it in a certain
way. Just copy the `license.txt` in my project folder and upload it
along your solution.

# Manipulation goals

-   Make the dataset readable and workable
-   You may decide on how to work with NA data, but document on whether
    you replaced it or dropped it
-   Distinguish sign languages and spoken languages
-   Find the 20 places with the most languages (so the 20 places that
    appear the most in the dataset)

# Visualization goals

-   Plot the five biggest language families and its child languages (as
    a stacked bar plot)
-   Plot all languages that have longitude and latitude provided by
    longitude and latitude (would be nice if it is on a map but I don’t
    know if that is possible)
-   Plot the sign languages and the writing systems in the same way
