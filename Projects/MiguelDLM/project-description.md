# Force distribution with Finite Element Analysis

Finite Element Analysis (FEA) is a computational technique used to
predict stress, strain, and deformation in structures. This method
involves breaking down a structure into discrete elements, making
complex problems more manageable through mathematical analysis
(Rayfield, 2007). The advent of a novel software,
[Fossils](https://gitlab.uliege.be/rboman/fossils), has significantly
streamlined the process of conducting FEA on 3D virtual models of
fossils, offering a quicker and more efficient approach than previously
possible (Chatar et al., 2023).

<figure>
<img src="./bilder/mesh.png" alt="Finite Elements Analysis example" />
<figcaption aria-hidden="true">Finite Elements Analysis
example</figcaption>
</figure>

Unfortunately, the output files provided by Fossils are in the `.msh`
format, which may pose challenges when importing them into other
systems. To address this issue, a Python script was written to convert
the `.msh` files into `.csv` files. The structure of the `.csv` files is
as follows:

<table>
<thead>
<tr class="header">
<th>Vertex ID</th>
<th>Von Misses Stress</th>
<th>X</th>
<th>Y</th>
<th>Z</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td>123</td>
<td>123.123</td>
<td>123.123</td>
<td>123.123</td>
</tr>
<tr class="even">
<td>2</td>
<td>123</td>
<td>123.123</td>
<td>123.123</td>
<td>123.123</td>
</tr>
<tr class="odd">
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
</tr>
</tbody>
</table>

The `Von Misses Stress` represents the stress on each point in the 3D
space. The X, Y and Z columns represents the coordinates of each point.

## Objectives

The goal is to create visualizations and conduct statistical analyses
that elucidate the distribution of stress across various elements within
the 3D space, as determined by Finite Element Analysis (FEA). This will
facilitate a deeper understanding of how stress is distributed and the
implications for the structural integrity of the analyzed models. This
will enable an understanding of how variations in shape and size affect
force distribution across different 3D models.

## Materials and methods

The analysis consists of four `.csv` files containing the results from
four Finite Element Analyses (FEA) of the jaws of four carnivorous
animals. According to Marcé-Nogué et al. (2011), Finite Elements results
may present singularities at the contact and constraint points, for this
reason many researchers choose to remove the 1 or 2% higher stress
values of the dataset.

The `ggplot2` library will be used to plot the force distribution in
each axe (X, Y and Z). Each 3D model will be represented by a different
line.

Furthermore, each dataset will be segmented into distinct samples based
on their proportion of the total size. This involves determining the
minimum and maximum values for each coordinate, followed by dividing
this length into 10 equal sub-samples. Consequently, each sub-sample
will account for 10% of the total length of the 3D model along that
axis. The average stress within each section will be calculated,
culminating in a comprehensive plot that contrasts the average stress
across each section and axis among the 3D models.

## Bibliography

Chatar, N., Boman, R., Fallon Gaudichon, V., MacLaren, J. A., and
Fischer, V. (2023). <span class="nocase">‘Fossils’: A new, fast and
open-source protocol to simulate muscle-driven biomechanical loading of
bone</span>. *Methods in Ecology and Evolution*, *14*(3), 848–859.
<https://doi.org/10.1111/2041-210X.14051>

Marcé-Nogué, J., Fortuny, J., Gil, L., and Galobart, A. (2011).
<span class="nocase">Using reverse engineering to reconstruct tetrapod
skulls and analyse its feeding behaviour</span>. *Proceedings of the
13th International Conference on Civil, Structural and Environmental
Engineering Computing*, *January*. <https://doi.org/10.4203/ccp.96.237>

Rayfield, E. J. (2007). <span class="nocase">Finite element analysis and
understanding the biomechanics and evolution of living and fossil
organisms</span>. *Annual Review of Earth and Planetary Sciences*, *35*,
541–576. <https://doi.org/10.1146/annurev.earth.35.031306.140104>
