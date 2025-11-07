library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/comparando-icZ-icT"
exams::exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = path,
                    name = "comparando-ic-Z-T-teste",
                    converter = NULL)

exams::exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1e+3,
                    verbose = TRUE,
                    dir = path,
                    name = "comparando-ic-Z-T",
                    converter = NULL)
