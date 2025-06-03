## Data manipulation

Import the data

    ##   X       Row.names  G58   G52  G25   G84    G2  G60   G41   G36   G73   G79
    ## 1 1 ENSG00000000003   23     0   23     7    14   18    15     3     0    12
    ## 2 2 ENSG00000000005    0     0    0     0     0    0     0     0     0     0
    ## 3 3 ENSG00000000419  469   348  494   334   567  616   342   383   363   409
    ## 4 4 ENSG00000000457  196   198  403   202   382  166   240   168   124   244
    ## 5 5 ENSG00000000460   40    45   82    38    70   36    40    26    33    52
    ## 6 6 ENSG00000000938 9567 14297 8058 13908 10128 6291 14438 10547 10985 15057
    ##     G74   G90   G31   G46   G83   G89   G67   G28   G55   G26   G63   G69   G87
    ## 1     5     4    11    19     8     3     8    16    24    10    27    16     3
    ## 2     0     0     0     0     0     0     0     0     0     0     0     0     0
    ## 3   402   317   382   387   443   424   444   632   813   373  1247   375   290
    ## 4   245   137   205   193   313   236   297   270   559   295   455   179   191
    ## 5    73    21    29    29    66    68    68    54   119    60   107    40    60
    ## 6 17799 13046 11323 11466 12620 23353 15412 13253 15210 12301 19379 17768 19190
    ##     G48  G35   G42   G77   G38  G45   G32   G64   G80   G88   G11  G66   G54
    ## 1    16   23     4     5    16    6    14     4     7     3    34   15    15
    ## 2     0    0     0     0     0    0     0     0     0     0     0    0     0
    ## 3   387  443   345   470   555  399   480   557   418   298  1024  386   530
    ## 4   187  165   213   340   356  326   388   261   297   165   633  190   306
    ## 5    28   23    40    71    78   90    84    65    37    33   132   22    65
    ## 6 11581 7793 13080 29079 14459 9630 14931 12419 17088 18538 52130 9577 15986
    ##     G75   G30   G40  G78   G72   G59   G61   G9   G85   G81   G65  G12   G57
    ## 1     1     3    24    8     7    16    27   13     0    18    11    6     1
    ## 2     0     0     0    0     0     0     0    0     0     0     0    0     0
    ## 3   359   450   422  362   417   468   589  631   319   426   473  372   374
    ## 4   265   278   385  290   195   253   309  400   133   253   306  192   271
    ## 5    84    61    69   75    35    82    53   99    24    49    96   54    37
    ## 6 15436 13094 14061 9874 12515 11256 12136 8428 15919 14224 13083 8108 12489
    ##     G76  G44   G43   G34   G49   G50   G27   G68  G86   G62 hgnc_symbol
    ## 1     4   21    18     2    15     0     7     4   12    13      TSPAN6
    ## 2     0    0     0     0     0     0     0     0    0     0        TNMD
    ## 3   390  518   426   389   483   375   525   435  460   514        DPM1
    ## 4   251  327   309   153   317   246   281   329  194   272       SCYL3
    ## 5    38  110    92    26    47    64    58    47   48    53    C1orf112
    ## 6 16111 9555 11428 12809 10459 19620 13108 15107 7133 12090         FGR
    ##                                                                                      description
    ## 1                                              tetraspanin 6 [Source:HGNC Symbol;Acc:HGNC:11858]
    ## 2                                                tenomodulin [Source:HGNC Symbol;Acc:HGNC:17757]
    ## 3 dolichyl-phosphate mannosyltransferase subunit 1, catalytic [Source:HGNC Symbol;Acc:HGNC:3005]
    ## 4                                   SCY1 like pseudokinase 3 [Source:HGNC Symbol;Acc:HGNC:19285]
    ## 5                        chromosome 1 open reading frame 112 [Source:HGNC Symbol;Acc:HGNC:25565]
    ## 6              FGR proto-oncogene, Src family tyrosine kinase [Source:HGNC Symbol;Acc:HGNC:3697]
    ##   chromosome_name strand external_gene_name
    ## 1               X     -1             TSPAN6
    ## 2               X      1               TNMD
    ## 3              20     -1               DPM1
    ## 4               1     -1              SCYL3
    ## 5               1      1           C1orf112
    ## 6               1     -1                FGR

