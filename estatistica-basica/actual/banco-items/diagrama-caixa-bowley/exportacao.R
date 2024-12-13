library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/diagrama-caixa-bowley"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = path,
                    name = "diagrama-caixa-bowley-v2-teste")


path <- "estatistica-basica/actual/banco-items/diagrama-caixa-bowley"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = path,
                    name = "diagrama-caixa-bowley-v2")
