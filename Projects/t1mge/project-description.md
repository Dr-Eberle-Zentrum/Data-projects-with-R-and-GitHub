## Background of the dataset

This data was acquired from two groups of healthy pregnant woman one
with normal weight (NW, BMI 18.5-24.9) and one slightly overweight (OW,
BMI 25-29.9). the researchers looked at the mothers immune cells to find
out how the difference in BMI affect those cells during pregnancy and
how those changes can link back to the diet, microbiome or baby
microbiome.

“Rep” means: “biological replication” = Repeating an experiment using
different biological specimens under the same conditions to account for
natural variability

Source of the Data:
<https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE273780>

[RNA\_seq\_data.csv](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/t1mge/GSE273780_EukmRNAseq_counts.csv)

The columns of the data set each correspond to one sample, so G92 could
be pregnant woman at week 36 normal weight rep 2 or similar. For later
we are only interested in some of these observations.

To find out which conditions correspond to which columns go to the
source of the data.  
If you are on the site which I linked under “Source of Data” you have to
scroll down until you see Samples (59) there you can press more and you
will see all the sample. Choose the sample you are interested in. You
will be redirected to a new page, where you just have to look for the
description. The description will tell you the name of the column by
that you can match column name and sample type

    ##     X       Row.names  G58   G52  G25   G84    G2  G60   G41   G36   G73   G79
    ## 1   1 ENSG00000000003   23     0   23     7    14   18    15     3     0    12
    ## 2   2 ENSG00000000005    0     0    0     0     0    0     0     0     0     0
    ## 3   3 ENSG00000000419  469   348  494   334   567  616   342   383   363   409
    ## 4   4 ENSG00000000457  196   198  403   202   382  166   240   168   124   244
    ## 5   5 ENSG00000000460   40    45   82    38    70   36    40    26    33    52
    ## 6   6 ENSG00000000938 9567 14297 8058 13908 10128 6291 14438 10547 10985 15057
    ## 7   7 ENSG00000000971   20     3    5     4    31   22     1    22    14    12
    ## 8   8 ENSG00000001036  392   714  297   469   408  354   545   370   442   589
    ## 9   9 ENSG00000001084  330   337  490   320   489  374   421   402   279   416
    ## 10 10 ENSG00000001167  466   491  724   433   660  647   641   556   502   443
    ##      G74   G90   G31   G46   G83   G89   G67   G28   G55   G26   G63   G69
    ## 1      5     4    11    19     8     3     8    16    24    10    27    16
    ## 2      0     0     0     0     0     0     0     0     0     0     0     0
    ## 3    402   317   382   387   443   424   444   632   813   373  1247   375
    ## 4    245   137   205   193   313   236   297   270   559   295   455   179
    ## 5     73    21    29    29    66    68    68    54   119    60   107    40
    ## 6  17799 13046 11323 11466 12620 23353 15412 13253 15210 12301 19379 17768
    ## 7      8     8    29    10    11    21    24    13    34    19    33    14
    ## 8    559   555   476   631   489   790   557   576   616   386  1174   642
    ## 9    500   240   334   357   426   370   464   490   867   460   852   334
    ## 10   540   394   421   494   596   454   503   495  1237   629   808   357
    ##      G87   G48  G35   G42   G77   G38  G45   G32   G64   G80   G88   G11  G66
    ## 1      3    16   23     4     5    16    6    14     4     7     3    34   15
    ## 2      0     0    0     0     0     0    0     0     0     0     0     0    0
    ## 3    290   387  443   345   470   555  399   480   557   418   298  1024  386
    ## 4    191   187  165   213   340   356  326   388   261   297   165   633  190
    ## 5     60    28   23    40    71    78   90    84    65    37    33   132   22
    ## 6  19190 11581 7793 13080 29079 14459 9630 14931 12419 17088 18538 52130 9577
    ## 7     11    15    9    21    11     5    6    31     2    15     4    43   25
    ## 8    617   630  342   563  1107   638  494   558   498   760   668  2263  347
    ## 9    340   385  380   308   538   429  536   650   463   321   298  1195  351
    ## 10   441   548  550   563   648   678  860  1111   646   466   448  1110  496
    ##      G54   G75   G30   G40  G78   G72   G59   G61   G9   G85   G81   G65  G12
    ## 1     15     1     3    24    8     7    16    27   13     0    18    11    6
    ## 2      0     0     0     0    0     0     0     0    0     0     0     0    0
    ## 3    530   359   450   422  362   417   468   589  631   319   426   473  372
    ## 4    306   265   278   385  290   195   253   309  400   133   253   306  192
    ## 5     65    84    61    69   75    35    82    53   99    24    49    96   54
    ## 6  15986 15436 13094 14061 9874 12515 11256 12136 8428 15919 14224 13083 8108
    ## 7     24    14    48     3    2    16    26    18   33     6    14    10   11
    ## 8    563   565   436   486  383   410   505   504  474   623   556   573  390
    ## 9    551   451   309   571  444   365   418   451  577   261   356   561  331
    ## 10   668   568   435   712  712   555   617   539  653   485   463   668  463
    ##      G57   G76  G44   G43   G34   G49   G50   G27   G68  G86   G62 hgnc_symbol
    ## 1      1     4   21    18     2    15     0     7     4   12    13      TSPAN6
    ## 2      0     0    0     0     0     0     0     0     0    0     0        TNMD
    ## 3    374   390  518   426   389   483   375   525   435  460   514        DPM1
    ## 4    271   251  327   309   153   317   246   281   329  194   272       SCYL3
    ## 5     37    38  110    92    26    47    64    58    47   48    53    C1orf112
    ## 6  12489 16111 9555 11428 12809 10459 19620 13108 15107 7133 12090         FGR
    ## 7     45    10   13    19    15     7     5    17    26    9    31         CFH
    ## 8    527   535  398   456   646   316   746   524   641  383   464       FUCA2
    ## 9    400   338  496   533   408   367   535   394   298  428   406        GCLC
    ## 10   545   387  736   714   613   407   616   422   427  515   396        NFYA
    ##                                                                                       description
    ## 1                                               tetraspanin 6 [Source:HGNC Symbol;Acc:HGNC:11858]
    ## 2                                                 tenomodulin [Source:HGNC Symbol;Acc:HGNC:17757]
    ## 3  dolichyl-phosphate mannosyltransferase subunit 1, catalytic [Source:HGNC Symbol;Acc:HGNC:3005]
    ## 4                                    SCY1 like pseudokinase 3 [Source:HGNC Symbol;Acc:HGNC:19285]
    ## 5                         chromosome 1 open reading frame 112 [Source:HGNC Symbol;Acc:HGNC:25565]
    ## 6               FGR proto-oncogene, Src family tyrosine kinase [Source:HGNC Symbol;Acc:HGNC:3697]
    ## 7                                          complement factor H [Source:HGNC Symbol;Acc:HGNC:4883]
    ## 8                                         alpha-L-fucosidase 2 [Source:HGNC Symbol;Acc:HGNC:4008]
    ## 9                  glutamate-cysteine ligase catalytic subunit [Source:HGNC Symbol;Acc:HGNC:4311]
    ## 10                nuclear transcription factor Y subunit alpha [Source:HGNC Symbol;Acc:HGNC:7804]
    ##    chromosome_name strand external_gene_name
    ## 1                X     -1             TSPAN6
    ## 2                X      1               TNMD
    ## 3               20     -1               DPM1
    ## 4                1     -1              SCYL3
    ## 5                1      1           C1orf112
    ## 6                1     -1                FGR
    ## 7                1      1                CFH
    ## 8                6     -1              FUCA2
    ## 9                6     -1               GCLC
    ## 10               6      1               NFYA