Filter out the count data of the following columns (G25, G26, G27, G30,
G9, G12, G32, G45). Rename the columns.

<table>
<thead>
<tr class="header">
<th>Time point</th>
<th>Normal weight</th>
<th>Overweight</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>week 12</td>
<td>G25</td>
<td>G27</td>
</tr>
<tr class="even">
<td>week 12</td>
<td>G26</td>
<td>G30</td>
</tr>
<tr class="odd">
<td>week 36</td>
<td>G9</td>
<td>G32</td>
</tr>
<tr class="even">
<td>week 36</td>
<td>G12</td>
<td>G45</td>
</tr>
</tbody>
</table>

    ##               Gene Week12_NW Week12_OW Week12_NW2 Week12_OW2 Week36_NW
    ## 1  ENSG00000000003        23        10          7          3        13
    ## 2  ENSG00000000005         0         0          0          0         0
    ## 3  ENSG00000000419       494       373        525        450       631
    ## 4  ENSG00000000457       403       295        281        278       400
    ## 5  ENSG00000000460        82        60         58         61        99
    ## 6  ENSG00000000938      8058     12301      13108      13094      8428
    ## 7  ENSG00000000971         5        19         17         48        33
    ## 8  ENSG00000001036       297       386        524        436       474
    ## 9  ENSG00000001084       490       460        394        309       577
    ## 10 ENSG00000001167       724       629        422        435       653
    ##    Week36_OW Week36_NW2 Week36_OW2
    ## 1          6         14          6
    ## 2          0          0          0
    ## 3        372        480        399
    ## 4        192        388        326
    ## 5         54         84         90
    ## 6       8108      14931       9630
    ## 7         11         31          6
    ## 8        390        558        494
    ## 9        331        650        536
    ## 10       463       1111        860

