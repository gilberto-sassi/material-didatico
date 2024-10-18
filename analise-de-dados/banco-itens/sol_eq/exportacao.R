pacman::p_load(
    glue, exams
)

path <- "analise-de-dados/banco-itens/sol_eq"
exams2moodle(file = glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "sol_eq")
