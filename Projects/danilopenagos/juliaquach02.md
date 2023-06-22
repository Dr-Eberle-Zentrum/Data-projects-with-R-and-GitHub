------------------------------------------------------------------------

# Motivation

------------------------------------------------------------------------

In this project, we would like to get an insight into the art scene in
Colombia in the second half of the 20th century. For this, we observe
and visualise the transformation of the art scene of Bogotá. In
particular, we take a closer look at the relations between the artists
and galleries at that time as well as the art critics and their media
outlets.

------------------------------------------------------------------------

# Aim

------------------------------------------------------------------------

To visualise the relations between artists, exposition and gallery, we
opt for a Sankey diagram.

------------------------------------------------------------------------

# Data Wrangling

------------------------------------------------------------------------

The available data set is an xlsx.-file with eight sheets, each sheet
representing one decade between 1940 and 2018. Each row represents one
gallery and for the galleries, the columns represent information about
the name of the gallery, the title, the inauguration data, the artists
and many more. In this project, we will focus on the variables “Nombre,
Galeria, Espacio”, “Artistas”, and “Año de fecha de inauguracion”, i.e.,
galleries, artists and years. If information about the gallery, artist
or year is not available, we drop the whole row representing that
gallery.

<table class="table table-bordered table-striped" style="margin-left: auto; margin-right: auto;">
<caption>
Table 1: First five rows of our data set after reduction of our initial
data set.
</caption>
<thead>
<tr>
<th style="text-align:left;">
Galleries
</th>
<th style="text-align:left;">
Artists
</th>
<th style="text-align:right;">
Year
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Centro Colombo Americano
</td>
<td style="text-align:left;">
Antonio MarA-a Benitez
</td>
<td style="text-align:right;">
1980
</td>
</tr>
<tr>
<td style="text-align:left;">
Centro Colombo Americano
</td>
<td style="text-align:left;">
Lorena Espitia
</td>
<td style="text-align:right;">
2009
</td>
</tr>
<tr>
<td style="text-align:left;">
Centro Colombo Americano
</td>
<td style="text-align:left;">
Alejandro CastaA?o
</td>
<td style="text-align:right;">
2007
</td>
</tr>
<tr>
<td style="text-align:left;">
Centro Colombo Americano
</td>
<td style="text-align:left;">
Mauricio MA”ller
</td>
<td style="text-align:right;">
1995
</td>
</tr>
<tr>
<td style="text-align:left;">
Centro Colombo Americano
</td>
<td style="text-align:left;">
Barbara Nessim
</td>
<td style="text-align:right;">
1995
</td>
</tr>
</tbody>
</table>

We classify the galleries by their decade and group the data set by the
artists and galleries. This allows to count how many times a gallery
invited an artist.

<table class="table table-bordered table-striped" style="margin-left: auto; margin-right: auto;">
<caption>
Table 2: First five rows of our data set after computing the decade and
counting of invitations
</caption>
<thead>
<tr>
<th style="text-align:left;">
Galleries
</th>
<th style="text-align:left;">
Artists
</th>
<th style="text-align:right;">
Decade
</th>
<th style="text-align:right;">
Number of Invitations
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Angel Rodriguez.
</td>
<td style="text-align:left;">
Aexandes / GalerA-a Espacio Alterno
</td>
<td style="text-align:right;">
2000
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
Arnulfo Luna
</td>
<td style="text-align:left;">
GalerA-a Alfred Wild
</td>
<td style="text-align:right;">
1980
</td>
<td style="text-align:right;">
4
</td>
</tr>
<tr>
<td style="text-align:left;">
Jhon de Rhodes
</td>
<td style="text-align:left;">
GalerA-a Belarca
</td>
<td style="text-align:right;">
1990
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
Josh Blackwell
</td>
<td style="text-align:left;">
GalerA-a Casas Riegner
</td>
<td style="text-align:right;">
2010
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
Juan MejA-a
</td>
<td style="text-align:left;">
SN MaCarena
</td>
<td style="text-align:right;">
2010
</td>
<td style="text-align:right;">
1
</td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

# Visualisation

------------------------------------------------------------------------

To avoid a cluttered visualisation, we either choose a minimum number of
invitations for the artists to be included in the Sankey diagram or a
certain decade which we want to visualise.

------------------------------------------------------------------------

# Findings

------------------------------------------------------------------------
