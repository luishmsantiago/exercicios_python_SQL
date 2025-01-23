#Teste t (t-test): comparação de médias de duas populações ou de uma amostra com um valor conhecido.

#Teste t independente: Compara médias de dois grupos independentes.
#Teste t pareado: Compara médias do mesmo grupo em dois momentos diferentes.
#Exemplo Prático: Comparar a média de glicemia entre dois grupos de pacientes (controle e tratados).

from scipy.stats import ttest_ind

grupo_controle = [90, 85, 88, 92, 86]
grupo_tratado = [75, 80, 78, 72, 77]

t_stat, p_valor = ttest_ind(grupo_controle, grupo_tratado)

print(f"T-Estatística: {t_stat}") #Se o valor de t for maior que 0, rejeitamos a hipótese nula. O valor de t é calculado com base na diferença entre as médias dos grupos e na variabilidade dos dados.
print(f"P-Valor: {p_valor}") #Se o p-valor for menor que 0,05, rejeitamos a hipótese nula. p-valor significa a probabilidade de obter um resultado igual ou mais extremo que o observado, supondo que a hipótese nula seja verdadeira.
#Quanto maior o valor de p, mais forte é a evidência a favor da hipótese nula. Se o p-valor for menor que 0,05, a diferença é considerada estatisticamente significativa.
#Quanto maior for o valor de t, mais evidências temos para rejeitar a hipótese nula. O valor de t é calculado com base na diferença entre as médias dos grupos e na variabilidade dos dados.
#ttest_ind() = Realiza o teste de hipóteses para comparar as médias de duas amostras independentes.


#Teste Qui-Quadrado (Chi-Square Test):

#Verifica a associação entre variáveis categóricas.

#Exemplo Prático: Analisar se a taxa de cesáreas difere entre hospitais.

from scipy.stats import chi2_contingency

dados = [[50, 30],  # Cesáreas em Hospital A e B
         [70, 90]]  # Partos normais em Hospital A e B

chi2, p_valor, dof, esperado = chi2_contingency(dados)

print(f"Qui-Quadrado: {chi2}")
print(f"P-Valor: {p_valor}")
#Se o p valor for menor que 0,05, rejeitamos a hipótese nula. 
# O p-valor é a probabilidade de obter um resultado igual ou mais extremo que o observado, 
# supondo que a hipótese nula seja verdadeira.
#Quanto maior o valor de Qui-Quadrado, mais evidências temos para rejeitar a hipótese nula.
#Teste Qui-Quadrado (Chi-Square Test) é usado para determinar se existe uma diferença significativa entre as frequências 
# observadas (os dados reais) e as frequências esperadas (o que se espera sob a hipótese nula).

#Intervalos de Confiança
#O intervalo de confiança (IC) indica o intervalo provável onde o valor real de um parâmetro estatístico está localizado, 
# com base em uma amostra.

#Exemplo Prático: Estimar a média de peso dos recém-nascidos na UTI neonatal.

import numpy as np
from scipy.stats import norm

# Dados
pesos = [2.5, 2.7, 2.8, 2.6, 3.0]
media = np.mean(pesos)
desvio_padrao = np.std(pesos, ddof=1)
n = len(pesos)

# Nível de confiança (95%)
z = norm.ppf(0.975)

# Intervalo de Confiança
erro_padrao = desvio_padrao / np.sqrt(n)
margem = z * erro_padrao
ic_min = media - margem
ic_max = media + margem

print(f"Intervalo de Confiança: [{ic_min:.2f}, {ic_max:.2f}]")

'''
Resumo Prático
Mediana: Melhor para dados com outliers (dados que se diferenciam drasticamente de todos os outros). 
t-test: Compara médias; útil em estudos comparativos. Comparar a média de glicemia entre dois grupos de pacientes (controle e tratados).
Chi-square: Testa associações entre categorias. Ex.:Analisar se a taxa de cesáreas difere entre hospitais;
Intervalos de Confiança: Fornecem uma faixa provável para estatísticas populacionais. Estimar a média de peso dos recém-nascidos na UTI neonatal.
'''