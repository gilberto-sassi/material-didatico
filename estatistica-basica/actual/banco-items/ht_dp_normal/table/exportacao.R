library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/ht_dp_normal/table"
exams::exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-quiqua-variancia")
