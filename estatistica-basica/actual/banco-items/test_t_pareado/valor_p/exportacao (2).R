library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/test_t_pareado/valor_p/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "banco-items/test_t_pareado/valor_p",
                    name = "test_t_pareado")
