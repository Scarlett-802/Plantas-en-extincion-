# Plantas-en-extincion-Trabajo con plantas extintas
================

# introducción

En este documento **trabajaremos** para explorar la identidad de las
plantas que se encuentran extintas en silvestria o totalmente extintas
segun la [*iucn*](https://www.iucnredlist.org/)

\#\# Trabajando con los datos

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.0.3

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.2     v purrr   0.3.4
    ## v tibble  3.0.3     v dplyr   1.0.2
    ## v tidyr   1.1.2     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.0

    ## Warning: package 'ggplot2' was built under R version 4.0.3

    ## Warning: package 'readr' was built under R version 4.0.3

    ## Warning: package 'forcats' was built under R version 4.0.3

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Ahora voy a ver los datos con los que voy a trabajar:

``` r
library(readr)

plants <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv")
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   .default = col_double(),
    ##   binomial_name = col_character(),
    ##   country = col_character(),
    ##   continent = col_character(),
    ##   group = col_character(),
    ##   year_last_seen = col_character(),
    ##   red_list_category = col_character()
    ## )
    ## i Use `spec()` for the full column specifications.

\#filtrando datos para revolser ejemplo 1 el codig que voy a ejecutar
ahora, es para resolver el problema en el siguiente
[slide](https://derek-corcoran-barrios.github.io/CursoProgrPres/Clase2/Clase2InvestigacionReproducible.html#29)
para poner dentro de la base de datos, solo chile. solo los datos de
chile y solo usar columna (*country*), la especie(*binomial\_name*) y la
categoria iucn(*red\_list\_category*)

``` r
Chile <- plants %>% 
  dplyr::filter(country == "Chile") %>% 
  dplyr::select(binomial_name,country,red_list_category)


Chile
```

    ## # A tibble: 2 x 3
    ##   binomial_name           country red_list_category  
    ##   <chr>                   <chr>   <chr>              
    ## 1 Santalum fernandezianum Chile   Extinct            
    ## 2 Sophora toromiro        Chile   Extinct in the Wild

## resumen de especies por pais

``` r
Resumen <- plants %>% 
  dplyr::filter(continent == "South America") %>% 
  group_by(country) %>% 
  summarise(n_Species = n())
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
Resumen
```

    ## # A tibble: 9 x 2
    ##   country             n_Species
    ##   <chr>                   <int>
    ## 1 Argentina                   1
    ## 2 Bolivia                     1
    ## 3 Brazil                     10
    ## 4 Chile                       2
    ## 5 Colombia                    6
    ## 6 Ecuador                    52
    ## 7 Peru                        4
    ## 8 Trinidad and Tobago         6
    ## 9 Venezuela                   1

---
title: "Trabajo con plantas extintas"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```




# introducción 
 
 En este documento **trabajaremos** para explorar la identidad de las plantas que se encuentran extintas en silvestria o totalmente extintas  segun  la [*iucn*](https://www.iucnredlist.org/)
 
 ## Trabajando con los datos
```{r}
library(tidyverse)

```
 Ahora voy a ver los datos con los que voy a trabajar:
```{r}
library(readr)

plants <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv")
```
 
 #filtrando datos para revolser ejemplo 1
 el codig que voy a ejecutar ahora, es para resolver el problema en el siguiente [slide](https://derek-corcoran-barrios.github.io/CursoProgrPres/Clase2/Clase2InvestigacionReproducible.html#29)
 para poner dentro de la base de datos, solo chile. solo los datos de chile y solo usar columna (*country*), la especie(*binomial_name*) y la categoria iucn(*red_list_category*)
 
```{r}
Chile <- plants %>% 
  dplyr::filter(country == "Chile") %>% 
  dplyr::select(binomial_name,country,red_list_category)


Chile
```


## resumen de especies por pais
```{r}
Resumen <- plants %>% 
  dplyr::filter(continent == "South America") %>% 
  group_by(country) %>% 
  summarise(n_Species = n())


Resumen

```

