library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

pasta <- "estatistica-basica/actual/banco-items/enem_2022/associacao"
exams::exams2moodle(glue("{pasta}/enunciado.Rmd"),
                    n = 1,
                    verbose = TRUE,
                    dir = pasta,
                    name = "enem_2022_teste_associacao")
