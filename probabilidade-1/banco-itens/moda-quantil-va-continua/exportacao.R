pacman::p_load(
    glue, exams
)

path <- "banco-itens/moda-quantil-va-continua"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "moda-quantil-va-continua")