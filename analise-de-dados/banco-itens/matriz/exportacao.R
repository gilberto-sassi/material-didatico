pacman::p_load(
    glue, exams
)

path <- "banco-itens/matriz"
exams2moodle(file = glue("{path}/enunciado.Rmd"),
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "matriz")
