if (!require(pacman)) install.packages("pacman")
pacman::p_load(
  readxl, writexl, googlesheets4, janitor, tidyverse
)


# lendo os dados ----------------------------------------------------------

inscritos <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1IzrlyxRdiT01-5Ba1oM97dtzw_HRd25VvOvQAU-PVRM/edit?usp=sharing",
  sheet = "lista_presenca"
) |> arrange(nome)
presentes <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1VXSpia5y0jINshq2b-ctH4HKLhe76x98PNTkkaf4SVg/edit?usp=sharing",
  sheet = "contagem"
) |> arrange(nome)

df_all <- full_join(
  inscritos, presentes, by = 'email'
) |>
  mutate(frequencia = replace_na(frequencia, 0))
write_sheet(
  df_all,
  "https://docs.google.com/spreadsheets/d/1VXSpia5y0jINshq2b-ctH4HKLhe76x98PNTkkaf4SVg/edit?usp=sharing",
  sheet = "contagem-com-presenca"
)
