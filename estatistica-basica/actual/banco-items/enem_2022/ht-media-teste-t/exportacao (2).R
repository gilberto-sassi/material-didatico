library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

pasta <- "estatistica-basica/actual/banco-items/enem_2022/ht-media-teste-t"
exams::exams2moodle(glue("{pasta}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = pasta,
                    name = "enem_2022_teste_t_1pop_media")
