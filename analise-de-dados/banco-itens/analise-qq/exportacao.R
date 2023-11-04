pacman::p_load(
    glue, exams
)

path <- "banco-itens/analise-qq"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "analise-qq")
