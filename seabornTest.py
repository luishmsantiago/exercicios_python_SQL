import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt 

# Dados simulados
data = {'Mês': ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
        'Nascimentos': [100, 120, 130, 90, 110]}
df = pd.DataFrame(data)

# Gráfico de barras com Seaborn
sns.barplot(x='Mês', y='Nascimentos', data=df, hue='Mês', palette='Blues')
plt.title('Nascimentos por Mês')
plt.savefig("seabornNascMes.png")
print("Gráfico nascimentos por mês feito")

#################