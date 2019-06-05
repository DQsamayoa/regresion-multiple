
# 0. PROYECTO FINAL REGRESIÓN ---------------------------------------------

#setwd("C:/git/regresion-multiple/Proyecto final")
ciudades <- read.table("ciudades.csv", 
                        header = TRUE, sep = ",")
ciudades <- ciudades[2:ncol(ciudades)]

ciudades$inversion_extranjera <- log(ciudades$inversion_extranjera)
ciudades$pib <- log(ciudades$pib)
# Selección de modelo -----------------------------------------------------

#como tenemos muchas variables y el análisis inicial es más de corte exploratorio
# vamos a probar los algoritmos de selección antes de comenzar un análisis visual

library(leaps)
library(MASS)

fit.subsets <- regsubsets(inversion_extranjera ~ ., ciudades, nvmax = 73, nbest = 1)
summary(fit.subsets)

fit.null <- lm(inversion_extranjera ~ 1, ciudades)
fit.full <- lm(inversion_extranjera ~ ., ciudades)

## Selección en ambas direcciones
### Iniciando con el modelo nulo
fit.both <- stepAIC(fit.null, direction = 'both',
                 scope = list(lower=fit.null, upper=fit.full))

mod <- lm(inversion_extranjera ~ pib + empl_formales + ingresos_propios + 
            tarjetasDebCred + percepcionSeguridad + diversif_econ + gini_salarial + 
            desastres, data=ciudades
)

# Análisis gráfico de variables seleccionadas -----------------------------


plot(ciudades$pib, ciudades$inversion_extranjera)
# parece haber una relación lineal clara entre el logaritmo del pib y 
# el logaritmo de inversión extranjeta

plot(ciudades$empl_formales, ciudades$inversion_extranjera)
# parece haber una relación lineal entre el número de empleos formales y 
# el logaritmo de inversión extranjera

plot(ciudades$ingresos_propios, ciudades$inversion_extranjera)
# no parece evidente alguna relación lineal entre el porcentaje de 
# ingresos propios  y el logaritmo de inversión extranjeta

plot(ciudades$tarjetasDebCred, ciudades$inversion_extranjera)
# no parece evidente alguna relación lineal entre el número de 
# tarjetas de crédito  y el logaritmo de inversión extranjera

plot(ciudades$percepcionSeguridad, ciudades$inversion_extranjera)
# no parece haber relación entre el porcentaje de población que 
# siente seguridad en su ciudad y el logaritmo de inversión extranjera

plot(ciudades$diversif_econ, ciudades$inversion_extranjera)
# parece haber una relación lineal clara entre la diversificación económica 
# de la ciudad y el logaritmo de inversión extranjera

plot(ciudades$gini_salarial, ciudades$inversion_extranjera)
# no parece haber relación entre el gini salarial de la ciudad
#  y el logaritmo de inversión extranjera

plot(ciudades$desastres, ciudades$inversion_extranjera)
# no parece haber relación entre el número de desastres 
#  y el logaritmo de inversión extranjera

# Validación de supuestos y acciones correctivas --------------------------

# residuos
plot(ciudades$pib, mod$residuals)
plot(ciudades$empl_formales, mod$residuals)
plot(ciudades$ingresos_propios, mod$residuals)
plot(ciudades$tarjetasDebCred, mod$residuals)
plot(ciudades$percepcionSeguridad, mod$residuals)
plot(ciudades$diversif_econ, mod$residuals)
plot(ciudades$gini_salarial, mod$residuals)
plot(ciudades$desastres, mod$residuals)

# Al parecer no hay problemas de no linealidad

# Heterosedasticidad
plot(ciudades$pib, abs(mod$residuals))
plot(ciudades$empl_formales, abs(mod$residuals))
plot(ciudades$ingresos_propios, abs(mod$residuals))
plot(ciudades$tarjetasDebCred, abs(mod$residuals))
plot(ciudades$percepcionSeguridad, abs(mod$residuals))
plot(ciudades$diversif_econ, abs(mod$residuals))
plot(ciudades$gini_salarial, abs(mod$residuals))
plot(ciudades$desastres, abs(mod$residuals))

#parece haber problemas de tarjetasDebCred
library(lmtest)
bptest(mod)
#pero efectuando la prueba Breush-Pagan vemos que no hay problemas de heteroscedasticidad

## NO CORRELACIÓN
cor(ciudades[, c('pib', 'empl_formales', 'ingresos_propios', 
              'tarjetasDebCred', 'percepcionSeguridad',
              'diversif_econ', 'gini_salarial', 'desastres')])

# parece haber correlación entre diversificación económica y pib

## MATRIZ DE DISEÑO DE RANGO COMPLETO

## NORMALIDAD CONJUNTA DE LOS ERRORES

# Análisis de observaciones atípicas e influyentes ------------------------


# Análisis del modelo final -----------------------------------------------


