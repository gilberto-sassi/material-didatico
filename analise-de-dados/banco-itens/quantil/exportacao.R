pacman::p_load(
    glue, exams
)

path <- "banco-itens/quantil"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "quantil")
