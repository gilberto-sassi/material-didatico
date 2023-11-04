library(pacman)

p_load(
  readxl, writexl, e1071, lettervalue, KbMvtSkew,
  scales, patchwork,
  dados,
  janitor,
  psycho,
  DescTools, tidyverse
)


# gráfico de barras -------------------------------------------------------

# com associação

df <- tibble(
  tabagismo = c("Não-fumante", "Fumante"),
  sim = c(0, 100),
  nao = c(200, 0)
)
df <- df |>
  pivot_longer(cols = c("sim", "nao"), names_to = "cancer",
               values_to = "frequencia")

ggplot(df) +
  geom_bar(aes(x = tabagismo, y = frequencia, fill = cancer), stat = "identity", position = "fill") +
  scale_fill_discrete(name = "Câncer") +
  scale_y_continuous(labels = label_percent()) +
  labs(x = "Tabagismo", y = "Frequência") +
  theme_minimal()

ggplot(df) +
  geom_bar(aes(x = tabagismo, y = frequencia, fill = cancer), stat = "identity", position = "dodge") +
  scale_fill_discrete(name = "Câncer") +
  scale_y_continuous(labels = label_percent()) +
  labs(x = "Tabagismo", y = "Frequência")

# sem associação

df <- tibble(
  tabagismo = c("Não-fumante", "Fumante"),
  homem = c(80, 120),
  mulher = c(40, 60)
)
df <- df |>
  pivot_longer(cols = c("homem", "mulher"), names_to = "Gênero",
               values_to = "frequencia") |> 
  mutate(`Gênero` = fct(`Gênero`) |> 
           fct_recode("Homem" = "homem", "Mulher" = "mulher"))

g1 <- ggplot(df) +
  geom_bar(aes(x = tabagismo, y = frequencia, fill = `Gênero`), stat = "identity", position = "fill") +
  scale_fill_discrete(name = "Câncer") +
  scale_y_continuous(labels = label_percent()) +
  labs(x = "Tabagismo", y = "Frequência") +
  theme_minimal()

g2 <- ggplot(df) +
  geom_bar(aes(x = tabagismo, y = frequencia, fill = `Gênero`), stat = "identity", position = "dodge") +
  scale_fill_discrete(name = "Câncer") +
  labs(x = "Tabagismo", y = "Frequência") +
  theme_minimal()

g1 + g2


# medidas de associação ---------------------------------------------------


dados_casas <- read_xlsx("dados/brutos/casas.xlsx")

dados_casas |> 
  summarise(
    cont_coef = ContCoef(fundacao_tipo, geral_condicao),
    cramer_v = CramerV(fundacao_tipo, geral_condicao),
  )


# goodman kruskal gamma ---------------------------------------------------

# write_csv2(df_ordinal, "dados/brutos/psicologia.csv")

df_ordinal <- read_csv2("dados/brutos/psicologia.csv")

glimpse(df_ordinal)

df_ordinal <- df_ordinal |>
  mutate_at(vars(matches(".\\d+")), \(x) {
    fct(
      as.character(x),
      levels = paste(0:5)
    )
  })

table(df_ordinal$A1, df_ordinal$A2)

df_ordinal |> 
  summarise(
    gk = GoodmanKruskalGamma(A1, A2)
  )

GoodmanKruskalGamma(df_ordinal$A1, df_ordinal$A2, conf.level = 0.95)


# R2 ----------------------------------------------------------------------

salvador <- read_excel("dados/brutos/salvador.xlsx")

df_iris <- clean_names(dados_iris)
glimpse(df_iris)

r2 <- function(data, x, y) {
  tab <- group_by(data, {{x}}) |>
    summarise(
      var = var({{y}}),
      freq = n()
    )
  var_bar <- sum(tab$var * tab$freq) / sum(tab$freq)
  var_bar
  
  1 - var_bar / summarise(data, s2 = var({{y}}))$s2
}

r2(df_iris, especies, comprimento_sepala)

summary(lm(comprimento_sepala ~ especies, data = df_iris))$r.squared

summary(lm(comprimento_sepala ~ especies, data = df_iris))$adj.r.squared


# associacao --------------------------------------------------------------

companhia <- read_excel("dados/brutos/companhia_MB.xlsx")
glimpse(companhia)

ggplot(salvador) +
  geom_boxplot(aes(x = tp_cor_raca, y = nu_nota_mt))

summary(lm(nu_nota_mt ~ tp_cor_raca, data = salvador))$adj.r.squared
r2(salvador, tp_cor_raca, nu_nota_mt)
