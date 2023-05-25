library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("quantis-tabela-continuo/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "quantis-tabela-continuo",
                    name = "quantis-tabela-continuo-v2")
