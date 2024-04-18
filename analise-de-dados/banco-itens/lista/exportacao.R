pacman::p_load(
    glue, exams
)

path <- "banco-itens/lista"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 250,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "lista")
