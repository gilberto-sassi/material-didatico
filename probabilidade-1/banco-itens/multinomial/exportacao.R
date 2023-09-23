library(pacman)
p_load(
    exams, glue
)
path <- "banco-itens/multinomial"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "multinomial")
