library(pacman)

p_load(tidyverse, e1071, rlang)

# assimetria positiva
amostra <- rbeta(1000, shape1 = 1, shape2 = 10) * 100
hist(amostra)
skewness(amostra)
mean((amostra - mean(amostra))^3)

# assimetria negativa
amostra <- rbeta(1000, shape1 = 10, shape2 = 1) * 100
hist(amostra)
skewness(amostra)
mean(amostra < mean(amostra))

tamanhos <- c(
  15, 
  25,
  seq(from = 30, to = 100, by = 10),
  150,
  seq(from = 200, to = 1000, by = 100)
)

n <- 10000
g <- 0.90
lower <- tamanhos |>
  map_dbl(\(tam) {
    seq_len(n) |>
      map_dbl(~ BowleySkew(rnorm(tam))) |>
      quantile(probs = (1 - g) / 2)
  })

upper <- tamanhos |>
  map_dbl(\(tam) {
    seq_len(n) |>
      map_dbl(~ BowleySkew(rnorm(tam))) |>
      quantile(probs = (1 + g) / 2)
  })
df <- tibble(tamanhos, lower, upper)
df


# table function ----------------------------------------------------------


tabela <- function(tamanhos, f, g = 0.90, n = 10000) {

  lower <- tamanhos |>
    map_dbl(\(tam) {
      seq_len(n) |>
        map_dbl(~ {{f}}(rnorm(tam))) |>
        quantile(probs = (1 - g) / 2)
    })
  
  upper <- tamanhos |>
    map_dbl(\(tam) {
      seq_len(n) |>
        map_dbl(~ {{f}}(rnorm(tam))) |>
        quantile(probs = (1 + g) / 2)
    })
  
  df <- tibble(tamanhos, lower, upper)
  df
}
tabela(tamanhos, kurtosis)

# escolas -----------------------------------------------------------------

set.seed(12345)

tam <- 150

df_a <- tibble(escola_a = round(rnorm(tam, mean = 160, sd = 10), 2))
write_xlsx(df_a, "slides/dados/brutos/escola_a.xlsx")
write_csv(df_a, "dados/brutos/escola_a.csv")
write_xlsx(df_a, "dados/brutos/escola_a.xlsx")

df_b <- tibble(escola_b = round(rnorm(tam, mean = 160, sd = 10), 2))
write_xlsx(df_b, "slides/dados/brutos/escola_b.xlsx")
write_csv(df_b, "dados/brutos/escola_b.csv")
write_xlsx(df_b, "dados/brutos/escola_b.xlsx")

df_c <- tibble(escola_c = round(rnorm(tam, mean = 140, sd = 10), 2))
write_xlsx(df_c, "slides/dados/brutos/escola_c.xlsx")
write_csv(df_c, "dados/brutos/escola_c.csv")
write_xlsx(df_c, "dados/brutos/escola_c.xlsx")

