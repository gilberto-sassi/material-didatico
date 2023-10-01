pacman::p_load(
    glue, exams
)

path <- "banco-itens/valores_letras_tabela"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "lv_tabela")
