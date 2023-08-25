library(exams)
library(glue)
library(tidyverse)

path <- "banco-itens/algebras"
exercicios <- c(
    glue("{path}/algebra.Rmd"),
    glue("{path}/sigma-algebra.Rmd")
)

exams::exams2moodle(
    file = exercicios,
    name = "algebras",
    dir = path,
    verbose = TRUE
)