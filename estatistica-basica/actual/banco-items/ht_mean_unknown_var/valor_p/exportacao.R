library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("estatistica-basica/actual/banco-items/ht_mean_unknown_var/valor_p/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "estatistica-basica/actual/banco-items/ht_mean_unknown_var/valor_p",
                    name = "teste-dados-normal-dp-desconhecido-mean")
