library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/ht_2pop_mean_dp_conhecido/valor_p"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 10,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-z-2pop-valor-p-teste")

path <- "estatistica-basica/actual/banco-items/ht_2pop_mean_dp_conhecido/valor_p"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-z-2pop-valor-p")
