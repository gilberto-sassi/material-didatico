#goodman and kruskal examples

#packages used
library(tidyverse)
library(tmvtnorm)
library(DescTools)

#example 1
set.seed(229526)
n <- 2000
m_corr <- rbind(c(1,-0.85),
               c(-0.85,1))
media <- c(0,0)
m <- rtmvnorm(n,mean = media, sigma = m_corr, 
              lower = c(-1,-1), 
              upper = c(1,1))
table <- tibble(x=m[,1], y = m[,2]) %>%
  transmute(v1 = cut(x, breaks=c(-1,-2/3,2/3,1)),
            v2 = cut(y, breaks=c(-1,-2/3,2/3,1))) %>%
  group_by(v1, v2) %>%
  summarise(contagem=n()) %>%
  spread(key = v2, value = contagem) 
  
m <- cbind(table$`(-1,-0.667]`, table$`(-0.667,0.667]`, table$`(0.667,1]`)
rownames(m) <- c("Insatisfeito", "Satisfeito","Muito insatisfeito")
colnames(m) <- c("Muito devagar", "Dentro do esperado", "Muito rápido")
xtable(m)

GoodmanKruskalGamma(m)

#example 2
set.seed(229526)
n <- 100000
m_corr <- rbind(c(1,0.85),
                c(0.85,1))
media <- c(0,0)
m <- rtmvnorm(n,mean = media, sigma = m_corr, lower = c(-1,-1), upper = c(1,1))
table <- tibble(x=m[,1], y = m[,2]) %>%
  transmute(v1 = cut(x, breaks=c(-1,-2/3,2/3,1)),
            v2 = cut(y, breaks=c(-1,-2/3,2/3,1))) %>%
  group_by(v1, v2) %>%
  summarise(contagem=n()) %>%
  spread(key = v2, value = contagem) 

m <- cbind(table$`(-1,-0.667]`, table$`(-0.667,0.667]`, table$`(0.667,1]`)
rownames(m) <- c("A", "B", "c")
colnames(m) <- c("Ens Fundamental", "Ens Medio", "Ens Completo")
xtable(m)

GoodmanKruskalGamma(m)

#example 3
set.seed(229526)
n <- 1000
m_corr <- rbind(c(1,0.005),
                c(0.005,1))
media <- c(0,0)
m <- rtmvnorm(n,mean = media, sigma = m_corr, lower = c(-1,-1), upper = c(1,1))
table <- tibble(x=m[,1], y = m[,2]) %>%
  transmute(v1 = cut(x, breaks=c(-1,-2/3,2/3,1)),
            v2 = cut(y, breaks=c(-1,-2/3,2/3,1))) %>%
  group_by(v1, v2) %>%
  summarise(contagem=n()) %>%
  spread(key = v2, value = contagem) 

m <- cbind(table$`(-1,-0.667]`, table$`(-0.667,0.667]`, table$`(0.667,1]`)
rownames(m) <- c("Nenhum", "Básico","Avançado")
colnames(m) <- c("Até 1 hora", "Entre 1 e 2 horas", "Mais de 2 horas")
xtable(m)

GoodmanKruskalGamma(m)

