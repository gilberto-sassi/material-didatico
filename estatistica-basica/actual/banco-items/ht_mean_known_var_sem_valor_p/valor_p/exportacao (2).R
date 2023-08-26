library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/ht_mean_known_var_sem_valor_p/valor_p/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "banco-items/ht_mean_known_var_sem_valor_p/valor_p",
                    name = "teste_Z_dados_sem_valor_p")
