
#Heatmap
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

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