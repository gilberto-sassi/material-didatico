if (!require(pacman)) install.packages("pacman")
library(pacman)
p_load(readxl)
p_load(readODS)
p_load(writexl)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(exams)
p_load(tidyverse)

path <- "estatistica-basica/actual/banco-items/ht_2pop_mean_dp_conhecido/table/"
exams::exams2moodle(glue("{path}enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-z-2pop-tabela-teste")

exams::exams2moodle(glue("{path}enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = path,
                    name = "teste-z-2pop-tabela")
