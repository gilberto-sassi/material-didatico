library(pacman)
p_load(
    exams, glue
)
path <- "banco-itens/poisson"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "poisson")
