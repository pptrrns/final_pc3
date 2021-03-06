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

Las bases de datos se encuentran el repositorio [final_pc3](https://github.com/pptrrns/final_pc3)

### Variables de capacidad estatal

Para la medición de la capacidad estatal a nivel subnacional propongo tomar como variables:

* ``personal.mu`` : Personal en las instituciones de las administraciones públicas municipales, por municipio o demarcación territorial.
* ``solicitudes.mu`` : Solicitudes de acceso a la información pública y protección de datos personales atendidas por las instituciones de las administraciones públicas municipales, por municipio o demarcación territorial.
* ``di.urb`` : Distancia en km's al polígono urbano más próximo.
* ``p15ymas.an`` : Proporción de la población de 15 a 130 años de edad que no saben leer y escribir un recado.
* ``p15ymas.se`` : Proporción de la población de 15 a 130 años de edad que no aprobaron ningún grado escolar o que sólo tienen nivel preescolar.
* ``ocupada.ss``: Proporción de la población afiliada a servicios médicos en alguna institución de salud pública o privada (IMSS; ISSSTE e ISSSTE estatal; PEMEX; SEDENA; SEMAR; INSABI u otra) y que tenían trabajo en la semana de referencia.
  * Todas las variables están ponderadas a nivel municipal.


*Notas*: Las variables ``personal.mu``, ``solicitudes.mu`` y ``di.urb`` recogen la capacidad del Estado en la provisión de servicios administrativos y de infraestructura, mientras que ``p15ymas.an``, ``p15ymas.se`` y ``ocupada.ss`` la capacidad extractiva.

En la selección de las variables de capacidad estatal pretendo aproximar una medida que evite tomar como causa aquello  que busco explicar, ya que eso presupone una relación directa entre los productos y los *outcomes* (Soifer, 2010). Por tanto, no considero  variables relacionadas con el nivel de bienestar; sin embargo, es posible que con las variables de extracción este objetivo no se cumpla completamente.

### Variables de pobreza, carencias sociales y niveles de bienestar
Para la medición de los niveles de pobreza, bienestar y carencias sociales propongo tomar como variables:

* ``mean.rwi`` : Índice de riqueza relativa de Facebook.
    - El Índice permite predecir el nivel de vida relativo de cada país en función de datos de conectividad, imágenes satelitales y otras fuentes de datos novedosas (Facebook, 2021).
* ``pobreza.mu`` : Proporción de la población en situación de pobreza a nivel municipal.
* ``carencias.mu`` : Proporción de la población vulnerable por carencias sociales a nivel municipal.
    * Todas las variables están ponderadas a nivel municipal.


## Análisis de las variables propuestas
Un primer análisis de las variables por medio de una matriz de correlación muestra que, contrario a lo que se esperaba, las variables que tomé para aproximarme a la capacidad estatal en la dimensión de servicios administrativos y de infraestructura (``personal.mu``, ``solicitudes.mu``, ``di.urb`` y ``ocupada.ss``) no están relacionadas con los niveles de bienestar, pobreza y carencias sociales; mientras que las variables de capacidad estatal en la dimensión extractiva sí lo están.

| Matriz de correlación                                        | Matriz de correlación con coeficientes                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-01.png?raw=true) | ![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-02.png?raw=true) |

Así pues, vemos como las variables ``p15ymas.se`` y ``p15ymas.na`` están mejor ligadas a las variables de niveles de bienestar, pobreza y carencias sociales, como lo muestran las siguientes gráficas:

| Relación entre ``p15ymas.se`` y ``mean.rwi``                 | Relación entre ``p15ymas.se`` y ``pobreza.mu``               |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-03.png?raw=true) | ![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-04.png?raw=true) |

El coeficiente de correlación entre ``p15ymas.se`` y la variable ``mean.rwi`` es de -0.5156489, lo que nos indica que mientras mayor es el Índice de Riqueza Relativa menor es la proporción de personas que no aprobaron ningún grado escolar. 

```R
> cor.test(p15ymas.se, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación

	Pearson's product-moment correlation

data:  p15ymas.se and mean.rwi
t = -29.783, df = 2449, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.5441326 -0.4859779
sample estimates:
       cor 
-0.5156489 
```

Mientras que el coeficiente con la variable ``pobreza.mu`` captura la misma relación, pero en sentido inverso: a mayor pobreza municipal, mayor es el número de personas que no aprobaron ningún grado escolar, con una correlación de 0.6395396.

````R
> cor.test(pobreza.mu, p15ymas.se, method = "pearson", use = "complete.obs") # Test de Correlación

	Pearson's product-moment correlation

data:  pobreza.mu and p15ymas.se
t = 41.211, df = 2454, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.6155580 0.6623379
sample estimates:
      cor 
0.6395396 
````

Lo mismo sucede con la variable ``p15ymas.an``, que también se encuentra estrechamente ligada a las variables ``mean.rwi`` y ``pobreza.mu``. La primera gráfica arroja una correlación de -0.5379949, y la segunda de 0.7123322. 

| Relación entre ``p15ymas.an`` y ``mean.rwi``                 | Relación entre ``p15ymas.an`` y ``pobreza.mu``               |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-05.png?raw=true) | ![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-06.png?raw=true) |

