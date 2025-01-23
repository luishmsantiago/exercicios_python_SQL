# Dados
import numpy as np #biblioteca para cálculos numéricos
from scipy import stats #biblioteca para estatística

# Dados
dados = [10, 20, 30, 40, 50]

# Cálculo da média - média dos valores
media = np.mean(dados)
print("Média:", media)


# Dados

# Cálculo da mediana - melhor forma de alcançar o centro dos dados
mediana = np.median(dados)
print("Mediana:", mediana)
#Se o número de observações for ímpar, a mediana é o valor do meio; se for par, é a média dos dois valores centrais.

dadosmoda = [10, 20, 20, 30, 30, 30, 40, 50]

# Cálculo da moda - O que mais aparece
moda = stats.mode(dadosmoda, keepdims=True)  # `keepdims` para compatibilidade com futuras versões
print("Moda:", moda.mode[0])


dados = [10, 20, 30, 40, 50]

# Cálculo da variância
variancia = np.var(dados, ddof=0)  # `ddof=0` para população, `ddof=1` para amostra
print("Variância:", variancia)

#A variância mede a dispersão dos dados em relação à média. Em outras palavras, 
# ela indica o quão espalhados os valores estão. Quanto maior a variância, maior a dispersão dos dados.


dados = [10, 20, 30, 40, 50]

# Cálculo do desvio padrão
desvio_padrao = np.std(dados, ddof=0)  # `ddof=0` para população, `ddof=1` para amostra
print("Desvio Padrão:", desvio_padrao)

#O desvio padrão é a raiz quadrada da variância. 
# Ele é uma medida de dispersão que indica o quanto os valores se afastam da média.

import matplotlib.pyplot as plt

media, desvio_padrao = 30, 14.14 # Isso define o centro e a dispersão da distribuição.
dados_normal = np.random.normal(media, desvio_padrao, 1000) #1000 valores são gerados a partir de uma distribuição normal com os parâmetros fornecidos.

# Visualizando a distribuição
plt.hist(dados_normal, bins=30, density=True, alpha=0.6, color='g') #O histograma mostra a frequência dos dados simulados em 30 intervalos (bins). A densidade normaliza os valores para criar uma distribuição de probabilidade.
xmin, xmax = plt.xlim() #xmin e xmax: Definem os limites do gráfico com base no histograma.
x = np.linspace(xmin, xmax, 100) #np.linspace: Cria 100 pontos igualmente espaçados entre xmin e xmax.
p = stats.norm.pdf(x, media, desvio_padrao) #stats.norm.pdf: Calcula a densidade de probabilidade da distribuição normal nos pontos de x
plt.plot(x, p, 'k', linewidth=2) #recebe os valores de x, p, "k" para preto e linewidth=2 para a largura da linha.
plt.title("Distribuição Normal")

# Salvando o gráfico como imagem
plt.savefig("distribuicao_normal.png")
print("Gráfico salvo como 'distribuicao_normal.png'")

#Curva de Gauss, é uma das distribuições mais importantes na estatística. 
# Ela é frequentemente usada para modelar fenômenos naturais, sociais e até comportamentais.
#Características principais:
#Simetria: A curva é simétrica em torno da média (𝜇).
#Média, mediana e moda iguais: Esses valores coincidem no centro da distribuição.
#Formato de sino: A maior concentração de dados está próxima da média.
#68-95-99.7 Regra:
#68% dos dados estão a 1 desvio padrão (𝜎) da média.
#95% estão a 2 desvios padrões.
#99.7% estão a 3 desvios padrões.
#Ela é usada em:
#Estatísticas inferenciais (testes de hipótese, intervalos de confiança).
#Modelagem de fenômenos como altura, peso, pontuações de testes.
#Machine learning e data science, como normalização de dados.
