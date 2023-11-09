library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(lvplot)
library(glue)
library(tidyverse)

#------------------------------------------------------------------------------
# create datasets to homework ativities

carros <- cars |>
  rename(vel = speed)
write_xlsx(carros, "topico_7/dados-lista/carros.xlsx")

empresa <- read_xlsx("data/raw/empresa.xlsx")
empresa <- empresa |>
  rename(estado_civil = `Estado Civil`,
        escolaridade = `Grau de Escolaridade`,
        numero_filhos = `Numero de Filhos`,
        salario = Salario,
        idade = Idade,
        procedencia = Procedencia)
write_xlsx(empresa, "topico_7/dados-lista/empresa.xlsx")

df_iris <- iris |>
  rename(
    comprimento_sepala = Sepal.Length,
    largura_sepala = Sepal.Width,
    comprimento_petala = Petal.Length,
    largura_petala = Petal.Width,
    especies = Species
  )
write_ods(df_iris, "topico_7/dados-lista/iris.ods")

write_csv2(mtcars, "topico_7/dados-lista/mtcars.csv")
