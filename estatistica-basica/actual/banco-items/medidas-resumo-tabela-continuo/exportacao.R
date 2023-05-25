library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("medidas-resumo-tabela-continuo/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "medidas-resumo-tabela-continuo",
                    name = "medidas-resumo-tabela-continuo-v2")
