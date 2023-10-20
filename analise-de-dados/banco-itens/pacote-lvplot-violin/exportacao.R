pacman::p_load(
    glue, exams
)

path <- "analise-de-dados/banco-itens/pacote-lvplot-violin"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "pacote-lvplot-violin")