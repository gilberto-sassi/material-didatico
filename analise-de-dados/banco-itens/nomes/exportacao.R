pacman::p_load(
    glue, exams
)

path <- "analise-de-dados/banco-itens/nomes"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "comeco")