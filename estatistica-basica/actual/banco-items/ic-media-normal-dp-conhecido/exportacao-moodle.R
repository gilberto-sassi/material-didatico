library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

path <- "estatistica-basica/actual/banco-items/ic-media-normal-dp-conhecido/"
exams::exams2moodle(glue("{path}enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = path,
                    name = "ic-media-normal-dp-conhecido",
                    converter = NULL)
