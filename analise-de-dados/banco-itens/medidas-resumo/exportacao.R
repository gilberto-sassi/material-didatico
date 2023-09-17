pacman::p_load(
    glue, exams
)

path <- "banco-itens/medidas-resumo"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "medidas-resumo")
