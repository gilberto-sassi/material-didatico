library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/ht_2pop_mean_dp_desconhecido_diferente/table"
exams::exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = path,
                    name = "teste_t_2pop_var_diff_table")
