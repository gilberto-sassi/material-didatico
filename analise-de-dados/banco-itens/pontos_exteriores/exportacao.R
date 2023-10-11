pacman::p_load(
    glue, exams
)

path <- "banco-itens/pontos_exteriores"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "pontos_exteriores")
