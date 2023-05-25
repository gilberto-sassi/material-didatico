library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

pasta <- "banco-items/enem_2021/ic"
exams::exams2moodle("banco-items/enem_2021/ic/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = pasta,
                    name = "enem_2021_ic")
