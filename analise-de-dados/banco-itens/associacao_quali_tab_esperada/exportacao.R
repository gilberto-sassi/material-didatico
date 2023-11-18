pacman::p_load(
    glue, exams
)

path <- "banco-itens/associacao_quali_tab_esperada"

# teste
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 5,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "associacao_quali_tab_esperada-teste")

# real
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 400,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "associacao_quali_tab_esperada")
