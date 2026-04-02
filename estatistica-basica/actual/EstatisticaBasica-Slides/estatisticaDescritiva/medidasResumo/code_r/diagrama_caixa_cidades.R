library(pacman)

p_load(patchwork, ggthemes, janitor, googlesheets4, ggthemes, ggeasy, tidyverse)


# carregando os dados -----------------------------------------------------

dados <- read_sheet(
  "https://docs.google.com/spreadsheets/d/172hllYJ1EjMKqapf_HL-zW21pWKgrbDEGNowzkQndpw/edit?usp=sharing"
) |> clean_names()

ggplot(dados, aes(x="", y=populacao_em_milhoes_de_habitantes)) +
  geom_boxplot(aes(lower = -0.395, upper = 5.06, middle = 1.77)) +
  labs(x='', y='População (milhões de habitantes)') +
  theme_gdocs() +
  easy_all_text_size(size=20)
ggsave("grandes_cidades.png", width = 10, height = 10)
