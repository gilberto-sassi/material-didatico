library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("fp-to-fda/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "fp-to-fda",
                    name = "fp-to-fda",
                    converter = NULL)
