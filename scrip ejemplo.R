library(tidyverse)

## cargar una base de datos

data("mtcars")

##filtro solo vehiculos con 8 cilindros

nt = mtcars %>% filter(cyl==8)


