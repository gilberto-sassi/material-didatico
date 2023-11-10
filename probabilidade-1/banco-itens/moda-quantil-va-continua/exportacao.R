pacman::p_load(
    glue, exams
)

path <- "probabilidade-1/banco-itens/moda-quantil-va-continua"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "moda-quantil-va-continua-teste")