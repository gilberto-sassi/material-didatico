pacman::p_load(
    glue, exams
)

path <- "banco-itens/codigo-python"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "codigo-python-fda")