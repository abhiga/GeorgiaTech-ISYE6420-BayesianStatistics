import numpy as np

x1 = np.random.uniform(0,1, 40)
x2 = np.floor(10 * np.random.uniform(0,1,40)) + 1
y = 2 + 6 * x1 - 0.5 * x2 + 0.8*np.random.normal(0,1,len(x1))
print (x1)
print (x2)
print (y)