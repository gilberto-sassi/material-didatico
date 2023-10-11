library(pacman)
p_load(
    exams, glue
)
path <- "banco-itens/normal"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "normal")