Si bien, no fue posible establecer relación entre las variables de capacidad estatal en la dimensión de servicios administrativos con las variables de bienestar y pobreza, fue posible establecer una clara relación entre la variable ``mean.rwi`` y los indicadores del CONEVAL sobre pobreza municipal. Esta relación entre ``mean.rwi`` ``pobreza.mu`` se hace más evidente al graficar ambas variables, lo cual arroja un coeficiente de correlación de -0.5966743. 

````R
> cor.test(pobreza.mu, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación

	Pearson's product-moment correlation

data:  pobreza.mu and mean.rwi
t = -36.743, df = 2442, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.6216176 -0.5705222
sample estimates:
       cor 
-0.5966743 
````

Esta correlación es alentadora para las variables que, como el Índice de Riqueza Relativo, se construyen con otras fuentes de datos novedosas. Pareciera que indicadores con data no tradicional reflejan también lo que capturan las variables más tradicionales (e.g.: CONEVAL). Por lo que es posible considerar que para futuras mediciones de pobreza se puedan incorporar indicadores de luminosidad, conectividad, etc., que reflejan actividad económica a la vez que acceso a bienes y servicios necesarios para tener un mejor nivel de vida.

En este mismo sentido, podrían utilizarse a futuro fuentes de datos novedosas para aproximarse a la capacidad estatal, y así dejar de lado aquellos de corte más burocráticos, como el número total de funcionarios o las solicitudes procesadas por cada dependencia.

En todo caso, la siguiente gráfica representa la correlación entre la variable  ``mean.rwi`` y ``opbreza.mu``.

![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3_rplot-11.png?raw=true)

## Conclusiones

Al inicio del trabajo propuse como línea de investigación que las capacidades estatales a nivel subnacional tomando (municipios y alcaldías) implican menores niveles de pobreza, marginación y carencias sociales; asimismo, propuse como medición de la capacidad estatal variables relacionadas con la administración pública municipal, como el número de funcionarios públicos y las solicitudes atendidas en cada dependencia. Sin embargo, la matriz de correlación no arroja ninguna relación entre tales variables y los niveles de pobreza, por lo que es posible descartarlas como variables explicativas.

En todo caso, las variables de capacidad estatal que son de corte extractivo muestran mejores relaciones con las variables de pobreza y bienestar. Empero, cabe reconocer que tales variables pueden tomar como causa lo que en realidad es el efecto. Es decir, que al comparar ``p15ymas.an`` y ``p15ymas.se`` con ``pobreza.mu`` y `mean.rwi`, en realidad estemos comparando indicadores de un mismo acontecimiento, cayendo así en una trampa analítica.

Ahora bien, el no lograr aproximarnos correctamente a una variable que consiga explicar los niveles de pobreza y marginación social no debe llevarnos a descartar la hipótesis planteada al inicio del trabajo, sino a buscar indicadores que a nivel municipal consigan capturan la capacidad estatal y logren hacerla comparable entre municipios y alcaldías. Esta primera aproximación a la capacidad estatal a nivel subnacional puede abrir una veta de estudio del federalismo mexicano y de los resultados que ha tenido en diferentes partes del territorio nacional.

## Código

Las gráficas y mapas fueron elaboradas en RStudio. Se puede descargar el código dando clic [aquí](https://github.com/pptrrns/final_pc3/blob/main/final_pc3.R)

## Mapas dinámicos

Elabore en Carto.DB tres mapas dinámicos (*choropleth map*) en los que mapeo las variables ``mean.rwi``, ``pobreza.mu`` y ``carencias.mu``. En ellos se ve a nivel geográfico la relación entre dichas variables. Se pueden consultar dando clic [aquí](https://torrens.carto.com/builder/bd969ec4-292a-426f-99ff-22c2379f0f79/embed)

![alt text](https://github.com/pptrrns/final_pc3/blob/main/plots/pc3.png?raw=true)

## Bibliografía

* Jha, Himanshu. 2021. Developing State Capacity in a Weak State, en *[Building State Capability: Blog](https://buildingstatecapability.com/2021/08/22/developing-state-capacity-in-a-weak-state/)*, Harvard’s Center for International Development.
* Soifer, David Hillel. 2010. Measuring state capacity in contemporary Latin America, en *Revista de Ciencia Política*, vol. 32, no. 3, 585–598. [doi.org/10.4067/S0718-090X2012000300004](http://dx.doi.org/10.4067/S0718-090X2012000300004 )
* Somuano F., Fernando Nieto. s.a. [Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf).
* UNRISD. "Building State Capacity for Poverty Reduction", en *[Combating Poverty and Inequality: Structural Change, Social Policy and Politics](https://www.unrisd.org/80256B3C005BCCF9/(httpPublications)/BBA20D83E347DBAFC125778200440AA7?OpenDocument&panel=additional)*, coord. UNRISD. Génova: UNRISD, 2010.

## Bases de datos

* ``censo2020-mu.csv``: Censo de Población y Vivienda 2020. Datos procesados por: @emagar.
* ``phy-mu.csv``: Censo de Población y Vivienda 2020. Datos procesados por: @emagar.
* ``gobmu-2019.csv``: Censo Nacional de Gobiernos Municipales y Demarcaciones Territoriales de la Ciudad de México. Indicadores de interés 2019. INEGI.
* ``pobreza.mu-2010.csv``: Indicadores de Pobreza a nivel municipio 2010. CONEVAL.
* ``dat.csv`` y ``dat.pc3.csv``: Bases de datos consolidada con las variables de interés.
