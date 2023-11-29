if (!require(pacman)) {
    install.packages("pacman")
    library(pacman)
}

p_load(
    exams,
    glue,
    tidyverse
)

# número de questões geradas
tam <- 1000

caminho <- "banco-itens/p2"

#------------------------------------------------------------------------------
# questão 2

exams2moodle(file = glue("{caminho}/q2.Rmd"), name = "q2",
             dir = caminho, verbose = FALSE)

#------------------------------------------------------------------------------
# questão 3

exams2moodle(file = glue("{caminho}/q3.Rmd"),
             n = 5,
             name = "q3-teste",
             dir = caminho,
             verbose = TRUE)

exams2moodle(file = glue("{caminho}/q3.Rmd"),
             n = tam,
             name = "q3",
             dir = caminho,
             verbose = TRUE)

#------------------------------------------------------------------------------
# questão 4

exams2moodle(file = glue("{caminho}/q4.Rmd"),
             n = 5,
             name = "q4-teste",
             dir = caminho,
             verbose = TRUE)

exams2moodle(file = glue("{caminho}/q4.Rmd"),
             n = tam,
             name = "q4",
             dir = caminho,
             verbose = TRUE)

#------------------------------------------------------------------------------
# questão 5

exams2moodle(file = glue("{caminho}/q5.Rmd"),
             n = 5,
             name = "q5-teste",
             dir = caminho,
             verbose = TRUE)

exams2moodle(file = glue("{caminho}/q5.Rmd"),
             n = tam,
             name = "q5",
             dir = caminho,
             verbose = TRUE)

#------------------------------------------------------------------------------
# questão 6

exams2moodle(file = glue("{caminho}/q6.Rmd"),
             n = 5,
             name = "q6-teste",
             dir = caminho,
             verbose = TRUE)

exams2moodle(file = glue("{caminho}/q6.Rmd"),
             n = tam,
             name = "q6",
             dir = caminho,
             verbose = TRUE)
