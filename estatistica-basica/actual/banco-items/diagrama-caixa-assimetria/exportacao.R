library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(exams)
library(tidyverse)

exams::exams2moodle("diagrama-caixa-assimetria/enunciado.Rmd",
                    n = 1000,
                    verbose = TRUE,
                    dir = "diagrama-caixa-assimetria",
                    name = "diagrama-caixa-assimetria-v2",
                    rule = "false")
