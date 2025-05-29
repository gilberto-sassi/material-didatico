library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(tidyverse)

#------------------------------------------------------------------------------
# lendo os dados

dados <- read_xlsx("selecao/dados/inscritos.xlsx", sheet = "limpo")

unique(dados$vinculo)
# [1] "estudante"
# [2] "externa"
# [3] "professor"
# [4] "estudante_best"


#------------------------------------------------------------------------------
# sorteio: 20 vagas
# 8: comunidade externa
# 12: estudante Estatística

df_inscritos <- read_xlsx("selecao/dados/inscritos.xlsx", sheet = "limpo")
df_inscritos <- distinct(df_inscritos, email, .keep_all = TRUE)

set.seed(12345)

# Selecionados
df_selecionados <- bind_rows(
    df_inscritos |> filter(vinculo %in% "externa") |>
        sample_n(8),
    df_inscritos |> filter(vinculo %in% "estudante_best") |>
        sample_n(12),
)
write_xlsx(
    df_selecionados,
    "selecao/dados/selecionados.xlsx"
)

# Não Selecionados
df_nao_selecionado <- df_inscritos |>
    filter(!(email %in% df_selecionados$email))
write_xlsx(df_nao_selecionado, "selecao/dados/nao_selecionado.xlsx")
