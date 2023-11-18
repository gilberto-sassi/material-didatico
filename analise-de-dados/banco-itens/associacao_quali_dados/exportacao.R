pacman::p_load(
    glue, exams
)

path <- "banco-itens/associacao_quali_dados"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "associacao_quali_dados_teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 80,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "associacao_quali_dados")