## Wrangling goals

1.  Import the data
2.  Figure out what you are looking
3.  Filter out the count data of 2 replicates each of normal weight and
    overweight woman at week12 and at week 36 (G columns with number are
    the counts, and rows are the specific genes) so that you have the
    rows left for week12(Normal‑1, Normal‑2, Overweight‑1, Overweight‑2)
    and for week36 the same ones
4.  Keep the column, external gene names
5.  rename the columns with more readable names
6.  Normalize the data from counts to counts per million (add up all the
    counts per sample and divide each sample by this, then multiply by
    1.000.000)
7.  log2 transformation of the counts per million to make the data more
    symmetric
8.  Drop any rows with blank names and count values between 0 and 2
9.  Calculate the z-Value of each count in new columns by subtracting
    the normalized count value by the mean of the column and divide by
    the columns standard deviation
10. Calculate the variance of the log2 transformed counts by rows and
    put it in a new column.

With these steps you should end-up with the z-values and the varaince
which are used in the heatmap

## Visualization Goals

### Produce a clustered heatmap of the top50 genes

1.  Rank all genes descendingly by variance
2.  keep only top 50 highest-variance genes for the heat map
3.  Rows should be the external gene names; columns the samples
4.  produce a heat map looking something like blow.

You can use this resource to get more information on how to create
heatmaps: <https://r-graph-gallery.com/heatmap>

If you get a simple heatmap with just the annotations, that would
already be amazing.

Further if you have a lot of time you can create an interactive heatmap.
In which you can hover over the tiles and get information on the
z-value, the gene name and the sample description. An example is also
shown on the resource for heatmaps form above.

### Why do such a data analysis?

At the end you could theoretically tell the difference between both
groups and see if certain genes are enriched. For example inflammatory
genes could be enriched but it is also possible that no difference or
only slight differences will be reveal. These can be starting points for
further experiments.

I hope it is going to work out for you!

Good Luck!!

![](https://raw.githubusercontent.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/refs/heads/main/Projects/t1mge/Heatmap%20beispiel.png)
