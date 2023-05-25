library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("fda-to-fp/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "fda-to-fp",
                    name = "fda-to-fp")
