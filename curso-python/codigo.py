import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from pandas import Series, DataFrame

nu_nota_lc = Series([461.9, 528.5, 413.9, 516.2, 679.3], index=[210058894852, 210060690421, 210061408626, 210058862425, 210059157480])
nu_nota_ch = Series([344.6, 612.2, 359.2, 496.9, 681.7], index=[210058894852, 210060690421, 210061408626, 210058862425, 210059157480])
dados = DataFrame({
  'nu_nota_lc': nu_nota_lc,
  'nu_nota_ch': nu_nota_ch
})
dados.index.name = 'matrícula'

################################
# teste para faixa de valores

# definindo os breakpoints
amostra_51 = pd.read_csv("dados/brutos/amostra_51.csv")

intervalo = np.arange(0, 1001, 100)
amostra_51['faixa_nu_nota_cn'] = pd.cut(
  amostra_51['nu_nota_cn'],
  bins = intervalo,
  right = False,
  include_lowest = True,
  labels = [
    "de 0 a 99,99",
    "de 100 a 199,99",
    "de 200 a 299,99",
    "de 300 a 399,99",
    "de 400 a 499,99",
    "de 500 a 599,99",
    "de 600 a 699,99",
    "de 700 a 799,99",
    "de 800 a 899,99",
    "de 900 a 1000",
  ]
)
amostra_51.faixa_nu_nota_cn

# usando a regra de sturge
k = np.ceil(1 + np.log2(amostra_51.shape[0]))
k = k.astype(np.int64)
amostra_51['faixa_nu_nota_cn'] = pd.cut(
  amostra_51['nu_nota_cn'],
  bins = k,
  right = False,
  include_lowest = True
)
amostra_51.faixa_nu_nota_cn.value_counts()

##############################################
# gráficos


amostra_51 = pd.read_csv("dados/brutos/amostra_51.csv")

fig, ax = plt.subplots(figsize=(7, 5))
sns.histplot(data=amostra_51, x="nu_nota_lc", stat='percent', bins=np.arange(0, 1001, 50), color = "blue", ax=ax)
ax.set_xlabel('Nota de português')
ax.set_ylabel('Porcentagem')
plt.show()

##############################################
# medidas de resumo

amostra_51 = pd.read_csv("dados/brutos/amostra_51.csv")

amostra_51.agg({'nu_nota_mt': 'mean', 'nu_nota_lc': 'median'})

def tab_freq(data, coluna):
  frequencia = data[coluna].value_counts()
  freq_rel = data[coluna].value_counts(normalize=True)
  porcentagem = data[coluna].value_counts(normalize=True) * 100
  tabela = DataFrame({
    'frequência': frequencia,
    'frequência relativa': freq_rel,
    'porcentagem': porcentagem
    }).sort_index()
  return tabela

tab_freq(amostra_51, 'q005')

def mediana(x):
  return np.median(np.array(x))

carros['vazio'] = ''
carros.groupby('forma').agg({'marchas': mediana})
carros.groupby('vazio').agg({'marchas': mediana})

carros.agg(['mean', mediana])


# Sample DataFrame
data = {'col1': [1, 2, 3, 4, 5],
        'col2': [6, 7, 8, 9, 10],
        'col3': [11, 12, 13, 14, 15]}
df = pd.DataFrame(data)

# Custom Metric (Coefficient of Variation)
def coefficient_of_variation(series):
    return series.std() / series.mean() if series.mean() != 0 else np.nan

def mediana(x):
  valor = np.median(x.to_numpy())
  return valor

# Using a dictionary with agg
aggregated_stats_dict = df.agg({
    'col1': ['mean', 'median'],  # Apply mean and median to col1
    'col2': ['mean', coefficient_of_variation],  # Apply mean and CV to col2
    'col3': ['sum', mediana]  # Apply sum to col3
})

print(aggregated_stats_dict)

### gráfico de barras com label

