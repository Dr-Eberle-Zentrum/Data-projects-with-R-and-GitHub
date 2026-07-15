Project-Solution
================

# Fun with languages

There are over 7000 languages spoken in the world. While some regions
are home to a rich diversity of languages, individual languages may also
be spoken across multiple countries. The provided dataset collects
information about over 7000 languages (including sign languages), such
as geographical information, information about religion and about
language families. I am particularly interested in the regions with the
greatest language diversity and in the (geographical) distribution of
languages. I also want to take a look at the corresponding language
families.

## Questions and Tasks

1.  Where is the place with the most diversity (regarding languages)?
2.  How are these languages distributed?
3.  What are the languages and the language families with the most
    speakers? What languages have the most speakers in their family?

## Clean Data

Two things have to be solved before any plot can be drawn:

1.  **Flattening.** `extract_language_entry()` pulls exactly four fields
    out of each entry and returns a one-row tibble; `map_dfr()` stacks
    them into a rectangular data frame. The `%||%` operator substitutes
    `NA` whenever a field is absent, so a missing value never silently
    drops a whole record.

2.  **Country names.** The country strings in the JSON do not always
    match the `admin` names used by `rnaturalearth` (e.g. *“USA”* vs
    *“United States of America”*). I therefore fuzzy-match every country
    against the map’s names.

The cleaned dataset contains 11715 rows in total.

*Missing values summary:*

- Missing country information: 980
- Missing speaker counts: 980
- Missing language family information: 9452

## Visualization

### 1. Where is the place with the most diversity (regarding languages)?

I read “diversity” as *the number of distinct languages spoken in a
country*. Because the long format contains one row per language–country
pair, a language spoken in ten countries would otherwise be counted ten
times in the same country if the source lists it repeatedly;
`distinct()` before `count()` guarantees that every language is counted
**once per country**.

**Top 20 countries by number of languages**

| Country                          | Number of languages |
|:---------------------------------|:-------------------:|
| Papua New Guinea                 |         826         |
| Indonesia                        |         687         |
| Nigeria                          |         504         |
| United States of America         |         353         |
| China                            |         315         |
| Mexico                           |         289         |
| Cameroon                         |         281         |
| Democratic Republic of the Congo |         225         |
| India                            |         209         |
| Canada                           |         185         |
| Philippines                      |         179         |
| Australia                        |         175         |
| Brazil                           |         169         |
| Panama                           |         157         |
| Malaysia                         |         154         |
| Myanmar                          |         138         |
| Chad                             |         128         |
| Russia                           |         116         |
| Vanuatu                          |         107         |
| Vietnam                          |         106         |

On a linear colour scale everything except the top few countries would
collapse into a single shade, so I map the fill to `log10(n_languages)`
and re-label the colour bar with the original counts (1, 3, 10, … 1000).
Countries with no data keep a neutral grey, which distinguishes “no
information” from “few languages”.

<img src="Project-Solution_files/figure-gfm/q1-diversity-map-1.png" alt="" width="100%" />

The map shows that linguistic diversity is not evenly spread: it
concentrates in a tropical belt — Papua New Guinea, Indonesia, Nigeria,
India — whereas large, historically centralised states (Russia, most of
Europe, the Americas) are comparatively homogeneous.

### 2. How are these languages distributed?

Two different notions of “big” are worth separating: a language can have
many **speakers** (Mandarin) or be present in many **countries**
(English). I therefore summarise each language once, with both measures.
`first(speakers)` is used rather than `sum()` because the speaker count
is a *language-level* attribute that is repeated on every country row —
summing it would multiply the count by the number of countries.

**Top 5 languages by number of speakers**

| Language         | Total speakers | Countries |
|:-----------------|:--------------:|:---------:|
| Mandarin Chinese |   964553200    |    78     |
| Hindi            |   703211800    |    54     |
| Spanish          |   457774910    |    62     |
| English          |   373691840    |    136    |
| Bengali          |   238634300    |    31     |

<img src="Project-Solution_files/figure-gfm/unnamed-chunk-1-1.png" alt="" width="100%" />

<img src="Project-Solution_files/figure-gfm/unnamed-chunk-2-1.png" alt="" width="100%" />

### 3. Languages and language families with the most speakers

A language family aggregates its languages, so its speaker total is the
sum over its members.

**Top 5 language families by number of speakers**

| Language family | Total speakers |
|:----------------|:--------------:|
| Indo-Iranian    |   1357864800   |
| Sinitic         |   1197272500   |
| Italic          |   823744970    |
| Germanic        |   487451040    |
| Balto-Slavic    |   268649810    |

For each of these five families we draw a stacked bar of its ten largest
languages. The stacking shows two things at once: the **height** is the
family total, the **segments** show how that total is composed — whether
the family is dominated by one giant language or spread over several
mid-sized ones.

<img src="Project-Solution_files/figure-gfm/q3-family-plots-1.png" alt="" width="100%" />

# Data Source & License

This project uses the [World Languages
dataset](https://huggingface.co/datasets/lukeslp/world-languages) by
lukeslp, licensed under the MIT License. See `license.txt` in this
repository for the full license text.
