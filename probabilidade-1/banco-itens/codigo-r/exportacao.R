pacman::p_load(
    glue, exams
)

path <- "banco-itens/codigo-r"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "codigo-r-fda")