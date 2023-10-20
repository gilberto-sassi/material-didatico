library(pacman)

p_load(readxl)
p_load(readODS)
p_load(writexl)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(exams)
p_load(tidyverse)

path <- "banco-itens/fp-to-fda"
exams::exams2moodle(glue("{path}/enunciado.Rmd"),
                    n = 1000,
                    verbose = TRUE,
                    dir = glue("{path}"),
                    name = "fp-to-fda")