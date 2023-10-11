library(pacman)
p_load(
    exams, glue
)

path <- "banco-itens/normal-propriedade"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "normal-propriedade")
