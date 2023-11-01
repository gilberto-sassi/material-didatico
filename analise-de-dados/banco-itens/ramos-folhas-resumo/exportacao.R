pacman::p_load(
    glue, exams
)

path <- "banco-itens/ramos-folhas-resumo"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "ramos-e-folhas-resumo")
