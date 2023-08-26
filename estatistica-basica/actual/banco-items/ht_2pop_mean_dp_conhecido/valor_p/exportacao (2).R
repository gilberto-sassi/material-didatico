library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("estatistica-basica/actual/banco-items/ht_2pop_mean_dp_conhecido/valor_p/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "estatistica-basica/actual/banco-items/ht_2pop_mean_dp_conhecido/valor_p",
                    name = "teste-z-2pop-valor-p")
