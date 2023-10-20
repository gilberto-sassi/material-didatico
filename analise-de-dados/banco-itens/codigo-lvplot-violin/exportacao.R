pacman::p_load(
    glue, exams
)

path <- "analise-de-dados/banco-itens/codigo-lvplot-violin"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "codigo-lvplot-violin")