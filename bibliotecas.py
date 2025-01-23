#MATPLOTLIB

import matplotlib.pyplot as plt 

'''Biblioteca fundamental para visualizações em Python.
Fornece controle total sobre o estilo e formato dos gráficos.
É base para muitas outras bibliotecas de visualização, incluindo Seaborn.'''

# Dados
meses = ['Jan', 'Feb', 'Mar', 'Apr', 'May']
nascimentos = [100, 120, 130, 90, 110]

# Criar gráfico de barras
plt.bar(meses, nascimentos, color='skyblue')
plt.title('Nascimentos por Mês')
plt.xlabel('Meses')
plt.ylabel('Quantidade')
plt.savefig("matplotlib.png")
print("Gráfico meses nascimento feito'")

#Gráfico meses e óbitos obtidos

meses = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
mortes = [100, 160, 130, 90, 110, 105, 95, 85, 75, 65, 55, 88]

plt.bar(meses, mortes, color='skyblue')
plt.title('Mortes por Mês')
plt.xlabel('Meses')
plt.ylabel('Quantidade')
plt.savefig("mortespmeses.png")
print("Gráfico meses x mortes feito")

################

#Seaborn
# estatísticas e gráficos de fácil interpretação. Oferece suporte nativo para DataFrames do pandas.
#Gráficos estatísticos sofisticados (e.g., boxplot, heatmap, pairplot).
#Boxplot = gráfico com caixas, Quartis, mediana (Q2), outliers e limites superior e inferior
#Heatmap = é uma ferramenta que representa dados por cores, mostrando as áreas de maior atividade em uma página da web. 
# Os heatmaps são usados para entender o comportamento dos usuários e melhorar o design de sites e produtos.
#Pairplot = ferramenta de visualização de dados que permite identificar a relação entre variáveis em um conjunto de dados. 
# É uma matriz de gráficos de dispersão que pode ser usada para análise exploratória de dados (EDA)
#Ideal para explorar e visualizar relações entre variáveis.

import seaborn as sns
import pandas as pd

# Dados simulados
data = {'Mês': ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
        'Nascimentos': [100, 120, 130, 90, 110]}
df = pd.DataFrame(data)

# Gráfico de barras com Seaborn
sns.barplot(x='Mês', y='Nascimentos', data=df)
plt.title('Nascimentos por Mês')
plt.savefig("seabornNascMes.png")
print("Gráfico nascimentos por mês feito")

###Boxplot
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

# Dados simulados
data = {'Categoria': ['A', 'A', 'A', 'B', 'B', 'B', 'C', 'C', 'C'],
        'Valores': [10, 12, 11, 15, 14, 13, 18, 19, 20]}
df = pd.DataFrame(data)

# Criar o boxplot
sns.boxplot(x='Categoria', y='Valores', data=df, palette='pastel', legend=False)

# Adicionar título
plt.title('Boxplot de Valores por Categoria')
plt.savefig("seabornBoxPlot.png")
print("Gráfico boxplot feito")

###Heatmap
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Dados simulados (matriz de correlação)
data = np.random.rand(6, 6)  # Gera uma matriz 6x6 com valores aleatórios
correlation_matrix = pd.DataFrame(data, 
                                  columns=['A', 'B', 'C', 'D', 'E', 'F'],
                                  index=['A', 'B', 'C', 'D', 'E', 'F'])

# Criar o heatmap
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")

# Adicionar título
plt.title('Heatmap de Correlações')
plt.savefig("seabornHeatmap.png")
print("Gráfico heatmap feito")

###Pairplot

import seaborn as sns
import pandas as pd

# Dados simulados
data = sns.load_dataset('iris')  # Carregar o dataset Iris
# Visualizar o pairplot
sns.pairplot(data, hue='species', palette='husl')

# Mostrar o gráfico
plt.savefig("seabornPairplot.png")
print("Gráfico pairplot feito")

#Plotly

#Biblioteca interativa para gráficos avançados e dinâmicos.
#Oferece suporte a gráficos 3D, mapas geográficos e gráficos interativos.
#Suporte a visualizações complexas, como mapas e gráficos 3D.
#Ideal para apresentações ou exploração detalhada de dados.
#Interatividade integrada (zoom, hover, clique, etc.).

import plotly.express as px
import pandas as pd

# Dados simulados
data = {'Mês': ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
        'Nascimentos': [100, 120, 130, 90, 110]}
df = pd.DataFrame(data)

# Criar o gráfico de barras
fig = px.bar(df, x='Mês', y='Nascimentos', title='Nascimentos por Mês')

# Salvar como imagem
fig.write_image("plotlyNascimentosMes.png")
print("Gráfico salvo como plotlyNascimentosMes.png")

'''
Comparação Geral:
Biblioteca	Facilidade de Uso	Customização	Interatividade	Finalidade Principal
Matplotlib	    Médio	            Alta	        Baixa	  Gráficos básicos e total controle
Seaborn	        Alta	            Média	        Baixa	Gráficos estatísticos e exploração
Plotly	        Alta	            Alta	        Alta	Gráficos dinâmicos e interativos

Conclusão:
Use Matplotlib para gráficos básicos ou quando precisar de alto controle.
Use Seaborn para análises estatísticas rápidas e visualmente atraentes.
Use Plotly para criar gráficos interativos e dinâmicos, especialmente em dashboards.'''
