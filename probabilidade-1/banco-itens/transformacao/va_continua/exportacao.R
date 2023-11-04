pacman::p_load(
    glue, exams
)

path <- "banco-itens/transformacao/va_continua"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "transformacao-va-continua")
