if(!require(pacman)) install.packages("pacman")
library(pacman)
p_load(
  readxl, writexl, googlesheets4, dados, tidyverse
)

enem <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1B8b-Z3xgmWCnQHH9l4y6GXtLc5zefHb02DWH-MSeLUU/edit?usp=sharing",
  sheet = "Sheet1"
)

exemplo <- enem |>
  filter(nu_nota_mt > 0) |>
  filter(nu_nota_cn > 0) |>
  select(nu_inscricao, nu_nota_mt, nu_nota_ch) |>
  slice_sample(n = 5)
exemplo

paste0(exemplo$nu_inscricao, collapse = ", ")
paste0(exemplo$nu_nota_mt, collapse = "; ") |>
  str_replace_all("\\.", ",")
paste0(exemplo$nu_nota_ch, collapse = "; ") |>
  str_replace_all("\\.", ",")

exercicio <- enem |>
  filter(nu_nota_mt > 0, nu_nota_cn > 0, !(nu_inscricao %in% exemplo$nu_inscricao)) |>
  select(nu_inscricao, nu_nota_lc, nu_nota_ch) |>
  slice_sample(n = 5)
exercicio

paste0(exercicio$nu_inscricao, collapse = ", ")
paste0(exercicio$nu_nota_lc, collapse = "; ") |>
  str_replace_all("\\.", ",")
paste0(exercicio$nu_nota_ch, collapse = "; ") |>
  str_replace_all("\\.", ",")


# mtcarros ----------------------------------------------------------------

glimpse(mtcarros)
write_csv(mtcarros, 'dados/brutos/mtcarros.csv')



# iris --------------------------------------------------------------------

glimpse(dados_iris)

df_iris <- dados_iris |> janitor::clean_names()
glimpse(df_iris)
write_xlsx(df_iris, 'dados/brutos/iris.xlsx')
