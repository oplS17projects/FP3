import pandas, sqlite3
from sklearn.decomposition import PCA as sklearnPCA
from sklearn.preprocessing import StandardScaler

conn = sqlite3.connect('my.db')

df = pandas.read_csv('iris.data.csv')
df.to_sql('iris', conn, if_exists='append', index=False)

# advice on the how to generate the pca https://plot.ly/ipython-notebooks/principal-component-analysis/

sklearn_pca = sklearnPCA(n_components=3)

X = df.ix[:,0:4].values
X_std = StandardScaler().fit_transform(X)
Y_sklearn = sklearn_pca.fit_transform(X_std)