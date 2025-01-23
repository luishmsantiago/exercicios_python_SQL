#Pairplot

import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

# Dados simulados
data = sns.load_dataset('iris')  # Carregar o dataset Iris
# Visualizar o pairplot
sns.pairplot(data, hue='species', palette='husl')

# Mostrar o gráfico
plt.savefig("seabornPairplot.png")
print("Gráfico pairplot feito")