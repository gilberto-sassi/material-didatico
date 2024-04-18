pacman::p_load(
    glue, exams, tidyverse
)

path <- "banco-itens/dataframe"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "dataframe-teste")


exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 250,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "dataframe")

