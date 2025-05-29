if (!require(pacman)) {
  install.packages('pacman')
  library(pacman)
}
p_load(
  readxl, writexl, janitor, googlesheets4, tidyverse
)

# carregando os dados -----------------------------------------------------

df_inscritos <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1xff725mwllZIRHTxkqfUDJOGrp8emZFPpMTb81_L7wM/edit?usp=sharing"
) |>
  clean_names() |>
  dplyr::distinct(endereco_de_e_mail, .keep_all = T)

# juntando em uma categoria: professor e TAE
df_inscritos <- df_inscritos |>
  mutate(
    vinculo = case_match(
      vinculo,
      "Técnico da UFBA" ~ "Servidor",
      "Professor da UFBA" ~ "Servidor",
      .default = vinculo
    )
  )

df_inscritos |> count(vinculo, sort = T)


# sorteio por categoria ---------------------------------------------------

estratos <- c(
  "estat" = 10,
  "estudante" = 3,
  "externa" = 10,
  "servidor" = 2
)

set.seed(20250226)
titulares <- bind_rows(
  df_inscritos |>
    filter(vinculo == "Estudante do Bacharelado em Estatística da UFBA") |>
    slice_sample(n = estratos['estat']),
  df_inscritos |>
    filter(vinculo == "Estudante de graduação e pós-graduação da UFBA") |>
    slice_sample(n = estratos['estudante']),
  df_inscritos |>
    filter(vinculo == "Servidor") |>
    slice_sample(n = estratos['servidor']),
  df_inscritos |>
    filter(vinculo == "Não tenho vínculo com a UFBA") |>
    slice_sample(n = estratos['externa']),
  df_inscritos |>
    filter(endereco_de_e_mail == "apmedeirosfisio@gmail.com")
) |>
  arrange(carimbo_de_data_hora)

suplentes <- df_inscritos |>
  filter(!endereco_de_e_mail %in% titulares$endereco_de_e_mail) |>
  arrange(carimbo_de_data_hora)

write_sheet(
  df_inscritos,
  "https://docs.google.com/spreadsheets/d/1fcSg1y8cRfPEcW1ybEfNUC_etCbi5v3xsL8voP8ISSc/edit?usp=sharing",
  sheet = "inscritos"
)
write_sheet(
  titulares,
  "https://docs.google.com/spreadsheets/d/1fcSg1y8cRfPEcW1ybEfNUC_etCbi5v3xsL8voP8ISSc/edit?usp=sharing",
  sheet = "titulares"
)
write_sheet(
  suplentes,
  "https://docs.google.com/spreadsheets/d/1fcSg1y8cRfPEcW1ybEfNUC_etCbi5v3xsL8voP8ISSc/edit?usp=sharing",
  sheet = "suplentes"
)
