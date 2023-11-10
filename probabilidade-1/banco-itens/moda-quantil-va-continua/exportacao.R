pacman::p_load(
    glue, exams
)

path <- "probabilidade-1/banco-itens/moda-quantil-va-continua"
# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "moda-quantil-va-continua-teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "moda-quantil-va-continua")