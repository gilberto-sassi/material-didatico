library(pacman)
p_load(
    glue
)

path <- "banco-itens/combinatoria"
exams::exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "combinatoria")
