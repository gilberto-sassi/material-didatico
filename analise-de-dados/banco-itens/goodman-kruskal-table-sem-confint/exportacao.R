pacman::p_load(
    glue, exams
)

path <- "goodman-kruskal-table-sem-confint"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "goodman-kruskal-table-sem-confint-teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 500,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "goodman-kruskal-table-sem-confint")
