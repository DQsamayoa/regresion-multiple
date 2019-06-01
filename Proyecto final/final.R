
# 0. PROYECTO FINAL REGRESIÓN ---------------------------------------------

setwd("C:/git/regresion-multiple/Proyecto final")
ciudades <- read.table("ciudades.csv", 
                        header = TRUE, sep = ",")
ciudades <- ciudades[4:ncol(ciudades)]

# Selección de modelo -----------------------------------------------------

#como tenemos muchas variables y el análisis inicial es más de corte exploratorio
# vamos a probar los algoritmos de selección

library(leaps)
library(MASS)

fit.null <- lm(ingresos_propios ~ 1, ciudades)
fit.full <- lm(ingresos_propios ~ ., ciudades)

## Selección hacia adelante
fit.fwd <- stepAIC(fit.null, direction = 'forward',
                   scope = list(lower=fit.null, upper=fit.full))

## Selección hacia atrás
fit.bwd <- stepAIC(fit.full, direction = 'backward',
                   scope = list(lower=fit.null, upper=fit.full))

## Selección en ambas direcciones
### Iniciando con el modelo nulo
fit.both <- step(fit.null, direction = 'both',
                 scope = list(lower=fit.null, upper=fit.full))



# Análisis gráfico de variables seleccionadas -----------------------------


# Interpretación de coeficientes
