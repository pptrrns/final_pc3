# Política Comparada III

**José Ángel Torrens Hernández** (175021)

ITAM, Ciencia política

## Argumento y enfoque

Para que las estrategias de desarrollo, crecimiento y redistribución conduzcan a un crecimiento equitativo y a la reducción de la pobreza, los Estados deben tener  capacidades institucionales y estructurales (UNRISD, 2010). Dichas capacidades se enmarcan en la habilidad para utilizar el potencial extractivo del Estado para movilizar recursos que permitan formular y desplegar políticas públicas, distribuir bienes y servicios, y mantener el control  del territorio (Himanshu, 2021; Soifer, 2010). 

Como señalan Fernanda Somuano y Fernando Nieto en *[Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf)*, "aunque la capacidad estatal se ha estudiado en gran medida a nivel nacional, también puede observarse a nivel subnacional. (…) Por lo que,  capacidades estatales subnacionales más robustas o más débiles pueden tener también consecuencias políticas y sociales relevantes a nivel local".

El estudio propuesto busca analizar las capacidades estatales a nivel subnacional tomando  como unidad de análisis territorial a los municipios y alcaldías. Así pues, el trabajo esta encaminado a comprobar o refutar la siguiente relación:

* robustas capacidades estatales a nivel subnacional y municipal implican menores niveles de pobreza, marginación y carencias sociales.

Es decir, que ahí dónde observemos mejores indicadores sobre la capacidad de despliegue del Estado, observaremos también menores niveles de carencias sociales, y viceversa. 

## Metodología 

Para la medición de la capacidad estatal a nivel subnacional combino la metodología propuesta por Andrés Lajous en *[Ranking subnational state capacity in Mexico]((https://scholar.princeton.edu/alajous/blog/ranking-subnational-state-capacity-mexico))*, y la propuesta de David Hillel Soifer en  *[Measuring state capacity in contemporary Latin America](http://dx.doi.org/10.4067/S0718-090X2012000300004 )*. Ambas metodologías están encaminadas a realizar un *ranking subnacional* partiendo de categorías como coacción y seguridad, servicios y administración, infraestructura, y extracción. En cada categoría de análisis encontramos una canasta de indicadores que nos permiten acercarnos a una amplia concepción de la capacidad estatal, con variables nacionales, estatales y municipales.[^1]  A saber, los indicadores a analizar en cada categoría son:

- Seguridad y coacción
  - Policías por cada 100 mil habitantes (SNSP); Tasa de homicidios (INEGI)**;
  - Tasa de linchamientos (CNDH)**.
- Servicios y administración
  - Tasa de población vacunada entre 0 y 2 años (ENSANUT); Proporción de población alfabetizada mayor de 15 años (**``censo2020-mu.csv``**; ``P15YM_AN``/``P_15YMAS`` y `` P15YM_SE``/``P_15YMAS`` ); Proporción de personas en el padrón electoral que tienen un domicilio conocido (INE)**; Número de funcionarios públicos per cápita.
- Extracción
  - Impuestos directos per cápita; Proporción de población activa en el sector formal (**``censo2020-mu.csv``**; ``PDER_SS``/ ``POCUPADA``).
- Infraestructura
  - Densidad vial, incluyendo todas las carreteras y calles de la "Red Vial Nacional" (INEGI / SCT); Distancia en km's al polígono urbano más próximo (**``phys-mu.csv``**; ``di.urb ``).

En la selección de estas variables, no solo se pretende definir una medida para la capacidad estatal, sino también "evitar desarrollar un esquema de medición que se base en los *outcomes* de cualquier programa estatal (…), ya que eso presupone una relación directa entre los productos y los *outcomes*." (Soifer, 2010). Así pues, el indicador a construir no considera el resultado, por ejemplo, de variables relacionadas con el nivel de bienestar, como ``VPH_AGUAFV ``, ``VPH_S_ELEC `` o `VPH_PISOTI` , ya que ello implicaría hacer pasar esas variables, como la causa de las mismos.

Ahora bien, para la elaboración del *ranking* ponderamos por población cada variable[^2]  y normalizarlas de 0 a 1, siendo 1 el valor más alto observado y 0 el más bajo (en las variables con ** los valores asignados serán 1 para el más bajo y 0 para el más alto); las sumaremos por categorías y obtendremos el promedio de cada una, para después volver a sumar las cuatro categorías y obtener el promedio de las cuatro por municipios y estado. 

Para la comparación del ranking de capacidades estatales a nivel subnacional y municipal con los niveles de bienestar económico, carencia social, pobreza y marginación, utilizaré diferentes indicadores: primero, el *Índice de riqueza relativa* de *Facebook* [^3], disponible en la base de datos **``phys-mu.csv``**; y después los indicadores de medición de la pobreza a nivel municipal del *Consejo Nacional de Evaluación de la Política de Desarrollo Social* (CONEVAL). Así pues, podremos establecer comparativos no solamente entre capacidades estatales y niveles de bienestar social, sino también entre la variable ``mean.rwi`` del *Índice de riqueza relativa* y los datos del CONEVAL.

Además del comparativo entre estos dos indicadores, también se harán gráficas comparando variables de capacidad estatal con variables de niveles de bienestar, y de confirmarse el supuesto planteado, se seleccionaran municipios para realizar un análisis comparativo.

## Variables propuestas

### Variables de capacidad estatal

### variables de pobreza, carencias sociales y niveles de bienestar

## Análisis de las variables propuestas

## Bibliografía

Jha, Himanshu. 2021. Developing State Capacity in a Weak State, en *[Building State Capability: Blog](https://buildingstatecapability.com/2021/08/22/developing-state-capacity-in-a-weak-state/)*, Harvard’s Center for International Development.

Soifer, David Hillel. 2010. Measuring state capacity in contemporary Latin America, en *Revista de Ciencia Política*, vol. 32, no. 3, 585–598. [doi.org/10.4067/S0718-090X2012000300004](http://dx.doi.org/10.4067/S0718-090X2012000300004 )

Somuano Fernanda, Fernando Nieto. s.a. [Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf).

UNRISD. "Building State Capacity for Poverty Reduction", en *[Combating Poverty and Inequality: Structural Change, Social Policy and Politics](https://www.unrisd.org/80256B3C005BCCF9/(httpPublications)/BBA20D83E347DBAFC125778200440AA7?OpenDocument&panel=additional)*, coord. UNRISD. Génova: UNRISD, 2010.

## Bases de datos

[^1]: Si bien nos aproximamos a la capacidad estatal con variables de los tres niveles de administración pública, el *ranking* es sensible solamente al tipo de datos que tienen un impacto concreto a nivel local (*e.g.:* tasa de población vacunada). (Nota: agregué variables que a mi consideración podrían servir para arrojar resultados más precisos sobre la capacidad estatal)
[^2]: En el caso de las variables de infraestructura no es posible ponderar.
[^3]: El *Índice de riqueza relativa* permite predecir el nivel de vida relativo de cada país en función de datos de conectividad en los que se protege la privacidad, imágenes satelitales y otras fuentes de datos novedosas (Facebook, 2021).
