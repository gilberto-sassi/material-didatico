pacman::p_load(
    glue, exams
)

path <- "nome-valido"
exams2moodle(file = glue("{path}/enunciado.Rmd"),
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "nome-valido")