Normalize the data from counts to counts per million (add up all the
counts per sample and divide each sample by this, then multiply by
1.000.000). log2 transformation of the counts per million to make the
data more symmetric.

    ##               Gene Week12_NW Week12_OW Week12_NW2 Week12_OW2 Week36_NW
    ## 1  ENSG00000000003        23        10          7          3        13
    ## 2  ENSG00000000005         0         0          0          0         0
    ## 3  ENSG00000000419       494       373        525        450       631
    ## 4  ENSG00000000457       403       295        281        278       400
    ## 5  ENSG00000000460        82        60         58         61        99
    ## 6  ENSG00000000938      8058     12301      13108      13094      8428
    ## 7  ENSG00000000971         5        19         17         48        33
    ## 8  ENSG00000001036       297       386        524        436       474
    ## 9  ENSG00000001084       490       460        394        309       577
    ## 10 ENSG00000001167       724       629        422        435       653
    ##    Week36_OW Week36_NW2 Week36_OW2 Week12_NW_CPM Week12_OW_CPM Week12_NW2_CPM
    ## 1          6         14          6     1.2817448     0.5800985      0.3800353
    ## 2          0          0          0     0.0000000     0.0000000      0.0000000
    ## 3        372        480        399    27.5296502    21.6376725     28.5026453
    ## 4        192        388        326    22.4583989    17.1129045     15.2557016
    ## 5         54         84         90     4.5696990     3.4805907      3.1488637
    ## 6       8108      14931       9630   449.0565215   713.5791129    711.6431894
    ## 7         11         31          6     0.2786402     1.1021871      0.9229428
    ## 8        390        558        494    16.5512270    22.3918005     28.4483545
    ## 9        331        650        536    27.3067381    26.6845291     21.3905567
    ## 10       463       1111        860    40.3470987    36.4881930     22.9106977
    ##    Week12_OW2_CPM Week36_NW_CPM Week36_OW_CPM Week36_NW2_CPM Week36_OW2_CPM
    ## 1       0.1758106      0.857013     0.3820446      0.6326233      0.3219167
    ## 2       0.0000000      0.000000     0.0000000      0.0000000      0.0000000
    ## 3      26.3715893     41.598095    23.6867647     21.6899420     21.4074594
    ## 4      16.2917818     26.369632    12.2254269     17.5327031     17.4908065
    ## 5       3.5748154      6.526484     3.4384013      3.7957399      4.8287503
    ## 6     767.3546448    555.608148   516.2695918    674.6927586    516.6762768
    ## 7       2.8129695      2.175495     0.7004151      1.4008088      0.3219167
    ## 8      25.5511398     31.248014    24.8328985     25.2145576     26.5044736
    ## 9      18.1084913     38.038194    21.0761267     29.3717965     28.7578904
    ## 10     25.4925363     43.048424    29.4811077     50.2031783     46.1413913
    ##    Week12_NW_CPM_log2 Week12_OW_CPM_log2 Week12_NW2_CPM_log2
    ## 1           1.1901375          0.6600145           0.4647051
    ## 2           0.0000000          0.0000000           0.0000000
    ## 3           4.8343902          4.5006537           4.8827724
    ## 4           4.5520326          4.1789460           4.0228739
    ## 5           2.4775994          2.1636890           2.0527163
    ## 6           8.8139624          9.4809499           9.4770361
    ## 7           0.3546103          1.0718911           0.9433158
    ## 8           4.1335000          4.5479310           4.8801151
    ## 9           4.8230736          4.7910081           4.4848185
    ## 10          5.3697142          5.2283644           4.5795843
    ##    Week12_OW2_CPM_log2 Week36_NW_CPM_log2 Week36_OW_CPM_log2
    ## 1            0.2336557          0.8929839          0.4668042
    ## 2            0.0000000          0.0000000          0.0000000
    ## 3            4.7746073          5.4127170          4.6256659
    ## 4            4.1120146          4.7745041          3.7252424
    ## 5            2.1937135          2.9119761          2.1500401
    ## 6            9.5856286          9.1205182          9.0147726
    ## 7            1.9309150          1.6669813          0.7658870
    ## 8            4.7307019          5.0111384          4.6911376
    ## 9            4.2561420          5.2868144          4.4644152
    ## 10           4.7275141          5.4610185          4.9298434
    ##    Week36_NW2_CPM_log2 Week36_OW2_CPM_log2
    ## 1             0.707192           0.4026313
    ## 2             0.000000           0.0000000
    ## 3             4.503981           4.4859072
    ## 4             4.212001           4.2087362
    ## 5             2.261753           2.5431866
    ## 6             9.400224           9.0159064
    ## 7             1.263520           0.4026313
    ## 8             4.712296           4.7815944
    ## 9             4.924660           4.8952003
    ## 10            5.678161           5.5589224

Drop any rows with blank names and count values between 0 and 2.

    ## # A tibble: 10 × 25
    ##    Gene            Week12_NW Week12_OW Week12_NW2 Week12_OW2 Week36_NW Week36_OW
    ##    <chr>               <int>     <int>      <int>      <int>     <int>     <int>
    ##  1 ENSG00000000419       494       373        525        450       631       372
    ##  2 ENSG00000000457       403       295        281        278       400       192
    ##  3 ENSG00000000460        82        60         58         61        99        54
    ##  4 ENSG00000000938      8058     12301      13108      13094      8428      8108
    ##  5 ENSG00000001036       297       386        524        436       474       390
    ##  6 ENSG00000001084       490       460        394        309       577       331
    ##  7 ENSG00000001167       724       629        422        435       653       463
    ##  8 ENSG00000001461      1301       588        423        430       536       444
    ##  9 ENSG00000001497      1001       720        913        801       797       755
    ## 10 ENSG00000001561       599       234        201        279       269        99
    ## # ℹ 18 more variables: Week36_NW2 <int>, Week36_OW2 <int>, Week12_NW_CPM <dbl>,
    ## #   Week12_OW_CPM <dbl>, Week12_NW2_CPM <dbl>, Week12_OW2_CPM <dbl>,
    ## #   Week36_NW_CPM <dbl>, Week36_OW_CPM <dbl>, Week36_NW2_CPM <dbl>,
    ## #   Week36_OW2_CPM <dbl>, Week12_NW_CPM_log2 <dbl>, Week12_OW_CPM_log2 <dbl>,
    ## #   Week12_NW2_CPM_log2 <dbl>, Week12_OW2_CPM_log2 <dbl>,
    ## #   Week36_NW_CPM_log2 <dbl>, Week36_OW_CPM_log2 <dbl>,
    ## #   Week36_NW2_CPM_log2 <dbl>, Week36_OW2_CPM_log2 <dbl>

