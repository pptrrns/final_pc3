##########
# Llamamos nuestras librerías
library(ggplot2)
library(corrr)
library(corrplot)
library(mxmaps)
library(RColorBrewer)
library(stringr)
library(ggrepel)
library(dplyr)
library(scales)
library(stargazer)
library(ggpubr)

##########
# Leemos nuestros datos
dat.pc3 <- read.csv("/Users/jtorrensh/Desktop/final_pc3/data_pc3/dat.pc3.csv")

# Consolidamos nuestras variables
## Variables de capacidad estatal
solicitudes.mu  <- (((as.numeric(dat.pc3$solicitudes.mu)) / dat.pc3$POBTOT) * 10000)
personal.mu <- (((as.numeric(dat.pc3$total_personal)) / dat.pc3$POBTOT) * 10000)
p15ymas.an <- ((dat.pc3$P15YM_AN / dat.pc3$P_15YMAS) * 10000)
p15ymas.se <- ((dat.pc3$P15YM_SE / dat.pc3$P_15YMAS ) * 10000)
ocupada.ss <- ((dat.pc3$PDER_SS / dat.pc3$POCUPADA) * 10000)
di.urb <- (dat.pc3$di.urb)
## Variables de pobreza, marginación y carencias sociales
pobreza.mu <- as.numeric((dat.pc3$pobreza))
carencias.mu <- as.numeric((dat.pc3$vul_car))
mean.rwi <- as.numeric((dat.pc3$mean.rwi))

# Consolidamos nuestro data.frame
dat <- data.frame(p15ymas.an, p15ymas.se, ocupada.ss, solicitudes.mu, 
                  personal.mu, pobreza.mu, carencias.mu, di.urb, mean.rwi)

# Exportamos nuestros datos (dat.csv)
dat <- write.csv(dat,"/Users/jtorrensh/Desktop/final_pc3/data_pc3/dat.csv", 
                    row.names = FALSE)

# Leemos nuestros datos (dat.csv)
dat <- read.csv("/Users/jtorrensh/Desktop/final_pc3/data_pc3/dat.csv")

##########
# Correlación entre las variables
matriz.corr <-cor(dat, use="pairwise.complete.obs")
### Gráfico de las correlaciones
testRes = cor.mtest(matriz.corr, conf.level = 0.95)
corrplot(matriz.corr, p.mat = testRes$p, method = 'color', 
         diag = FALSE, type = 'upper', 
         tl.col = 'black', cl.ratio = .15,
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 1,
         insig = 'label_sig', pch.col = 'white', order = 'AOE')

corrplot(matriz.corr, p.mat = testRes$p, method = 'number', 
         diag = FALSE, type = 'upper', 
         tl.col = 'black', cl.ratio = .15,order = 'AOE')

##########
# Otras Gráficas
## Consolidamos los datos
dat.plots <- data.frame(dat.pc3$edo, dat.pc3$mun, dat)
str(dat.plots)

######
# Relación entre población mayor a 15 años no escolarizada y mean.rwi
cor.test(p15ymas.se, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= mean.rwi, y = p15ymas.se)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población de 15 a 130 años que no aprobaron ningún grado escolar o sólo tienen preescolar y mean.rwi", 
       subtitle = "jtorrensh",
       caption = "Datos a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       y = "Pob. de 15 a 130 años que no aprobaron ningún grado escolar o sólo tienen preescolar",
       x = "Índice de Riqueza Relativa (mean.rwi)" ) +
  theme_light() +
  stat_cor(method = "pearson", label.x = -1, label.y = -1)

# Relación entre población mayor a 15 años no escolarizada y pobreza municipal
cor.test(pobreza.mu, p15ymas.se, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(y= p15ymas.se, x = pobreza.mu)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población de 15 a 130 años que no aprobaron ningún grado escolar o sólo tienen preescolar y pobreza municipal", 
       subtitle = "jtorrensh",
       caption = "Datos a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       y = "Pob. de 15 a 130 años que no aprobaron ningún grado escolar o sólo tienen preescolar",
       x = "Pobreza Municipal" ) +
  theme_light() +
  stat_cor(method = "pearson", label.x = -1, label.y = -1) 

######
# Relación entre población que no sabe leer ni escribir y mean.rwi
cor.test(p15ymas.an, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= mean.rwi, y = p15ymas.an)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población 15 a 130 años de edad que no saben leer y escribir un recado y mean.rwii", 
       subtitle = "jtorrensh",
       caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       y = "Población 15 a 130 años de edad que no saben leer y escribir un recado" ,
       x = "Índice de Riqueza Relativa (mean.rwi)" ) +
  theme_light() +
  coord_cartesian(ylim = c(0, NA), xlim = c(-0.75, NA)) +
  stat_cor(method = "pearson", label.x = - .5, label.y = 0)

# Relación entre población que no sabe leer ni escribir y pobreza municipal
cor.test(pobreza.mu, p15ymas.an, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= pobreza.mu, y = p15ymas.an)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población 15 a 130 años de edad que no saben leer y escribir un recado y pobreza municipal", 
       subtitle = "jtorrensh",
       caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       x = "Pobreza Municipal" ,
       y = "Población 15 a 130 años de edad que no saben leer y escribir un recado" ) +
  theme_light() +
  coord_cartesian(xlim = c(0, NA), ylim = c(0, NA)) +
  stat_cor(method = "pearson", label.x = - .5, label.y = 0)

