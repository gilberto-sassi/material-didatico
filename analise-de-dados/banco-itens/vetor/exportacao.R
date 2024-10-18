pacman::p_load(
    glue, exams
)

path <- "analise-de-dados/banco-itens/vetor"
exams2moodle(file = glue("{path}/enunciado.Rmd"),
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "vetor")
