library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("grafico-barras/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "grafico-barras",
                    name = "grafico-barras-proporcao")
