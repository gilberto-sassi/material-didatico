pacman::p_load(
    glue, exams
)

path <- "banco-itens/skewness_kurtosis_momentos"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "skewness_kurtosis_momentos")
