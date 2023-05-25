library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/associacao/qualitativa/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "banco-items/associacao/qualitativa",
                    name = "associacao_categorica")