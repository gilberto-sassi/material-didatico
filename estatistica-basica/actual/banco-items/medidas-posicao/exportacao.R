library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/medidas-posicao/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "banco-items/medidas-posicao",
                    name = "medidas-posicao")
