#packages used
library(lvplot)
library(latex2exp)
library(truncdist)
library(tidyverse)

#Mean

#example mean -- turma 1 de estatística aplicada à saúde


#checking  the distribution of notas
x <- seq(from=0,to=1,by=0.001)
y <- dbeta(x,shape1 = 12, shape2 = 5)
tibble(x=x,y=y) %>%
  ggplot()+
  geom_line(aes(x,y), color='blue')

set.seed(54321) #fixing the seed
notas <- (rbeta(10, 10,5) * 10) %>% round(2)
mean(notas)

#exemplo erros de página
tibble(x = 0:4, freq = c(25,20,3,1,1)) %>%
  ggplot() +
  geom_bar(aes(x=x, y=freq), 
           stat = 'identity', fill = "blue")+
  theme_minimal() +
  xlab('Erros de impressão') +
  ylab('Frequência')
ggsave('erros_livro.png')
ggsave('erros_liivro.pdf')

#exemplo de motivação para medidas de dispersão
x <- 3:7
mean((x-mean(x))^2)
mean(abs(x-mean(x)))
y <- seq(from=1,to=9,by=2)
mean((y-mean(y))^2)
mean(abs(y-mean(y)))
z <- rep(5,5)
mean((z-mean(z))^2)
mean(abs(z-mean(z)))
w <- c(4,5,5,5,6)
mean((w-mean(w))^2)
mean(abs(w-mean(w)))


#exemplo medidas de dispersão
set.seed(54321) #fixing the seed
notas <- (rbeta(5, 10,5) * 10) %>% round(2)
mean(notas)
mean(abs(notas - mean(notas)))
mean((notas - mean(notas))^2)
sqrt( mean((notas - mean(notas))^2) )

#rapid digitation -  número de filhos
z <- 0:5
freq_z <- c(20,5,7,3,0,1)
media <- round( sum( z*freq_z ) / 36, 2)
sum(freq_z * abs(z-media)) / 36
sum(freq_z * (z-media)^2) / 36
sqrt(sum(freq_z * (z-media)^2) / 36)
str_c(freq_z,'\\cdot \\left\\vert',z,'-', media, '\\right\\vert+', collapse = '')
str_c(freq_z,'\\cdot (',z,'-', media, ')^2+', collapse = '')

#rapid digitation -- salario
s <- seq(from = 6, to = 22, by = 4)
freq_s <- c(10,12,8,5,1)
media <- round(sum(s*freq_s) / 36, 2)
sum(freq_s * abs(s-media))  /36
sum(freq_s * (s-media)^2)  /36
sqrt( sum(freq_s * (s-media)^2)  /36 )
str_c(freq_s,'\\cdot \\left\\vert',s,'-', media, '\\right\\vert+', collapse = '')
str_c(freq_s,'\\cdot (',s,'-', media, ')^2+', collapse = '')

#exemplo quantis
x <- c(15, 5, 3, 8, 10, 2, 7, 11, 12)
str_c('x_{(1)} \\quad \\leq \\quad',sort(x),
      'x_{(',1:length(x),')}', '\\quad \\leq \\quad ', collapse = '')

#Ideia quartil
set.seed(54321) #fixing seed
n <- 1e+4+1
x <- rnorm(n,mean = 0, sd = 0.1)
y <- rnorm(n, mean = 0, sd = 1)
dados <- tibble(id = c(rep('Variável 1',n), rep('Variável 2',n)),
       y = c(x,y)) 

#calculando quantis segundo meu slide
quantil <- function(x,p)
{
  n <- length(x)
  if (is.integer((n+1)*p)) {
    y <- sort(x)
    return(y[(n+1)*p])
  }
  else{
    p1 <- floor((n+1)*p)
    p2 <- ceiling((n+1)*p)
    y <- sort(x)
    return( (y[p1]+y[p2])/2 )
  }
}

q1_x <- quantil(x,0.25)
q3_x <- quantil(x, 0.75)

q1_y <- quantil(y, 0.25)
q3_y <- quantil(y, 0.75)

ggplot(dados)+
  geom_histogram(mapping = aes(x=y, fill=id, y = ..density..), 
                 alpha = 0.4, binwidth = 0.05) +
  labs(fill='Legenda')+
  scale_color_manual(values=c("red", "blue"))+
  geom_vline(xintercept = q1_x, color = 'red', 
             linetype = 'dotted', size = 1.5, alpha = 0.6)+
  annotate(geom="text", x=q1_x-0.2, y=2, label='q1',
           color="red", parse = T)+
  geom_vline(xintercept = q3_x, color = 'red', 
             linetype='dotted', size = 1.5, alpha = 0.6)+
  annotate(geom="text", x=q3_x+0.2, y=2, label='q3',
           color="red", parse = T)+
  geom_vline(xintercept = q1_y, color = 'blue', 
             linetype = 'dashed', size = 1.5, alpha = 0.6)+
  annotate(geom="text", x=q1_y-0.2, y=2, label='q1',
           color="blue", parse = T)+
  geom_vline(xintercept = q3_y, color = 'blue', 
             linetype='dashed', size = 1.5, alpha = 0.6)+
  annotate(geom="text", x=q3_y+0.2, y=2, label='q3',
           color="blue", parse = T)+
  theme_minimal()+
  xlab('')+
  ylab('Densidade de Frequencia')
