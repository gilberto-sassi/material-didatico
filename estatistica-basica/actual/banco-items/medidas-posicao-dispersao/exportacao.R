library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("medidas-posicao-dispersao/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "medidas-posicao-dispersao",
                    name = "medidas-posicao-dispersao")
