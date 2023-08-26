library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("estatistica-basica/actual/banco-items/ht_mean_known_var/table/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "estatistica-basica/actual/banco-items/ht_mean_known_var/table/",
                    name = "teste-z-tabela")
