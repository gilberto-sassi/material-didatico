library(tidyverse)

dados <- tibble(x = c('Ensino fundamental',
                      'Ensino médio',
                      'Ensino superior'),
                y = c(12,18,6))


ggplot(data = dados)+
  geom_bar(mapping = aes(x=x, y = y), 
           stat = 'identity', fill = "blue") +
  xlab('Escolaridade') +
  ylab('Frequência') +
  theme_minimal()+
  scale_y_continuous(breaks = c(12,18,6))+
  theme(axis.text = element_text(size = 15),
        axis.title = element_text(size = 20))
ggsave('escolaridade.png', width = 7.5)



# ggplot(dados, aes(x="", y=y, fill=x))+
#   geom_bar(width = 1, stat = "identity")+
#   coord_polar("y", start=0) +
#   xlab('') + ylab('') +
#   scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"), 
#                     name="Escolaridade") +
#   theme(legend.title = element_text(size = 20),
#         legend.text = element_text(size = 15))
# ggsave('setores_escolaridade.png')

tibble(x = 0:5,
       y = c(20,5,7,3,0,1)) %>%
  ggplot()+
  geom_bar(mapping = aes(x=x, y=y), 
           stat = 'identity', fill = "blue")+
  ylab('Frequência')+
  theme_minimal() +
  scale_x_continuous(name = "Número de filhos",
                   breaks = 0:5)+
  scale_y_continuous(breaks = c(20,5,7,3,0,1))+
  theme(axis.text = element_text(size = 15),
        axis.title = element_text(size = 20)) 
ggsave('numero_filhos.png')

tibble(x = seq(from=2,to=22,by=2), y = c(0,0,10,0,12,0,8,0,5,0,1)) %>%
  ggplot()+
  geom_bar(mapping = aes(x=x, y = y), 
           stat = 'identity', fill = "blue")+
  xlab('Salário')+
  ylab('Frequência')+
  theme_minimal() +
  scale_x_continuous(breaks = c(6,10,14,18,22))+
  scale_y_continuous(breaks = c(10,12,8,5,1))+
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 15))
ggsave('salario_bar.png')

dados <- read_delim('tabela21.csv',delim = ';')
tab <- dados %>%
  count(S = cut(salario, breaks = seq(from = 4, to = 24, by = 4), 
                include.lowest = T, right = F)) %>% 
  mutate(f = n / 36, df = f / 4)
ggplot(dados) +
  geom_histogram(mapping = aes(x = salario, y = ..density..), 
                 breaks=seq(from = 4, to = 24, by = 4), closed = "left",
                 fill = "blue")+
  xlab('Salário') +
  ylab('Densidade de frequência') +
  theme_minimal() +
  scale_x_continuous(breaks = seq(from = 4, to = 24, by = 4)) +
  scale_y_continuous(breaks = round(tab$df, 4))+
  theme(axis.text = element_text(size = 15),
        axis.title = element_text(size = 19))
ggsave('histograma.png')
