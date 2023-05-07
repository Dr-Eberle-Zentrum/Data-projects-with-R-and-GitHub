# Project description

In the second half of the 20th century, the cultural field in Colombia underwent significant changes. One of the most important changes was the commercialization of art and the emergence of galleries and exhibitions for artists. This shift had a profound impact on the art scene in Colombia, allowing artists to showcase their work and establish themselves within the larger cultural sphere. As galleries and exhibitions proliferated, a new market for art emerged, creating opportunities for artists and collectors alike. This transformation of the cultural landscape represents an important turning point in the history of Colombian art and continues to shape the art world in the country to this day.

The general topic of our task is analyzing the art scene in Bogotá (Colombia) during the second half of the 20th century. We aim to gain insights into the relationships between art galleries, exhibitions, and artists during this time period.

Our data was collected by the [Banco de archivos gitales de Artes en Colombia](https://badac.uniandes.edu.co/) and includes information about art galleries, exhibitions, and artists, as well as relevant dates, locations, and publication information. However, these data are not yet organized, and it is up to us to consolidate them into a single dataset. The data are presented in separate spreadsheets for each decade from 1940 to 2018 (ie. "1940-1949", "1950-1959", and so on...), and our task is to merge and clean these data to create a comprehensive and coherent dataset for analysis. To download the data [clic here](https://badac.uniandes.edu.co/files/datasets/PG_BD_INVITACIONES_SM05-20-2021.xlsx)

## A first look to data

<table style="width:85%;">
<colgroup>
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"><p>Año creacion galeria</p></th>
<th style="text-align: left;"><p>Codigo Galeria</p></th>
<th style="text-align: left;"><p>Codigo</p></th>
<th style="text-align: left;"><p>Nombre / Galeria / Espacio</p></th>
<th style="text-align: left;"><p>Titulo de la exposicion/fuente/recorte</p></th>
<th style="text-align: left;"><p>Dia de fecha de publicacion dd</p></th>
<th style="text-align: left;"><p>Mes de fecha de publicacion mm</p></th>
<th style="text-align: left;"><p>Año de fecha de publicacion aaaa</p></th>
<th style="text-align: left;"><p>Fecha de publicacion dd/mm/aaaa</p></th>
<th style="text-align: left;"><p>Dia de fecha de inauguracion dd</p></th>
<th style="text-align: left;"><p>Mes de fecha de inauguracion mm</p></th>
<th style="text-align: left;"><p>Año de fecha de inauguracion aaaa</p></th>
<th style="text-align: left;"><p>Fecha de inauguracion dd/mm/aaaa</p></th>
<th style="text-align: left;"><p>Dia de fecha de cierre dd</p></th>
<th style="text-align: left;"><p>Mes de fecha de cierre mm</p></th>
<th style="text-align: left;"><p>Año de fecha de cierre aaaa</p></th>
<th style="text-align: left;"><p>Fecha de cierre dd/mm/aaaa</p></th>
<th style="text-align: left;"><p>Direccion</p></th>
<th style="text-align: left;"><p>Tipo de soporte</p></th>
<th style="text-align: left;"><p>Editor Nombre del periodico </p></th>
<th style="text-align: left;"><p>Fuente de donde viene el archivo</p></th>
<th style="text-align: left;"><p>Escritor de articulo de prensa / Autor texto de exposicion</p></th>
<th style="text-align: left;"><p>Descripcion / Temas / info. De contexto / Ejes</p></th>
<th style="text-align: left;"><p>Galerista si se sabe</p></th>
<th style="text-align: left;"><p>Curaduria Si la tiene </p></th>
<th style="text-align: left;"><p>Artistas</p></th>
<th style="text-align: left;"><p>procesado por</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>1940</p></td>
<td style="text-align: left;"><p>Galeria_de_Arte</p></td>
<td style="text-align: left;"><p>PG_GaleriadeArte_001</p></td>
<td style="text-align: left;"><p>Galería de Arte</p></td>
<td style="text-align: left;"><p>Venta permanente de cuadros, esculturas y objetos de arte</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i./s.i./s.i.</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i./s.i./s.i.</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i./s.i/s.i.</p></td>
<td style="text-align: left;"><p>Carrera 7 A # 23-85</p></td>
<td style="text-align: left;"><p>Aviso publicitario</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>No identificada</p></td>
<td style="text-align: left;"><p>Galería de Arte</p></td>
<td style="text-align: left;"><p>Aviso publicitario de la Galería de Arte</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>Camila Botero</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>1940</p></td>
<td style="text-align: left;"><p>Galeria_de_Arte</p></td>
<td style="text-align: left;"><p>PG_GaleriadeArte_002</p></td>
<td style="text-align: left;"><p>Galería de Arte</p></td>
<td style="text-align: left;"><p>Primera exposición colectiva de artistas colombianos</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>5</p></td>
<td style="text-align: left;"><p>1940</p></td>
<td style="text-align: left;"><p>s.i./5/1940</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>s.i./s.i/s.i.</p></td>
<td style="text-align: left;"><p>Carrera 7 A # 23-85</p></td>
<td style="text-align: left;"><p>Invitación</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>No identificada</p></td>
<td style="text-align: left;"><p>Galería de Arte</p></td>
<td style="text-align: left;"><p>Portada catálogo primera exposición colectiva de artistas colombianos</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>Camila Botero</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>1940</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>Galería del Consejo Británico</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>NA</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>1942</p></td>
<td style="text-align: left;"><p>Centro_Colombo_Americano</p></td>
<td style="text-align: left;"><p>PG_CentroColomboAmericano_Arkhe_001</p></td>
<td style="text-align: left;"><p>Centro Colombo Americano</p></td>
<td style="text-align: left;"><p>Exhibicion Four Totems</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>4</p></td>
<td style="text-align: left;"><p>8</p></td>
<td style="text-align: left;"><p>1980</p></td>
<td style="text-align: left;"><p>4/8/1980</p></td>
<td style="text-align: left;"><p>14</p></td>
<td style="text-align: left;"><p>8</p></td>
<td style="text-align: left;"><p>1980</p></td>
<td style="text-align: left;"><p>14/8/1980</p></td>
<td style="text-align: left;"><p>Avenida 19 # 3-05</p></td>
<td style="text-align: left;"><p>Invitación</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>Archivo Arkhé</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>Exposición de Antonio María Benitez</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>Antonio María Benitez</p></td>
<td style="text-align: left;"><p>Camila Botero</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>1942</p></td>
<td style="text-align: left;"><p>Centro_Colombo_Americano</p></td>
<td style="text-align: left;"><p>PG_CentroColomboAmericano_AS_001</p></td>
<td style="text-align: left;"><p>Centro Colombo Americano</p></td>
<td style="text-align: left;"><p>El lugar de las cosas que nunca aprendí</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>26</p></td>
<td style="text-align: left;"><p>2</p></td>
<td style="text-align: left;"><p>2009</p></td>
<td style="text-align: left;"><p>26/2/2009</p></td>
<td style="text-align: left;"><p>19</p></td>
<td style="text-align: left;"><p>3</p></td>
<td style="text-align: left;"><p>2009</p></td>
<td style="text-align: left;"><p>19/3/2009</p></td>
<td style="text-align: left;"><p>Avenida 19 # 3-05</p></td>
<td style="text-align: left;"><p>Invitación</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>Archivo Alejandro Sánchez</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>Exposición de Lorena Espitia dentro del ciclo relevos conformado por los artístas Diego Taborda, Pilar Copete, José García, Giovanni Sánchez, Nicolás Cardenas.</p></td>
<td style="text-align: left;"><p>N/A</p></td>
<td style="text-align: left;"><p>s.i.</p></td>
<td style="text-align: left;"><p>Lorena Espitia</p></td>
<td style="text-align: left;"><p>Camila Botero</p></td>
</tr>
</tbody>
</table>

As you notice, names of variables are in Spanish, if you need some help, don't hesitate to tell me. [Deepl.com](https://www.deepl.com/) is also a good option to translate (if it is necessary).

## Visualization goals

Our visualization goals include exploring the relationships between art galleries, exhibitions, and artists. In addition to visualizing these relationships, we may also utilize other types of graphs or charts to gain insights into different aspects of the data with a focus on identifying patterns and trends over time.

One of our references is the following:

![Making the University of Miami School of Architecture, Gilda Santana & Alissa Fowers (2019)](https://dataanddragons.files.wordpress.com/2019/05/archgenealogy-proof.png?w=783&h=1024)

In brief, our visualization roadmap includes:

-   Cleaning and organizing the dataset.

-   Creating a diagram to visualize the relationships between art galleries, exhibitions, and artists, with colors and labels.

-   Using other types of graphs or charts as needed to explore different aspects of the data (i.e. timeline duration of exhibition).

Looking forward to see your contributions.

Best regards,

Danilo P.
