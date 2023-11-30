pacman::p_load(
    glue, exams
)

path <- "banco-itens/goodman-kruskal-dados"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "goodman-kruskal-dados-teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "goodman-kruskal-dados-esperada")
