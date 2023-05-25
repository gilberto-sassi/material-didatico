library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("banco-items/ht_2pop_mean_dp_conhecido/table/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "banco-items/ht_2pop_mean_dp_conhecido/table",
                    name = "ht_2pop_mean_dp_conhecido_table")
