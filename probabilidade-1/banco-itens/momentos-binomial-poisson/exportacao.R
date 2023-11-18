pacman::p_load(
    glue, exams
)

path <- "banco-itens/momentos-binomial-poisson"
# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "momentos-va-binomial-poisson-teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "momentos-va-binomial-poisson")