# Relación entre población que no sabe leer ni escribir y carencias sociales
cor.test(carencias.mu, p15ymas.an, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= carencias.mu, y = p15ymas.an)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población 15 a 130 años de edad que no saben leer y escribir un recado y carencias sociales a nivel municipal", 
       subtitle = "jtorrensh",
       caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       y = "Población 15 a 130 años de edad que no saben leer y escribir un recado" ,
       x = "Vulnerabildiad por carencias sociales" ) +
  theme_light() +
  coord_cartesian(xlim = c(0, NA), ylim = c(0, NA)) +
  stat_cor(method = "pearson", label.x = - .5, label.y = 0)

######
# Relación entre población ocupada y afiliada a servicios médicos en alguna institución de salud y mean.rwi
cor.test(ocupada.ss, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= mean.rwi, y = ocupada.ss)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población población ocupada y afiliada a servicios médicos en alguna institución de salud y mean.rwii", 
       subtitle = "jtorrensh",
       caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       x = "Índice de Riqueza Relativa (mean.rwi)" ,
       y = "Población ocupada y afiliada a servicios médicos en alguna institución de salud " ) +
  theme_light() +
  stat_cor(method = "pearson", label.x = - .5, label.y = 0)

# Relación entre población ocupada y afiliada a servicios médicos en alguna institución de salud y carencias sociales
cor.test(ocupada.ss, carencias.mu, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= carencias.mu, y = ocupada.ss)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre población población ocupada y afiliada a servicios médicos en alguna institución de salud y carencias sociales a nivel municipal", 
       subtitle = "jtorrensh",
       caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       x = "Vulnerabildiad por carencias sociales" ,
       y = "Población ocupada y afiliada a servicios médicos en alguna institución de salud " ) +
  theme_light() +
  stat_cor(method = "pearson", label.x = - .5, label.y = 0)

######
## Relaciones entre variables de bienestar
# Relación entre vulnerabilidad por carencias sociales y mean.rwi
cor.test(carencias.mu, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= mean.rwi, y = carencias.mu)) + 
    geom_point(alpha = .5, size = 2,
               col = "royalblue4") +
    geom_smooth(method = lm, se = FALSE,
                col = "black",
                size = .5) + 
    labs(title = "Relación entre vulnerabilidad por carencias sociales y mean.rwi a nivel municipal", 
         subtitle = "jtorrensh",
         caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
         x = "Índice de Riqueza Relativa (mean.rwi)" ,
         y = "Vulnerabilidad por carencias socialesl" ) +
  theme_light() +
  stat_cor(method = "pearson", label.x = 0, label.y = 0)

# Relación entre pobreza y mean.rwi
cor.test(pobreza.mu, mean.rwi, method = "pearson", use = "complete.obs") # Test de Correlación
ggplot(data = dat.plots, aes(x= mean.rwi, y = pobreza.mu)) + 
  geom_point(alpha = .5, size = 2,
             col = "royalblue4") +
  geom_smooth(method = lm, se = FALSE,
              col = "black",
              size = .5) + 
  labs(title = "Relación entre pobreza y mean.rwi", 
       subtitle = "jtorrensh",
       caption = "Datos ponderados a nivel municipal.
       Elaboración propia. Datos: @emagar; CONEVAL.",
       x = "Índice de Riqueza Relativa (mean.rwi)" ,
       y = "Pobreza" ) +
  theme_light() +
  stat_cor(method = "pearson", label.x = -.5, label.y = 0)

##########
# Mapas
## Consolidamos los datos
maps <- data.frame(dat.plots)
region <- str_pad(dat.pc3$clave_inegi, 5, pad = "0")
maps.pc3 <- data.frame(region, maps)
datos.mapas <- merge(x = df_mxmunicipio_2020, y = maps.pc3, 
                     by = "region", all = TRUE)

#  Pobreza municipal
datos.mapas$value <-  datos.mapas$pobreza.mu
pobreza.map <- mxmunicipio_choropleth(datos.mapas,
                                      legend = "Pobreza municipal",
                                      num_colors = 9) + 
  labs(title = "Pobreza municipal",
       subtitle = "jtorrensh",
       caption = "Pobreza municipal.
       Elaboración propia. Datos: CONEVAL")
pobreza.map[["layers"]][[.1]][["aes_params"]][["colour"]] <- "transparent"
pobreza.map

#  Mean.rwi
datos.mapas$value <-  datos.mapas$mean.rwi
mean.map <- mxmunicipio_choropleth(datos.mapas,
                                      legend = "mean.rwi",
                                      num_colors = 9) + 
  labs(title = "mean.rwi",
       subtitle = "jtorrensh",
       caption = "mean.rwil.
       Elaboración propia. Datos: @emagar")
mean.map[["layers"]][[.1]][["aes_params"]][["colour"]] <- "transparent"
mean.map

#  Carencias a nivel municipal
datos.mapas$value <-  datos.mapas$carencias.mu
carencias.map <- mxmunicipio_choropleth(datos.mapas,
                                      legend = "Carencias sociales",
                                      num_colors = 9) + 
  labs(title = "Pobreza municipal",
       subtitle = "jtorrensh",
       caption = "Carencias a nivel municipal.
       Elaboración propia. Datos: CONEVAL")
carencias.map[["layers"]][[.1]][["aes_params"]][["colour"]] <- "transparent"
carencias.map