Calculate the z-Value of each count in new columns by subtracting the
normalized count value by the mean of the column and divide by the
columns standard deviation.

    ## # A tibble: 10 × 9
    ##    Gene        Week12_NW_CPM_z Week12_OW_CPM_z Week12_NW2_CPM_z Week12_OW2_CPM_z
    ##    <chr>                 <dbl>           <dbl>            <dbl>            <dbl>
    ##  1 ENSG000000…         -0.196          -0.124            -0.150          -0.134 
    ##  2 ENSG000000…         -0.211          -0.132            -0.180          -0.154 
    ##  3 ENSG000000…         -0.263          -0.155            -0.207          -0.178 
    ##  4 ENSG000000…          1.04            1.05              1.39            1.32  
    ##  5 ENSG000000…         -0.228          -0.123            -0.150          -0.135 
    ##  6 ENSG000000…         -0.197          -0.116            -0.166          -0.150 
    ##  7 ENSG000000…         -0.159          -0.0992           -0.163          -0.136 
    ##  8 ENSG000000…         -0.0648         -0.103            -0.162          -0.136 
    ##  9 ENSG000000…         -0.114          -0.0902           -0.102          -0.0935
    ## 10 ENSG000000…         -0.179          -0.138            -0.190          -0.153 
    ## # ℹ 4 more variables: Week36_NW_CPM_z <dbl>, Week36_OW_CPM_z <dbl>,
    ## #   Week36_NW2_CPM_z <dbl>, Week36_OW2_CPM_z <dbl>

Calculate the variance of the log2 transformed counts by rows and put it
in a new column.

    ## # A tibble: 10 × 10
    ##    Gene       log2_CPM_variance Week12_NW_CPM_z Week12_OW_CPM_z Week12_NW2_CPM_z
    ##    <chr>                  <dbl>           <dbl>           <dbl>            <dbl>
    ##  1 ENSG00000…            0.0961         -0.196          -0.124            -0.150
    ##  2 ENSG00000…            0.102          -0.211          -0.132            -0.180
    ##  3 ENSG00000…            0.0806         -0.263          -0.155            -0.207
    ##  4 ENSG00000…            0.0794          1.04            1.05              1.39 
    ##  5 ENSG00000…            0.0685         -0.228          -0.123            -0.150
    ##  6 ENSG00000…            0.106          -0.197          -0.116            -0.166
    ##  7 ENSG00000…            0.162          -0.159          -0.0992           -0.163
    ##  8 ENSG00000…            0.296          -0.0648         -0.103            -0.162
    ##  9 ENSG00000…            0.0331         -0.114          -0.0902           -0.102
    ## 10 ENSG00000…            0.428          -0.179          -0.138            -0.190
    ## # ℹ 5 more variables: Week12_OW2_CPM_z <dbl>, Week36_NW_CPM_z <dbl>,
    ## #   Week36_OW_CPM_z <dbl>, Week36_NW2_CPM_z <dbl>, Week36_OW2_CPM_z <dbl>

## Data visualization

![](lizzola_Project1_files/figure-markdown_strict/heatmap-1.png)

#### Conclusion

Even though the heatmap is still very simple, it is interesting to see
that some genes have different expressions between the groups, which
also have a temporal component.
