if (!require(pacman)) install.packages(pacman)
library(pacman)
p_load(readxl, writexl, readODS)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(DescTools)
p_load(mvtnorm)
p_load(tidyverse)

#------------------------------------------------------------------------------
# simulação de variáveis qualitativas ordinais

p <- 0.95
tam <- 100

media <- c(0, 0)
mcov <- rbind(
    c(1, p),
    c(p,1)
)
matriz <- rmvnorm(tam, media, mcov)

dados <- tibble(
    x = matriz[, 1] |>
        map_chr(\(x) {
            if (x < qnorm(1 / 3)) {
                return("A1")
            } else if (qnorm(1 / 3) <= x & x < qnorm(2 / 3)) {
               return("A2")
            } else if (x >= qnorm(2 / 3)) {
               return("A3")
            }
        }),
    y = matriz[, 2]  |>
        map_chr(\(x) {
            if (x < qnorm(1 / 3)) {
                return("B1")
            } else if (qnorm(1 / 3) <= x & x < qnorm(2 / 3)) {
               return("B2")
            } else if (x >= qnorm(2 / 3)) {
               return("B3")
            }
        })
) |>
    mutate(
        x = fct(x, levels = c("A1", "A2", "A3")),
        y = fct(y, levels = c("B1", "B2", "B3"))
    )

DescTools::GoodmanKruskalGamma(dados$x, dados$y)

ajuste <- chisq.test(dados$x, dados$y)
ajuste
ajuste$observed
ajuste$expected
ajuste$statistic

write_xlsx(dados, "analise-de-dados/dados/brutos/dados_goodman_kruskal.xlsx")

write_xlsx(dados, "analise-de-dados/slides-eda/dados/brutos/dados_goodman_kruskal.xlsx")