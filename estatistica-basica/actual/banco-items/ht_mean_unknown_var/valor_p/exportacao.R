library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/ht_mean_unknown_var/valor_p"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 10,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-t-valor-p-teste")

exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-t-valor-p")