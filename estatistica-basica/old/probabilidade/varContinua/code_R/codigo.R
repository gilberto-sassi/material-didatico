# Gráficos

# packages used
library(latex2exp)
library(tidyverse)

# fixing the seed for reproducibility
set.seed(1235813)

# Binomial distribuição
n <- 50
x1 <- 0:(n - 1)
dx1 <- pbinom(0:(n - 1), n, 0.3)
x2 <- 1:n
dx2 <- pbinom(1:n, n, 0.3)
y <- seq(from = 0, to = n, by = 0.01)
dy <- pnorm(y, mean = n * 0.3, sd = sqrt(n * 0.3 * 0.7))
tibble(x1, dx1, x2, dx2) %>% 
  ggplot() +
  geom_segment(aes(x = x1, y = dx1, xend = x2, yend = dx1), color = 'blue') +
  geom_line(data = tibble(y, dy),
            aes(y, dy), color = 'red') +
  labs(y = 'Função de distribuição acumulada', x = 'X') +
  theme_minimal() +
  scale_x_continuous(breaks = seq(from = 0, to = n, by = 5))+
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 10))
ggsave('aproximacao.pdf', width = 12, height = 8)


# normal density

x <- seq(from = -10, to = 10, by = 0.001)
dd <- tibble(x = x,
             y_1 = dnorm(x, mean = 0, sd = 1),
             y_2 = dnorm(x, mean = 0, sd = 2),
             y_3 = dnorm(x, mean = 0, sd = 3))
ggplot(dd)+
  geom_line(aes(x, y_1), color = "blue")+
  annotate("text", x = 0 + 1.7, y = dnorm(0, mean = 0, sd = 1) +0.015,label =  TeX("$\\sigma^2=1$"),
           size = 7.5)+
  geom_line(aes(x, y_2), color = "red")+
  annotate("text", x = 0 + 1.7, y = dnorm(0, mean = 0, sd = 2) + 0.015 ,label =  TeX("$\\sigma^2=4$"),
           size = 7.5)+
  geom_line(aes(x, y_3), color = "brown") +
  annotate("text", x = 0 + 6.3, y = dnorm(0, mean = 0, sd = 3) - 0.08,label =  TeX("$\\sigma^2=9$"),
           size = 7.5)+
  geom_vline(xintercept = 0, color = "black") +
  theme_minimal() +
  labs(x = "x", y = "f(x)") +
  scale_x_continuous(breaks = 0, labels = expression(mu)) +
  scale_y_continuous(labels = NULL) +
  theme(axis.title = element_text(size = 25),
        axis.text = element_text(size = 20))
ggsave("normal.png")

x <- seq(from = 1e-8, to = 2.5, by = 0.001)
y <- dexp(x, rate = 2)
tibble(x, y) %>% 
  ggplot()+
  geom_line(aes(x, y), color = "blue", size = 1) +
  labs(x = "x", y = "f(x)")+
  theme_classic() +
  scale_y_continuous(breaks = 2,
                     labels = expression(alpha)) +
  scale_x_continuous(breaks = 0) +
  theme(axis.text = element_text(size = 25),
        axis.title = element_text(size = 30)) 
ggsave("exp.png")


# Tabela da distribuição normal -------------------------------------------

z_pos <- seq(from = 0.0, to = 3.9, by = 0.1) %>% 
  sapply(function(i){
    tt <- seq(from = 0.00, to = 0.09, by = 0.01) %>%
      map_dbl(~ pnorm(.x + i) %>% round(4))
    names(tt) <- seq(from = 0.00, to = 0.09, by = 0.01) %>% str_c()
    tt
  }) %>% t()
rownames(z_pos) <- seq(from = 0.0, to = 3.9, by = 0.1) %>% str_c()
write.table(z_pos, "z_pos.csv", sep = ";", dec = ",")

z_neg <- seq(from = 0.0, to = 3.9, by = 0.1) %>% 
  sapply(function(i){
    tt <- seq(from = 0.00, to = 0.09, by = 0.01) %>%
      map_dbl(~ pnorm(-1 * (.x + i)) %>% round(4))
    names(tt) <- (-1 * seq(from = 0.00, to = 0.09, by = 0.01)) %>% str_c()
    tt
  }) %>% t()
rownames(z_neg) <- (-1 * seq(from = 0.0, to = 3.9, by = 0.1)) %>% str_c()
write.table(z_neg, "z_neg.csv", sep = ";", dec = ",")
