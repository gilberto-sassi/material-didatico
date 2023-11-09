pacman::p_load(
    glue, exams
)

path <- "banco-itens/moda-quantil-va-discreta"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "moda-quantil-va-discreta")