if (!require(pacman)) {
    install.packages("pacman")
    library(pacman)
}
p_load(readxl)
p_load(readODS)
p_load(writexl)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(exams)
p_load(tidyverse)

path <- "estatistica-basica/actual/banco-items/test_t_pareado/table"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = path,
                    name = "teste_t_pareado_welch_teste")

exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = path,
                    name = "teste_t_pareado_welch")
