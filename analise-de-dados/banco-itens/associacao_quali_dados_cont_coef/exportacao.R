pacman::p_load(
    glue, exams
)

path <- "analise-de-dados/banco-itens/associacao_quali_dados_cont_coef"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "associacao_quali_dados_cont_coef_teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 250,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "associacao_quali_dados_cont_coef")
