<style>
.invisible-link a {
    opacity: 0;
}

.invisible-link a:hover {
    opacity: 1;
}
</style>

# **Topic of the Project <span class="invisible-link">[🔗](#Topic-of-the-Project)</span>**

------------------------------------------------------------------------

You probably know [Elon’s
Cybertruck](https://s1.cdn.autoevolution.com/images/news/elon-musk-suggesting-the-cybertruck-is-bulletproof-is-reckless-and-nothing-new-223201_1.jpg).

This remarkable ride looks like it’s straight from a post-apocalyptic
era.

However, it’s still way too ugly and edgy.

For this reason, in this project, we are creating a Standard Operating
Procedure or
[SOP](https://www.digimojo.de/blog/was-ist-eine-sop-standard-operating-procedure-standardarbeitsanweisung)
Layout in .md format for Elon, and together we’ll secure his place in
the billionaire’s rank list. <https://www.bloomberg.com/billionaires/>

------------------------------------------------------------------------

## **The SOP Layout <span class="invisible-link">[🔗](#The-SOP-Layout)</span>**

The final layout should contain:

-   A Headnote containing: “Standard Operating Procedure” Article:
    \[article\_number\]/\[article\_number\_coupl\]

-   A logo in the top-right corner

-   A Header: Manufacturing of Raw Product:
    \[article\_number\]/\[article\_coupl\]

-   A table of the manufacturing steps (3 columns).

-   A footnote containing: date / name / page

### **The Table-layout <span class="invisible-link">[🔗](#The-Table-layout)</span>**

-   Above each manufacturing step, there should be a row that contains
    the column headers.

-   You can find the Column headers in the [Codebook](#Codebook) under
    **Section**

-   Make an extra row for each manufacturing step (each Codebook entry).

-   The headers of each manufacturing steps should be numbered
    consecutively. Beginnig with Overview “Arbeitschritt 1:” and so on…

-   The sequence of the manufacturing steps is determined by the
    Codebook according to their number.

-   The Column sequence should be following “Arbeitsschritt”, “Ablauf”,
    “Hilfsmittel”.

-   If there is no value for a Manufacturing Step, don’t show it in the
    final layout.

[<img src="Layout example.png" alt="Bildbeschreibung" width="500" style="display: block; margin: 0 auto;"/>](Layout%20example.png)

## Dataset <span class="invisible-link">[🔗](#Dataset)</span>

The Dataset contains one folder with tables, you can merge them by the
ID (col1).

In the Codebook folder, you’ll receive the corresponding Codes.

In the Image folder, you’ll find the corresponding images.

Take care, one cell can contain more than one value. ⚠️

### **Codebook <span class="invisible-link">[🔗](#Codebook)</span>**

Under **Section**, you see the corresponding columns names for the final
layout.

The Column **Image** contains the images that should be shown in the
corresponding row section.

1.  Overview.xlsv contains a column **“TextBaustein”**.

-   The label “Introtext” is always shown.
-   The label “InfoVarX” one of the variants is always shown, depending
    on the value in Column \[Stempel\].
-   The label “InfoAddVarX” is shown in addition if the values of
    `Handschuhe == TRUE` or `if_gew == TRUE`.

Codebook 2. - 5. containing a column named **TableId** those will either
represent a condition or correlate to a table value with the represented
strings and images.

6.Verpackung.xlsv the value “InfoAddVar” is only shown if
`vp_count_layer2 != 0`.

You Probably need to mutate a new column \[count\_total\] to show the
right total amount per box.
`[vp_count_layer]x[vp_count_layer_pcs]+[vp_count_layer2]`

**If the Codebook contains square brackets, they represent a table
value.**

The value \[“always”\] in **TableID** means this message part is always
shown.

------------------------------------------------------------------------

**Elon be ready, together we will fix your mistake !**

[<img src="elon_musk_jesus_meme.png" alt="Bildbeschreibung" width="300" style="display: block; margin: 0 auto;"/>](elon_musk_jesus_meme.png)
