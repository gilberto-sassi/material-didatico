pacman::p_load(
    glue, exams
)

path <- "banco-itens/codigo_skewness_kurtosis"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n=1,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "codigo_skewness_kurtosis")
