# Política Comparada III

**José Ángel Torrens Hernández** (175021)

ITAM, Ciencia política

## Argumento y enfoque

Para que las estrategias de desarrollo, crecimiento y redistribución conduzcan a un crecimiento equitativo y a la reducción de la pobreza, los Estados deben tener  capacidades institucionales y estructurales (UNRISD, 2010). Dichas capacidades se enmarcan en la habilidad para utilizar el potencial extractivo del Estado para movilizar recursos que permitan formular y desplegar políticas públicas, distribuir bienes y servicios, y mantener el control  del territorio (Himanshu, 2021; Soifer, 2010). 

Como señalan Fernanda Somuano y Fernando Nieto en *[Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf)*, "aunque la capacidad estatal se ha estudiado en gran medida a nivel nacional, también puede observarse a nivel subnacional. (…) Por lo que,  capacidades estatales subnacionales más robustas o más débiles pueden tener también consecuencias políticas y sociales relevantes a nivel local".

El estudio propuesto busca analizar las capacidades estatales a nivel subnacional tomando  como unidad de análisis territorial a los municipios y alcaldías. Así pues, el trabajo esta encaminado a comprobar o refutar la siguiente relación:

* robustas capacidades estatales a nivel subnacional y municipal implican menores niveles de pobreza, marginación y carencias sociales.

Es decir, que ahí dónde observemos mejores indicadores sobre la capacidad de despliegue del Estado, observaremos también menores niveles de carencias sociales, y viceversa. 

## Variables propuestas
En la selección de estas variables pretendo aproximar una medida para la capacidad estatal, así como  "evitar desarrollar un esquema de medición que se base en los *outcomes* de cualquier programa estatal (…), ya que eso presupone una relación directa entre los productos y los *outcomes*." (Soifer, 2010). Por tanto, no considero  variables relacionadas con el nivel de bienestar, como ``VPH_AGUAFV ``, ``VPH_S_ELEC `` o `VPH_PISOTI` , ya que  implicaría pasar esas variables como la causa de las mismas.

### Variables de capacidad estatal
Para la medición de la capacidad estatal a nivel subnacional propongo tomar como variables:

* ``personal.mu`` : Personal en las instituciones de las administraciones públicas municipales, por municipio o demarcación territorial.
* ``solicitudes.mu`` : Solicitudes de acceso a la información pública y protección de datos personales atendidas por las instituciones de las administraciones públicas municipales, por municipio o demarcación territorial.
* ``di.urb`` : Distancia en km's al polígono urbano más próximo.
* ``p15ymas.an`` : 
* ``p15ymas.se`` : 
* ``ocupada.ss``: personas afiliadas a servicios médicos en alguna institución de salud pública o privada (IMSS; ISSSTE e ISSSTE estatal; PEMEX; SEDENA; SEMAR; INSABI u otra)

*Servicios y administración
Proporción de población alfabetizada mayor de 15 años ``P15YM_AN``/``P_15YMAS`` y `` P15YM_SE``/``P_15YMAS`` )
Número de funcionarios públicos per cápita.
Extracción
Proporción de población activa en el sector formal ``PDER_SS``/ ``POCUPADA``).

Las variables ``personal.mu``, ``solicitudes.mu`` y ``di.urb`` recogen la capacidad del Estado en la provisión de servicios administrativos y de infraestructura, mientras que ``p15ymas.an``, ``p15ymas.se`` y ``ocupada.ss`` la capacidad extractiva.

### Variables de pobreza, carencias sociales y niveles de bienestar
Para la medición de los niveles de pobreza, bienestar y carencias sociales propongo tomar como variables:

* ``mean.rwi`` : Índice de riqueza relativa de Facebook.
    - El RWI permite predecir el nivel de vida relativo de cada país en función de datos de conectividad, imágenes satelitales y otras fuentes de datos novedosas (Facebook, 2021).
* ``pobreza.mu`` : Proporción de la población en situación de pobreza a nivel municipal.
* ``carencias.mu`` : Proporción de la población vulnerable por carencias sociales a nivel municipal.

## Análisis de las variables propuestas


## Código
Las gráficas y mapas fueron elaboradas en RStudio. Se puede descargar el código dándo click [aquí]()

## Bibliografía

Jha, Himanshu. 2021. Developing State Capacity in a Weak State, en *[Building State Capability: Blog](https://buildingstatecapability.com/2021/08/22/developing-state-capacity-in-a-weak-state/)*, Harvard’s Center for International Development.

Soifer, David Hillel. 2010. Measuring state capacity in contemporary Latin America, en *Revista de Ciencia Política*, vol. 32, no. 3, 585–598. [doi.org/10.4067/S0718-090X2012000300004](http://dx.doi.org/10.4067/S0718-090X2012000300004 )

Somuano Fernanda, Fernando Nieto. s.a. [Subnational state capacity and civic and political participation in Mexico](https://www.ippapublicpolicy.org/file/paper/594d7107abda2.pdf).

UNRISD. "Building State Capacity for Poverty Reduction", en *[Combating Poverty and Inequality: Structural Change, Social Policy and Politics](https://www.unrisd.org/80256B3C005BCCF9/(httpPublications)/BBA20D83E347DBAFC125778200440AA7?OpenDocument&panel=additional)*, coord. UNRISD. Génova: UNRISD, 2010.

## Bases de datos
* ``censo2020-mu.csv``: Censo 2020. @emagar.
* ``phy-mu.csv``: Censo 2020. @emagar.
* ``gobmu-2019.csv``: Censo Nacional de Gobiernos Municipales y Demarcaciones Territoriales de la Ciudad de México. Indicadores de interés. INEGI, 2019.
* ``pobreza.mu-2010.csv``: 
* ``dat.csv``: Base de datos consolidada con las variables de inetrés.
* ``dat.pc3.csv``: Base de datos consolidada con las variables de inetrés.
