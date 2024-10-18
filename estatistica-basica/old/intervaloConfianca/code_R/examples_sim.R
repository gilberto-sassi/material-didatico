#packages used
library(tidyverse)
library(xtable)

#Point estimation -- exponential example
set.seed(12345)
lambda <- 1/180
x <- rexp(10, lambda) %>% round()
tibble(`Tempo até o óbito`=x,
       paciente = str_c("p",1:10)) %>% 
  spread(key = paciente, value = `Tempo até o óbito`) %>%
  xtable(digits = 0, caption = "Tempo (em dias) até óbito.",
         label = "fig:exe_exp",
         align = rep("c",11)) %>%
  print(include.rownames = F, include.colnames = F)


set.seed(12345)
lambda <- 10
x <- rpois(15, lambda) 
tibble(`Número de atendimentos`=x,
       dia = str_c("d",1:15)) %>% 
  spread(key = dia, value = `Número de atendimentos`) %>%
  xtable(digits = 0, caption = "Tempo (em dias) até óbito.",
         label = "fig:ci_pois",
         align = rep("c",16)) %>%
  print(include.rownames = F, include.colnames = F)
xb <- mean(x)
n <- length(x)
z <- 2.58
(lower <- 
  (n*xb + (2*z^2+1)/6  - 0.5 - sqrt( z^2 *(n*xb -0.5 + (z^2+2)/18 ) ) )/n )
(upper <- 
    (n*xb + (2*z^2+1)/6  + 0.5 + sqrt( z^2 *(n*xb +0.5 + (z^2+2)/18 ) ) )/n )
