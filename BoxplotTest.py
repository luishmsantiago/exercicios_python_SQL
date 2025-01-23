#Boxplot
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