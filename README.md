# Regresión Mútiple y otras técnicas multivaraidas
===================================
Repositorio para los ejercicios de regresión múltiple

# Objetivos

El proposito de este repositorio es poder concentrar el trabajo de todos en un mismo lugar sin depender de que una persona realice los cambios y vuelva a compilar el documento.

# Estructura carpeta

El repositorio está pensado para mantener la siguiente organización

```
.
+-- Tareas
+-- LICENSE
+-- README.md
+-- Tareas
|   +-- Tarea_01
|       +-- t01.pdf
|       +-- Tarea_01.Rmd
|       +-- Tarea_01.pdf
|       +-- tex
|           +-- header.tex
+-- Proyecto_Final
```

Dentro de la carpeta "Tareas" se debe generar una carpeta por cada tarea con la siguiente estructura:

```
Tarea_XX
+-- tXX.pdf
+-- Tarea_XX.Rmd
+-- Tarea_XX.pdf
+-- tex
|   +-- header.tex
```
donde:
- El archivo **tXX.pdf** hace referencia al documento con los ejercicios a realizar en la tarea número XX
- El archivo **Tarea_XX.Rmd** hace referencia al documento con las soluciones desarrolladas por nosotros para la tarea número XX
- El archivo **Tarea_XX.pdf** hace referencia al archivo pdf generado al compilar el Rmd previo
- El archivo **header.tex** contiene las librerias y definiciones que se van a utilizar para compilar el pdf previo

Dentro de la carpeta "Proyecto_Final" vamos a incluir todo lo relacionado con el proyecto conforme vayamos avanzando.

# Librarias de R

Para poder compilar el documento Tarea_XX.Rmd será necesario tener las siguientes librerias instaladas

- tidyverse
- scales
- grid
- kableExtra
- latex2exp
- HistData

# Latex

También será necesario contar con Latex instalado en la computadora. En caso de no tenerlo, una opción es usar **tinytex** el cual hace una instalación minima de latex y conforme se necesite va administrando los paquetes que se necesitan de latex.

En caso de querer instalar tinytex, usar los siguientes comandos en R:

```r
# Instalar primero la libreria tinytex
install.packages('tinytex')

# Instalar tex
tinytex::install_tinytex()
```

