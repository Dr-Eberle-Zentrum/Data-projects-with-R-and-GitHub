---
editor_options: 
  markdown: 
    wrap: sentence
---

# Advanced-data-processing-with-R

This project accompanies the course

**"R2 - Advanced data processing in R"**

at the Dr. Eberle Centre for digital competencies at the University Tübingen.

## Topics

-   (R)Markdown
-   factors
-   dates and times
-   ggplot revisited
-   markdown output
-   iteration

## How to contribute?

-   **one issue per topic**:
    -   if not listed yet, create an issue for the topic you want to contribute
    -   OR put your account name in "Assignees" (upper right corner) in an existing project you want to contribute
        -   AND write message what you are going to do within the issue
-   **contributions** are
    -   creating the respective MD file for the topic
    -   writing/editing content
    -   revising/reviewing content

If would be great if everybody **both** is mainly involved in *writing/editing* one topic and *reviewing* another!

## Tutorials

-   [Git-ing started](Tutorials/git-started.md)

## Project descriptions

During the course, you have to formulate a data wrangling project.
That is, you should name or provide a data set, say how the data should be (re)structured and set some visualization goals.
You can use a data set you are working on (note, you might have to make it anonymous to share it) or a data set freely available online, from a publication, whatever.
I strongly suggest "dirty" data that has to be cleaned up and reformatted!
Data cleanup, transformation and extension should be one (big) part of your project!

The formulated projects are the set of exercises you and your fellow students will pick from during the rest of the course, which is discussed below.
But first, some details concerning project definition.

### Phase 1 - drafting a project description

Before you can define a project you need some data!
In order to select something, you might want to "reach high"!
That is, think about something you would like to know or see and what data might be needed for that.
Don't think in terms of "I know how to do" but more "I would like to see" (like "A BOSS")!
Given an idea, start looking for data sets that might help you to provide the information for your idea.
Either you find something useful, or you might change your idea while looking for and investigating available data.

#### Data sets

Best are data set you are working on anyway or that are connected to your field of interest, this such data makes most sense to you and you are most creative about possible analyses.
Or something you have discussed in some other course or project.
It would be **best**, if the data is already in some **table form but not tidy**, i.e. there is still need for some (extensive) data cleaning, formatting, ...

You might not have a data set at hand, so check out open data repositories, websites, etc.
Some open data repositories or search engines are listed at

-   [https://libguides.graduateinstitute.ch](https://libguides.graduateinstitute.ch/rdm/repositories)
-   [https://handsondataviz.org](https://handsondataviz.org/opendata.html)
-   [https://github.com/awesomedata](https://github.com/awesomedata/awesome-public-datasets)

Note down where you got your data from, since you will later have to provide some details about your data!

#### Visualization goals

Next, formulate some rough idea what you would like to see.
If you want to (re)produce a plot you have seen, store the image.
Or just draw a sketch by hand of how it should look like and make a photo.
Anything to transport your idea is fine.

Double check that you think the data set you picked provides (somehow) all information needed to draw your plot of interest.

#### Write up your project description

Write an R Markdown file `project-description.Rmd` to

-   introduce shortly the general topic of your task (to put it in context)
-   introduce the data set, it's origin and important information of what-is-what, etc.
-   define the visualization goal(s) and possible intermediates

It is fine to be vague at some points but you should formulate a clear goal and roadmap.

#### Upload to GitHub

In order to submit your project proposal, you have to upload it to GitHub as part of this project!
To this end:

-   (if not done already) create a subfolder with **your user account name** in the `Project` folder
-   copy the following files to the folder:
    -   your `project-description.Rmd` file from above
    -   all files linked to, loaded or referenced within the project description (data sets, images, ...)
-   knit the file to `PDF` output (*you need LaTeX installed or as a workaround knit to HTML and "print" the page from your browser to PDF. Let me know if you need help here..*)
-   check if all is nicely rendered within the created PDF file
-   `Pull` the recent project version from the GitHub repository
-   `Commit` all new files to git versioning
    -   Markdown, images, PDF output, ...
-   `Push` your changes to github
-   Check online if your PDF is listed on GitHub and renders within the browser

An example project can be found [here](Projects/martin-raden/project-description.html)