ggsave('motivacao_dq.png')
ggsave('motivacao_dq.pdf')

#contas exercício 1
s <- seq(from = 6, to = 22, by = 4)
freq_s <- c(10,12,8,5,1)
p_s <- numeric(0)
for(i in 1:5) p_s <- c(p_s, rep(s[i], freq_s[i]))
p_s <- sort(p_s)
#primeiro quartil
quantil(p_s,0.25)
quantil(p_s,0.5)
quantil(p_s,0.75)

#Exercício 2
x <- c(4.4, 5.2, 5.3, 5.6, 6.1, 6.4, 7.6, 7.6, 8.0, 8.1, 8.2, 8.9, 9.0, 9.1, 9.8)
quantil(x, 0.9)
mean(x)
(x-mean(x)) %>% abs() %>% mean()
(x-mean(x))^2 %>% mean()
(x-mean(x))^2 %>% mean() %>% sqrt()

#Exercicio 3
x <- c(1125.4, 632, 267.6, 257, 245.2, 235.5, 180.2, 175.5, 
       153.8, 140.9, 139.3, 130.2, 122.2, 108, 100)
quantil(x,0.25)
quantil(x,0.5)
quantil(x,0.75)
mean(x)
(x-mean(x)) %>% abs() %>% mean()
(x-mean(x))^2 %>% mean()
(x-mean(x))^2 %>% mean() %>% sqrt()

#boxplot
x <- c(15, 5, 3, 8, 10, 2, 7, 11, 12)
q1 <- quantil(x, 0.25)
q2 <- quantil(x, 0.5)
q3 <- quantil(x, 0.75)
dq <- q3-q1
LS <- q3 + 1.5 * dq
LI <- q3 - 1.5 * dq
tibble(x = "X", q1 = q1, q2 = q2, q3 = q3,
     dq = dq, LI = LI, LS = LS) %>% 
  ggplot()+
  geom_boxplot(aes(x = x,
                   ymin = LI,
                   ymax = LS,
                   middle = q2,
                   lower = q1, upper = q3),
               stat = "identity", width = 0.1) +
  theme_minimal() +
  scale_x_discrete(breaks = NULL) +
  scale_y_continuous(breaks = c(LI, q1, q2, q3, LS)) +
  labs(x = "", y = "")
ggsave('boxplot.png')

# tibble(x=x) %>%
#   ggplot()+
#   geom_boxplot(aes(x='X',lower = q1, 
#                    middle = q2, upper = q3,
#                    ymin=LI, ymax = LS), stat = 'identity')+
#   xlab('') + ylab('') + coord_flip()
# ggsave('boxplot.png')

#Medidas de assimetria
#Turma 1
n <- 19
set.seed(5431)
x <- round( 10 * rbeta(n, 17, 2),2)
q1 <- quantil(x, 0.25)
q2 <- quantil(x,0.5)
q3 <- quantil(x, 0.75)
LS <- q3 + 1.5 * (q3-q1)
LI <- q1 - 1.5 * (q3-q1) 
# boxplot
tibble(x = "Turma 1", q1 = q1, q2 = q2, q3 = q3,
       lower = LI, upper = LS) %>% 
  ggplot() +
  geom_boxplot(mapping = aes(x=x,lower = q1, middle = q2,
                             upper = q3, ymax = LS, ymin = LI),
               stat = 'identity', width = 0.1) +
  xlab('') + ylab('Notas dos alunos')+
  theme_minimal()+
  scale_y_continuous(breaks=c(LI, q1, q2, q3, LS)) +
  theme(axis.title = element_text(size=20),
        axis.text = element_text(size=15))
ggsave('asim_boxplot_turma_1.png')

# tibble(x=x) %>%
#   ggplot()+
#   geom_boxplot(mapping = aes(x='Turma 1',lower = q1, middle = q2,
#                              upper = q3, ymax = LS, ymin = LI),
#                stat = 'identity')+
#   xlab('') + ylab('Notas dos alunos')+
#   scale_y_continuous(breaks=c(LI, q1, q2, q3, LS))+
#   theme(axis.title = element_text(size=20),
#         axis.text = element_text(size=15, angle=90))+
#   coord_flip()
# ggsave('asim_boxplot_turma_1.png')

# Histograma
y <- x %>%
  tibble() %>%
  group_by(cut(x,breaks = seq(from = 7, to = 10, by = 0.5))) %>%
  summarise(freq=n()) %>%
  mutate(den = round(freq /(0.5 * sum(freq)),4))


