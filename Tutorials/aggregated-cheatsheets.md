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

## Cheatsheet “coding-basics”

-   important data structures
    -   `vector` = all elements are same data type
    -   `list` = most general, can contain anything, any size, …
    -   `data.frame/tibble` = list of vectors (of same lengths)
        -   ==&gt; if tidy, resp. column values (in one row) are
            associated with one observation
-   *subsetting* can be done using
    -   `[]` = reduces the current object to the selected part(s) (same
        data container)
    -   `[[]]` = provides a *single element* (element-specific data
        container)
    -   `$` = shortcut for `[[]]` with name
-   programming of workflows often requires
    -   *iteration* of code blocks (`for` or `while` loops)
        -   `for( VARIABLE in DATA ) {...}`
        -   each *element* of `DATA` is *one by one* stored in
            `VARIABLE` before running `{...}`
        -   e.g. `for( d in list( x="haha", y=1:3)) { print(length(d)) }`
    -   *conditional* code execution (`if/else` statements)
        -   `if ( CONDITION ) {..T..} else {..F..}`
        -   `else {..B..}` is optional
        -   `CONDITION` must evaluate to a *single* `TRUE|FALSE`:
            triggers execution of respective `{..T|F..}` block
            -   e.g. `if ( 1:4 == 2 ) {}` not working since check
                returns four logic values!
        -   e.g. `if ( version$os == "mingw32" ) { print("MS Windows user?") }`
    -   *generalization* of code blocks (`function` definition and
        usage)
        -   `myFunction <- function (ARGUMENTS) {...}`
        -   `ARGUMENTS` are optional (first should be the data to work
            on)
        -   run via `myFunction( .. )` using appropriate values for
            `ARGUMENTS`
        -   return via `return()` in `{...}` (default: last “printed”
            value is returned)
        -   to return multiple values, aggregate them in `list()` or
            vector `c()`
-   redundant code w.r.t. **values** of a variable ==&gt; `for` loop
    generalization
-   redundant code w.r.t. **variables** or **function** calls ==&gt;
    `function` generalization
-   iteration tricks
    -   *best iterate directly on the elements*, if you don’t need the
        element names or index!
    -   use `seq_along()` to generate the list of *valid indices* of a
        vector or list
    -   use `names()` to access the vector of *element names* of an
        object
-   when a function calls itself it is called a *recursive call* or
    *recursion*
-   function names (without brackets) can be stored in and used from
    variables/arguments to call the functions
