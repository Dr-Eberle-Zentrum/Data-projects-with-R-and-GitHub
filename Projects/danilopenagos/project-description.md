# Project description

In the second half of the 20th century, the cultural field in Colombia
underwent significant changes. One of the most important changes was the
commercialization of art and the emergence of galleries and exhibitions
for artists. This shift had a profound impact on the art scene in
Colombia, allowing artists to showcase their work and establish
themselves within the larger cultural sphere. As galleries and
exhibitions proliferated, a new market for art emerged, creating
opportunities for artists and collectors alike. This transformation of
the cultural landscape represents an important turning point in the
history of Colombian art and continues to shape the art world in the
country to this day.

The general topic of our task is analyzing the art scene in Bogotá
(Colombia) during the second half of the 20th century. We aim to gain
insights into the relationships between art galleries, exhibitions, and
artists during this time period.

Our data was collected by the [Banco de archivos gitales de Artes en
Colombia](https://badac.uniandes.edu.co/) and includes information about
art galleries, exhibitions, and artists, as well as relevant dates,
locations, and publication information. However, these data are not yet
organized, and it is up to us to consolidate them into a single dataset.
The data are presented in separate spreadsheets for each decade from
1940 to 2018 (ie. “1940-1949”, “1950-1959”, and so on…), and our task is
to merge and clean these data to create a comprehensive and coherent
dataset for analysis. To download the data [clic
here](https://badac.uniandes.edu.co/files/datasets/PG_BD_INVITACIONES_SM05-20-2021.xlsx)

## A first look to data

<table style="width:100%;">
<colgroup>
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 5%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 1%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 6%" />
<col style="width: 16%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 1%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Año creacion galeria</th>
<th style="text-align: left;">Codigo Galeria</th>
<th style="text-align: left;">Codigo</th>
<th style="text-align: left;">Nombre / Galeria / Espacio</th>
<th style="text-align: left;">Titulo de la
exposicion/fuente/recorte</th>
<th style="text-align: left;">Dia de fecha de publicacion (dd)</th>
<th style="text-align: left;">Mes de fecha de publicacion (mm)</th>
<th style="text-align: left;">Año de fecha de publicacion (aaaa)</th>
<th style="text-align: left;">Fecha de publicacion (dd/mm/aaaa)</th>
<th style="text-align: left;">Dia de fecha de inauguracion (dd)</th>
<th style="text-align: left;">Mes de fecha de inauguracion (mm)</th>
<th style="text-align: left;">Año de fecha de inauguracion (aaaa)</th>
<th style="text-align: left;">Fecha de inauguracion (dd/mm/aaaa)</th>
<th style="text-align: left;">Dia de fecha de cierre (dd)</th>
<th style="text-align: left;">Mes de fecha de cierre (mm)</th>
<th style="text-align: left;">Año de fecha de cierre (aaaa)</th>
<th style="text-align: left;">Fecha de cierre (dd/mm/aaaa)</th>
<th style="text-align: left;">Direccion</th>
<th style="text-align: left;">Tipo de soporte</th>
<th style="text-align: left;">Editor (Nombre del periodico )</th>
<th style="text-align: left;">Fuente (de donde viene el archivo)</th>
<th style="text-align: left;">Escritor de articulo de prensa / Autor
texto de exposicion</th>
<th style="text-align: left;">Descripcion / Temas / info. De contexto /
Ejes</th>
<th style="text-align: left;">Galerista (si se sabe)</th>
<th style="text-align: left;">Curaduria (Si la tiene )</th>
<th style="text-align: left;">Artistas</th>
<th style="text-align: left;">procesado por</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">1940</td>
<td style="text-align: left;">Galeria_de_Arte</td>
<td style="text-align: left;">PG_GaleriadeArte_001</td>
<td style="text-align: left;">Galería de Arte</td>
<td style="text-align: left;">Venta permanente de cuadros, esculturas y
objetos de arte</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i./s.i./s.i.</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i./s.i./s.i.</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i./s.i/s.i.</td>
<td style="text-align: left;">Carrera 7 A # 23-85</td>
<td style="text-align: left;">Aviso publicitario</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">No identificada</td>
<td style="text-align: left;">Galería de Arte</td>
<td style="text-align: left;">Aviso publicitario de la Galería de
Arte</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">Camila Botero</td>
</tr>
<tr class="even">
<td style="text-align: left;">1940</td>
<td style="text-align: left;">Galeria_de_Arte</td>
<td style="text-align: left;">PG_GaleriadeArte_002</td>
<td style="text-align: left;">Galería de Arte</td>
<td style="text-align: left;">Primera exposición colectiva de artistas
colombianos</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">1940</td>
<td style="text-align: left;">s.i./5/1940</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">s.i./s.i/s.i.</td>
<td style="text-align: left;">Carrera 7 A # 23-85</td>
<td style="text-align: left;">Invitación</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">No identificada</td>
<td style="text-align: left;">Galería de Arte</td>
<td style="text-align: left;">Portada catálogo primera exposición
colectiva de artistas colombianos</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">Camila Botero</td>
</tr>
<tr class="odd">
<td style="text-align: left;">1940</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">Galería del Consejo Británico</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">1942</td>
<td style="text-align: left;">Centro_Colombo_Americano</td>
<td style="text-align: left;">PG_CentroColomboAmericano_Arkhe_001</td>
<td style="text-align: left;">Centro Colombo Americano</td>
<td style="text-align: left;">Exhibicion Four Totems</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">4</td>
<td style="text-align: left;">8</td>
<td style="text-align: left;">1980</td>
<td style="text-align: left;">4/8/1980</td>
<td style="text-align: left;">14</td>
<td style="text-align: left;">8</td>
<td style="text-align: left;">1980</td>
<td style="text-align: left;">14/8/1980</td>
<td style="text-align: left;">Avenida 19 # 3-05</td>
<td style="text-align: left;">Invitación</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">Archivo Arkhé</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">Exposición de Antonio María Benitez</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">Antonio María Benitez</td>
<td style="text-align: left;">Camila Botero</td>
</tr>
<tr class="odd">
<td style="text-align: left;">1942</td>
<td style="text-align: left;">Centro_Colombo_Americano</td>
<td style="text-align: left;">PG_CentroColomboAmericano_AS_001</td>
<td style="text-align: left;">Centro Colombo Americano</td>
<td style="text-align: left;">El lugar de las cosas que nunca
aprendí</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">26</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">2009</td>
<td style="text-align: left;">26/2/2009</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">3</td>
<td style="text-align: left;">2009</td>
<td style="text-align: left;">19/3/2009</td>
<td style="text-align: left;">Avenida 19 # 3-05</td>
<td style="text-align: left;">Invitación</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">Archivo Alejandro Sánchez</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">Exposición de Lorena Espitia dentro del
ciclo relevos conformado por los artístas Diego Taborda, Pilar Copete,
José García, Giovanni Sánchez, Nicolás Cardenas.</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">s.i.</td>
<td style="text-align: left;">Lorena Espitia</td>
<td style="text-align: left;">Camila Botero</td>
</tr>
</tbody>
</table>

As you notice, names of variables are in Spanish, if you need some help,
don’t hesitate to touch me. [Deepl.com](https://www.deepl.com/) is also
a good option to translate (if it is necessary).

## Visualization goals

Our visualization goals include exploring the relationships between art
galleries, exhibitions, and artists. In addition to visualizing these
relationships, we may also utilize other types of graphs or charts to
gain insights into different aspects of the data with a focus on
identifying patterns and trends over time.

One of our references is the following:

![Making the University of Miami School of Architecture, Gilda Santana &
Alissa Fowers
(2019)](https://dataanddragons.files.wordpress.com/2019/05/archgenealogy-proof.png?w=783&h=1024)

In brief, our visualization roadmap includes: -Cleaning and organizing
the dataset -Creating a diagram to visualize the relationships between
art galleries, exhibitions, and artists, with colors and labels. -Using
other types of graphs or charts as needed to explore different aspects
of the data (i.e. timeline duration of exhibition).

Looking forward to see your contributions.

Best regards,

Danilo P.