tibble(x) %>%
  ggplot()+
  geom_histogram(mapping = aes(x = x, y = ..density..),
                 breaks = seq(from = 7, to = 10, by = 0.5),
                 alpha = 0.7, fill = 'blue')+
  # geom_line(aes(x=x,y = ..density.., colour = 'Empirical'), 
  #           stat = 'density', size = 2, color = 'blue')+
  xlab('Notas') + ylab('Densidade de frequência')+
  geom_vline(xintercept = q1, color = 'red', size = 2)+
  geom_vline(xintercept = q2, color = 'red',size = 2)+
  geom_vline(xintercept = q3, color = 'red', size = 2) +
  annotate('text',x=q1-0.1, y = 0.75,
           label = as.character(paste(expression(q[1]))),
           parse = T, color = 'red', size = 5)+
  annotate('text',x=q2-0.1, y = 0.75,
           label = as.character(paste(expression(q[2]))),
           parse = T, color = 'red', size = 5)+
  annotate('text',x=q3-0.1, y = 0.75,
           label = as.character(paste(expression(q[3]))),
           parse = T, color = 'red', size = 5)+
  theme_minimal()+
  scale_x_continuous(breaks = seq(from = 7.5, to = 10, by = 0.5)) +
  scale_y_continuous(breaks=y$den)+
  theme(axis.title = element_text(size=20),
        axis.text = element_text(size=15))
ggsave('asim_histogram_turma_1.png')


#Turma 2
n <- 19
set.seed(12345)
# x <- round( 10 * rbeta(n, 17, 10),2)
x <- rtrunc(19,spec = 'lnorm',a=0,b=10, mean = 0.5, sd=1) %>% round(2)
q1 <- quantil(x, 0.25)
q2 <- quantil(x,0.5)
q3 <- quantil(x, 0.75)
LS <- q3 + 1.5 * (q3-q1)
LI <- q1 - 1.5 * (q3-q1) 
tibble(x = "Turma 2", LI = LI, LS = LS, q1 = q1,
       q2 = q2, q3 = q3) %>% 
  ggplot() +
  geom_boxplot(mapping = aes(x='Turma 2',lower = q1, middle = q2,
                             upper = q3, ymax = LS, ymin = LI),
               stat = 'identity', width = 0.1) +
  xlab('') + ylab('Notas dos alunos') +
  geom_point(aes(x='Turma 2', y = 8.93)) +
  theme_minimal() +
  scale_y_continuous(breaks=c(LI, q1, q2, q3,LS,8.93))+
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 15))
ggsave('asim_boxplot_turma_2.png')

# # boxplot
# tibble(x=x) %>%
#   ggplot()+
#   geom_boxplot(mapping = aes(x='Turma 2',lower = q1, middle = q2,
#                              upper = q3, ymax = LS, ymin = LI),
#                stat = 'identity')+
#   xlab('') + ylab('Notas dos alunos')+
#   geom_point(aes(x='Turma 2', y = 8.93))+
#   scale_y_continuous(breaks=c(LI, q1, q2, q3,LS,8.93))+
#   theme(axis.title = element_text(size = 20),
#         axis.text = element_text(size = 15, angle = 90))+
#   coord_flip()
# ggsave('asim_boxplot_turma_2.png')

# Histograma
h <- 1.5
densidade_frequencia <- x %>% tibble() %>%
  group_by(cut(x,breaks = seq(from = 0, to = 10, by = h))) %>%
  summarise(freq=n()) %>%
  mutate(dens = round(freq/(h * n),4))
tibble(x) %>%
  ggplot()+
  geom_histogram(mapping = aes(x = x, y = ..density..),
                 breaks = seq(from = 0, to = 10, by = h),
                 alpha = 0.7, fill = 'blue')+
  # geom_line(aes(x=x,y = ..density.., colour = 'Empirical'), 
  #           stat = 'density', size = 2, color = 'blue')+
  xlab('Notas') + ylab('Densidade de frequência')+
  geom_vline(xintercept = q1, color = 'red', size = 2)+
  geom_vline(xintercept = q2, color = 'red',size = 2)+
  geom_vline(xintercept = q3, color = 'red', size = 2) +
  annotate('text',x=q1-0.25, y = 0.75,
           label = as.character(paste(expression(q[1]))),
           parse = T, color = 'red', size = 5)+
  annotate('text',x=q2-0.25, y = 0.75,
           label = as.character(paste(expression(q[2]))),
           parse = T, color = 'red', size = 5)+
  annotate('text',x=q3-0.25, y = 0.75,
           label = as.character(paste(expression(q[3]))),
           parse = T, color = 'red', size = 5)+
  theme_minimal() +
  scale_x_continuous(breaks = seq(from = 0, to = 10, by = h))+
  scale_y_continuous(breaks=densidade_frequencia$dens)+
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 15))
ggsave('asim_histogram_turma_2.png')
