This aggregated cheatsheet of our tutorial package [Advanced data
processing with
R](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R)
summarizes the individual notes from the provided tutorials and
additional information from recommended sources.

## Git-ing started

-   `git` enables collaborative project development ([UZH
    tutorial](https://geo.uzh.ch/microsite/reproducible_research/post/rr-rstudio-git/))
    -   keeps track of all changes
    -   maintains a *local copy* of a project on your computer
        (*offline*)
    -   can synchronize this copy with a *remote copy* (*e.g. online on
        GitHub*)
        -   it is able to merge multiple (text) file changes in most
            cases
-   **always `pull`** the recent version *before starting* your daily
    work
-   when you want to lock and upload your changes you have to
    1.  **`commit`** the changed files to your local copy along with a
        *useful comment*
        -   you can do multiple commits with independent comments (but
            all changes still offline)
    2.  **`push`** all “committed” changed to the remote copy
        (e.g. GitHub)
        -   Note: this might fail if the remote version of your project
            already has newer changes!
        -   Recommended: update your project’s status via `pull` before
            doing a `push`!
-   at some point you will get a [**merge
    conflict**](https://www.atlassian.com/git/tutorials/using-branches/merge-conflicts):
    -   i.e. `git` finds a newer remote version of a file changed by you
        with changes at the same spots
    -   thus, `git` does not know what is the correct change
    -   respective lines are highlighted with arrow blocks `<<<<`,
        `>>>>`
        -   find them
        -   decide what lines to keep (and remove the others)
        -   remove the `<<<<`, `>>>>`, .. parts
        -   commit and push your manually merged files!
-   a `branch` is a “copy” of your project with an independent tracking
    of changes
    -   they are used to *isolate code developments* until they are
        stable/working
    -   a
        [`pull request`](https://www.atlassian.com/git/tutorials/making-a-pull-request)
        aims at merging your changes back into the project
