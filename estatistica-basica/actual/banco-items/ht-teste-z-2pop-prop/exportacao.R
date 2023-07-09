library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

pasta <- "estatistica-basica/actual/banco-items/ht-teste-z-2pop-prop"
exams::exams2moodle(glue("{pasta}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = pasta,
                    name = "ht-teste-z-2pop-prop")
