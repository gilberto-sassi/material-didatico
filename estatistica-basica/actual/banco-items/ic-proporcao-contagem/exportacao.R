library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/ic-proporcao-contagem/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "banco-items/ic-proporcao-contagem",
                    name = "ic-proporcao-contagem",
                    converter = NULL)
