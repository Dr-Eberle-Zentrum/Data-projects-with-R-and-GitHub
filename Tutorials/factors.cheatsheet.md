
- *plotting* presents data in *ascending order* per axis
  - numeric values are put on a discrete/continuous *scale*
  - string values are ordered *lexicographically*
  - factors are using the order of its *levels*
- generally: if you want to have *one tick per value* you *need a factor*

- a *factor* defines valid categories of *categorical data*
  - *levels* are string representations of your categories
  - internally each category is stored by its category index (in levels)
    - thus, order is defined by level order!
  - order can be altered/defined
    - `fct_reorder()` takes a vector of values to be used for ordering
    - `fct_inorder()` uses the first occurrence of each category for ordering
    - `fct_relevel()` makes a given category the first (smallest) level
    - `fct_rev()` reverses the current order
    - `fct_infreq()` defines the order based on level occurrences
  - `fct_recode()` allows to *rename and join levels* 
    - use `fct_collapse()` when joining many levels
