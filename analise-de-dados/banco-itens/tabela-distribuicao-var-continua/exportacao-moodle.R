if (!require(pacman)) {
    install.packages("pacman")
    library(pacman)
}
p_load(readxl)
p_load(readODS)
p_load(writexl)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(exams)
p_load(tidyverse)

path <- "analise-de-dados/banco-itens/tabela-distribuicao-var-continua"
exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 250,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "tabela-distribuicao-var-continua")
