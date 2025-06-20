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

path <- "estatistica-basica/actual/banco-items/ht_2pop_dp/table/"
exams2moodle(glue("{path}enunciado.Rmd"), n = 5, verbose = TRUE,
                    dir = path, name = "teste-f-2pop-teste")

exams2moodle(glue("{path}enunciado.Rmd"), n = 1000, verbose = TRUE,
                    dir = path, name = "teste-f-2pop")
