library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("ic-media-normal-dp-conhecido/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "ic-media-normal-dp-conhecido",
                    name = "ic-media-normal-dp-conhecido",
                    converter = NULL)
