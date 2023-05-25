library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("poisson/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "poisson",
                    name = "poisson")
