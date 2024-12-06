library(pacman)
p_load(readxl)
p_load(readODS)
p_load(writexl)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(exams)
p_load(tidyverse)

path <- "estatistica-basica/actual/banco-items/quantis"
exams2moodle(glue("{path}/enunciado-quartis.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = path,
                    name = "quartis-teste")

exams2moodle(glue("{path}/enunciado-quartis.Rmd"),
                    n = 250,
                    verbose = TRUE,
                    dir = path,
                    name = "quartis")

