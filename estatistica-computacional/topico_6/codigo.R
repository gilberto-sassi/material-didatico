library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(lvplot)
library(glue)
library(survival)
library(tidyverse)

#------------------------------------------------------------------------------
# lung

data(cancer, package = "survival")

dados <- lung |>
    select(time, age, sex, meal.cal, status) |> 
    filter(status %in% 2)  |>
    mutate(genero = ifelse(sex == 1, "Masculino", "Feminino")) |>
    select(-sex, -status) |>
    rename(tempo = time, idade = age, calorias = meal.cal)

write_xlsx(dados, "matd46/topico_6/data/processed/cancer_pulmao.xlsx")
write_csv2(dados, "matd46/topico_6/data/processed/cancer_pulmao.csv")