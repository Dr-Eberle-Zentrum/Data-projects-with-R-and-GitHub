Hi, Daniela (@DKemp98) and Alexander (@alexanderwinterstetter),

I revisited the project’s goals for this revision. The objective is the
same: exploratory data analysis of word frequency. I divided the goals
into levels of difficulty and the time required to complete them.

-   Mini goal: 1-3 hours
-   Medium goal: 3-5 hours
-   Super goal: 6+ hours

#### Mini-goal: data analysis and visualization of one German president’s speeches content

A frequency diagram and a word cloud would be sufficient to paint a
bird’s eye view of the topics discussed in the aggregated speeches

#### Fair goal: comparative visualizations of two or more presidents

An achievable job, kind of doing the mini-goal twice. But the insight
acquired is worth twice as much. The information gained by analyzing one
president doesn’t tell us much in itself. Many of the words found are
expected in every political speech. But when contrasted to the words
used by another president we can characterize the speakers better; there
is information in the difference.

### Super goal: content and metadata analysis

A goal for the curious and ambitious data scientist. The aim is to
visualize word frequency through time. This approach takes full
advantage of the dataset and its linguistic tags and metadata
information, which allows us to dig deeper into our analysis. One of the
most useful pieces of information is the time stamp because enables a
historical study of the texts and illustrates how a speaker’s language
evolved through their administration.

## Project workflow

At a glance, the project consists of four stages: 1. Data preparation:
from an XML database to tabular or vectorized data 2. Text processing:
from strings to tokens 3. Removing the noise: filtering out *stopwords*
and words and characters without content 4. Frequent analysis and data
visualization

\`NOTE: if you are in a hurry to complete the mini-goal, you can skip
steps 1 to 3 and use this array/[table]() to save time. I haven’t worked
with this type of data (XML and TEI formatted text) and processing it
took me a good part of this weekend. So, I understand if you prefer to
work with tidy and ready-to-use data.

## The process

The general objective of the project is to perform data exploratory
analysis of aggregated data, and specifically, frequency analysis. I
believe the best and easiest way to present preliminary findings is to
plot a frequency diagram or a word cloud to characterize one subset of
the text data.

I decided to partition the dataset by authors and selected just one. For
the mini-goal I choose [Roman Herzog (1994 -
1999)](https://www.bundespraesident.de/DE/Die-Bundespraesidenten/Roman-Herzog/roman-herzog-node.html)
Not because any affinity or affiliation but because it was convenient:
only ten percent of the original dataset and still millions of tokens.

### Step-by-step guide

This is not a tutorial. This is a description of what worked for me to
complete the mini-goal using only [regular
expressions](https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html)
and a scraper library, **rvest** ([rvest
page](https://rvest.tidyverse.org)-[rvest cran
documentation](https://cran.r-project.org/web/packages/rvest/rvest.pdf)).
It is an ugly but working solution. Hope it helps and I’m sure you will
come up with something much better.

1.  Load content and understand its structure
    -   Size ~160 MB
    -   Content: According to the [technical paper]() the dataset
        contains “1 442 texts comprising 2 392 074 tokens, covering a
        period extending from July 1, 1984 to February 17, 2012” from
        the [German
        Presidency](https://www.bundespraesident.de/DE/Home/home_node.html)
        repository of speeches.
    -   XML-TEI tags: - TEI tags: language (“de”) and type of data
        (“text”) - Bibliographic tags: title (three tags: “full,”
        “main,” “excerpt”), author, date, interp (“address”),
        location(“placeName”) - Each tag has an alphanumeric
        identifier - Source (URL) - Data identifiers: text (“text”),
        paragraph (“p”), sentence (“s”), word (“w”)
2.  Create a subset
    -   WARNING: RStudio crashed on me several times trying to perform
        analytics to and visualize the whole dataset
    -   There are two ways to do this:
        -   rvest (hardest)
            -   Open the XML file
            -   Parse the XML file with rvest
            -   Make a list of strings by selecting the “author” tag in
                one column and “text” in another column (each XML tag
                could be the name of a column)
            -   Filter or drop the rows of other authors
        -   Regular expressions (fastest)
            -   Open the XML file
            -   Slicing: Processing the file as a string, pick out a
                unique set of characters that precede the content you
                want. I recommend using an alphanumeric identifier. Then
                cut the text that precedes it.
            -   Same method but now cut after the content interests you.
        -   Write the content into a .txt or .xml file. This is [the one
            I produce]().
3.  Create a table or tabular data from the subset
    -   Open the subset and parse it
    -   Use the parser to find all words “w” and collect them in a
        variable
    -   Create an empty list
    -   Create a for loop the same length as your word variable with a
        local variable for rows and append each word to the empty list.
    -   Check the list’s length, it should be around 323 000 words or 2
        400 000 characters
    -   Create an array or table. This is [the one I produce]().
    -   If you see each word outputted surrounded by the characters “”,
        you can remove them easily with regular expressions. Also drop
        Na values, if any.
    -   Write a .csv file with the table for future exploration
4.  Tokenize words
    -   Read your .csv file and set all the words as a single string
        into a variable
    -   Remove empty spaces, numeric and orthographic characters, and
        symbols
    -   Optional: set the text in lowercase
    -   Add a separator. I use the vertical bar “|”.
5.  Remove stopwords
    -   Download the [stopwords
        package](https://cran.r-project.org/web/packages/stopwords/readme/README.html)
        and remove them from the string
    -   Make a counter and count the most frequent tokens
    -   From the 30 most frequent, select generic words as new
        stopwords. These are the ones I found: ‘quot’, ‘mehr’, ‘heute’,
        ‘immer’, ‘wurde’, ‘gibt’, ‘ja’, ‘geht’, ‘Jahren’, ‘deutschen’,
        ‘dafür’, ‘viele’, ‘gerade’, ‘oft’, ‘Frage’.
    -   Remove the new/custom stopwords and check the length of the
        tokens’ variable (135892 tokens).
6.  Create a new and final table
    -   Count again the tokens’ frequency
    -   Put the outcome into a variable and check length (27552 unique
        tokens)
    -   Write a new table with tokens in one column and their frequency
        in another
    -   Sort it by the frequency column in descending order
7.  Now you’re ready to plot the
    [wordcloud](https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf)
    and whatever frequency diagram you choose!
