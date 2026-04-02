library(pacman)

p_load(patchwork, ggthemes, tidyverse)


tam <- 1000
k <- ceiling(1 + log2(tam))
a <- 1
b <- 15
#------------------------------------------------------------------------------
# assimetria positiva
amostra <- rbeta(tam, shape1 = a, shape2 = b)
p1 <- ggplot(tibble(x = amostra)) +
  geom_histogram(aes(x = x, y = after_stat(density)),
                 bins = k, fill = "blue") +
  theme_gdocs() +
  scale_x_continuous(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "",
       title = "Assimetria à direita ou positiva")

p2 <- ggplot(tibble(x = amostra)) +
  geom_boxplot(aes(x = "", y = x), outlier.shape = NA) +
  theme_gdocs() +
  scale_x_discrete(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "", title = "Assimetria à direira ou positiva")

#------------------------------------------------------------------------------
# assimetria negativa
amostra <- rbeta(tam, shape1 = b, shape2 = a)
n1 <- ggplot(tibble(x = amostra)) +
  geom_histogram(aes(x = x, y = after_stat(density)),
                 bins = k, fill = "blue") +
  theme_gdocs() +
  scale_x_continuous(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "",
       title = "Assimetria à esquerda ou negativa")

n2 <- ggplot(tibble(x = amostra)) +
  geom_boxplot(aes(x = "", y = x), outlier.shape = NA) +
  theme_gdocs() +
  scale_x_discrete(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "",
       title = "Assimetria à esquerda ou negativa")

#------------------------------------------------------------------------------
# simetria
amostra <- rbeta(tam, shape1 = 5, shape2 = 5)
s1 <- ggplot(tibble(x = amostra)) +
  geom_histogram(aes(x = x, y = after_stat(density)),
                 bins = k, fill = "blue") +
  theme_gdocs() +
  scale_x_continuous(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "",
       title = "Simetria")

s2 <- ggplot(tibble(x = amostra)) +
  geom_boxplot(aes(x = "", y = x), outlier.shape = NA) +
  theme_gdocs() +
  scale_x_discrete(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "",
       title = "Simetria")

p1 + p2 + n1 + n2 + s1 + s2 + plot_layout(nrow = 3, byrow =  TRUE)

ggsave("boxplot_assimetria.png", width = 15, height = 10)
