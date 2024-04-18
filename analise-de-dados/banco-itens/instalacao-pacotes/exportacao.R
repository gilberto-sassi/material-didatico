pacman::p_load(
    glue, exams
)

path <- "banco-itens/instalacao-pacotes"
exams2moodle(file = glue("{path}/enunciado.Rmd"),
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "instalacao-pacotes")
