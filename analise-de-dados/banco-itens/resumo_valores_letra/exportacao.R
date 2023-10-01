pacman::p_load(
    glue, exams
)

path <- "banco-itens/resumo_valores_letra"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "resumo_valores_letra_correto")
