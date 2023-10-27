pacman::p_load(
    glue, exams
)

path <- "banco-itens/codigo-ramo-e-folhas"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n=1,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "codigo-ramos-e-folhas")
