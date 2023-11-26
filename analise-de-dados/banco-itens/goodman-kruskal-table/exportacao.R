pacman::p_load(
    glue, exams
)

path <- "banco-itens/goodman-kruskal-table"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "goodman-kruskal-table-teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "goodman-kruskal-table-esperada")
