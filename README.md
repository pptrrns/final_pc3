# Política Comparada III

**José Ángel Torrens Hernández** (175021)

ITAM, Ciencia política

## Argumento y enfoque

Para que las estrategias de desarrollo, crecimiento y redistribución conduzcan a un crecimiento equitativo y a la reducción de la pobreza, los Estados deben tener  capacidades institucionales y estructurales (UNRISD, 2010). Dichas capacidades se enmarcan en la habilidad para utilizar el potencial extractivo del Estado para movilizar recursos que permitan formular y desplegar políticas públicas, distribuir bienes y servicios, y mantener el control  del territorio (Himanshu, 2021; Soifer, 2010). 

Como señalan Fernanda Somuano y Fernando Nieto en *[Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf)*, "aunque la capacidad estatal se ha estudiado en gran medida a nivel nacional, también puede observarse a nivel subnacional. (…) Por lo que,  capacidades estatales subnacionales más robustas o más débiles pueden tener también consecuencias políticas y sociales relevantes a nivel local".

El estudio propuesto busca analizar las capacidades estatales a nivel subnacional tomando  como unidad de análisis territorial a los municipios y alcaldías. Así pues, el trabajo esta encaminado a comprobar o refutar la siguiente relación:

* robustas capacidades estatales a nivel subnacional y municipal implican menores niveles de pobreza, marginación y carencias sociales.

Es decir, ahí dónde observemos mejores indicadores sobre la capacidad estatal, observaremos también menores niveles de carencias sociales, y viceversa. 

## Variables propuestas

### Variables de capacidad estatal
Para la medición de la capacidad estatal a nivel subnacional propongo tomar como variables:

* ``personal.mu`` : Personal en las instituciones de las administraciones públicas municipales, por municipio o demarcación territorial.
* ``solicitudes.mu`` : Solicitudes de acceso a la información pública y protección de datos personales atendidas por las instituciones de las administraciones públicas municipales, por municipio o demarcación territorial.
* ``di.urb`` : Distancia en km's al polígono urbano más próximo.
* ``p15ymas.an`` : Proporción de la población de 15 a 130 años de edad que no saben leer y escribir un recado.
* ``p15ymas.se`` : Proporción de la población de 15 a 130 años de edad que no aprobaron ningún grado escolar o que sólo tienen nivel preescolar.
* ``ocupada.ss``: Proporción de la población afiliada a servicios médicos en alguna institución de salud pública o privada (IMSS; ISSSTE e ISSSTE estatal; PEMEX; SEDENA; SEMAR; INSABI u otra) y que tenían trabajo en la semana de referencia.

* Todas la variables están ponderadas a nivel municipal.

*Notas*: Las variables ``personal.mu``, ``solicitudes.mu`` y ``di.urb`` recogen la capacidad del Estado en la provisión de servicios administrativos y de infraestructura, mientras que ``p15ymas.an``, ``p15ymas.se`` y ``ocupada.ss`` la capacidad extractiva.

En la selección de las variables de capacidad estal pretendo aproximar una medida que evite tomar como causa aquello  que busco explicar, ya que eso presupone una relación directa entre los productos y los *outcomes* (Soifer, 2010). Por tanto, no considero  variables relacionadas con el nivel de bienestar; sin embargo, es posible que con las variables de extracción este objetivo no se cumpla completamente.

### Variables de pobreza, carencias sociales y niveles de bienestar
Para la medición de los niveles de pobreza, bienestar y carencias sociales propongo tomar como variables:

* ``mean.rwi`` : Índice de riqueza relativa de Facebook.
    - El Índice permite predecir el nivel de vida relativo de cada país en función de datos de conectividad, imágenes satelitales y otras fuentes de datos novedosas (Facebook, 2021).
* ``pobreza.mu`` : Proporción de la población en situación de pobreza a nivel municipal.
* ``carencias.mu`` : Proporción de la población vulnerable por carencias sociales a nivel municipal.

* Todas la variables están ponderadas a nivel municipal.

## Análisis de las variables propuestas
Un primer análisis de las variables por medio de una amtriz de correlación muestra que, contrario a lo que se esperaba, las variables ``personal.mu``, ``solicitudes.mu``, ``di.urb`` y ``ocupada.ss`` no se ecuentran relacionadas con los niveles de bienestar, pobreza y carencias sociales.

## Código
Las gráficas y mapas fueron elaboradas en RStudio. 
Se puede descargar el código dándo click [aquí](https://github.com/pptrrns/final_pc3/blob/main/final_pc3.R)

## Mapas dinámicos
Elabore en Carto.DB tres mapas dinámicos (*choropleth map*) en los que mapeo las variables ``mean.rwi``, ``pobreza.mu`` y ``carencias.mu``. En ellos se ve a nivel geográfico la relación entre dichas variables. Se pueden consultar dando click [aquí](https://torrens.carto.com/builder/bd969ec4-292a-426f-99ff-22c2379f0f79/embed)

## Bibliografía

Jha, Himanshu. 2021. Developing State Capacity in a Weak State, en *[Building State Capability: Blog](https://buildingstatecapability.com/2021/08/22/developing-state-capacity-in-a-weak-state/)*, Harvard’s Center for International Development.

Soifer, David Hillel. 2010. Measuring state capacity in contemporary Latin America, en *Revista de Ciencia Política*, vol. 32, no. 3, 585–598. [doi.org/10.4067/S0718-090X2012000300004](http://dx.doi.org/10.4067/S0718-090X2012000300004 )

Somuano Fernanda, Fernando Nieto. s.a. [Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf).

UNRISD. "Building State Capacity for Poverty Reduction", en *[Combating Poverty and Inequality: Structural Change, Social Policy and Politics](https://www.unrisd.org/80256B3C005BCCF9/(httpPublications)/BBA20D83E347DBAFC125778200440AA7?OpenDocument&panel=additional)*, coord. UNRISD. Génova: UNRISD, 2010.

## Bases de datos
* ``censo2020-mu.csv``: Censo de Población y Vivienda 2020. Datos procesados por: @emagar.
* ``phy-mu.csv``: Censo de Población y Vivienda 2020. Datos procesados por: @emagar.
* ``gobmu-2019.csv``: Censo Nacional de Gobiernos Municipales y Demarcaciones Territoriales de la Ciudad de México. Indicadores de interés 2019. INEGI.
* ``pobreza.mu-2010.csv``: Indicadores de Pobreza a nivel municipio 2010. CONEVAL.
* ``dat.csv``: Base de datos consolidada con las variables de inetrés. Datos procesados por: jtorrensh.
* ``dat.pc3.csv``: Base de datos consolidada con las variables de inetrés. Datos procesados por: jtorrensh.

* Las bases de datos se encuentran el repositorio [final_pc3](https://github.com/pptrrns/final_pc3)
