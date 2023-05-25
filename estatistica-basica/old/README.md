# Métodos estatísticos (MAT-236)

Material didático para métodos estatísticos -- mat236. Associado a este material, existe o pacote `r power` para calcular o poder do teste e tamanho de amostra.

Os exemplos, conceitos e definições foram extraídos dos seguintes livros-texto:


* MONTGOMERY, Douglas C.; RUNGER, George C. **Applied statistics and probability for engineers**. John Wiley & Sons, 2010.
* MORETTIN, Pedro Alberto; BUSSAB, WILTON OLIVEIRA. **Estatística básica**. Saraiva Educação SA, 2017.
* MAGALHÃES, Marcos Nascimento; DE LIMA, Antonio Carlos Pedroso. **Noções de probabilidade e estatística**. Editora da Universidade de São Paulo, 2002.

# Programa do curso

* Estatística descritiva
    * Medidas de resumo: média, moda, mediana, desvio padrão, desvio médio, quartiis
    * Ggráficos: gráficos de barra, diagrama de caixa (boxplot), histograma
* Probabilidade
    * Conceitos básicos de probabilidade: princípio da equiprobabilidade, probabilidade frequentista, probabilidade subjetiva, probabilidade condicional, regra da multiplicação, teorema da probailidade total, teorema de Bayes, independência
    * Variáveis aleatórias discretas: distribuição uniforme discreto, distribuição Bernoulli, distribuição binomial, distribuição poison
    * Variáveis aleatórias contínuas: distribuição uniforme, distribuição exponencial, distribuição normal, aproximação da distribuição usando distribuição normal, teorema do limite central
* Intervalo de confiança
    * Para média para uma variável aleatória normal com variância conhecida
    * Para média para uma variável aleatória normal com variância desconhecida
    * Para variância para uma variância aleatória
    * Para média para uma variável aleatória exponencial
* Intervalo de confiança assintótico (amostras com mais de 40 observações)
    * Para proporção
    * Para média
* Teste de Hipóteses (poder do teste e tamanho de amostra):
    * Conceitos básicos: definição de hipótese nula e alternativa, nível de significância, poder do teste, rro do tipo II, erro tipo I, especificidade, sensibilidade, valor-p, procedimento de Neyman-Pearson
    * Testes para uma população ou variável
        * teste Z (com variância conhecida) sobre a média: teste bilateral e teste unilateral (distribuição normal)
        * teste t (com variância desconhecida) sobre a média: teste bilateral e teste unilateral (distribuição normal)
        * teste qui-quadrado sobre a variância: teste bilateral e teste unilateral (distribuiçao normal)
        * teste sobre proporção: teste bilateral e teste unilateral (amostras com mais de 40 observações)
    * Checando a normalidade: histograma, gráficos de quantis, gráficos de probabilidade normal, teste Kolmogorov-Smirnov
    * Teste para duas populações ou variáveis (poder do teste, tamanho de amostra e intervalo de confiança)
        * Teste para diferença de médias para duas distribuições normais com variâncias conhecidas e independentes
        * Teste para a razão das variâncias para duas distribuições normais e independentes
        * Teste para diferença de médias para duas distribuições normais com desconhecidas e iguais e independentes
        * Teste para diferença de médias para duas distribuições normais com desconhecidas e diferentes e independentes
        * Teste t pareado 
        * Teste para diferença de proporções para amostras com mais de 40 observações
    * Teste de associação entre duas variáveis qualitativas (poder do teste e tamanho de amostra)
    * Teste de associação entre duas variáveis quantitativas (transformação Z de Fisher no coeficiente de correlação linear de Fisher): teste bilateral, teste unilateral, e intervalo de confiança para o coeficiente de correlação linear de Pearson
    * Análise de Variância para estudos completamente aleatórios e balanceados (poder do teste e tamanho de amostra)
    * Análise de Variância para estudos completamente aleatórios e não balanceados (poder do teste)
* Regressõa linear simples:
    * Estimativa de mínimos quadrados para a inclinação e o intercepto 
    * Testes de hipóteses para a inclinação e o intercepto
    * Intervalo de confiança para a inclinação e o intercepto
    * Intervalo de confiança para a predição da variável resposta
    * Anaĺise de variância
    * Análise de resíduos