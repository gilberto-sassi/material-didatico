library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/teste/enunciado.Rmd",
                    n = 5,
                    verbose = TRUE,
                    dir = "banco-items/teste",
                    name = "teste", converter = NULL)
