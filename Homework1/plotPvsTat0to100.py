import matplotlib.pyplot as plt
import numpy as np

# Create the vectors p and t
t = np.arange(0,100,0.0001)
p = np.exp(-2*t) + np.exp(-3*t) + np.exp(-3*t/2) + np.exp(-5*t/6) + np.exp(-29*t/6) - np.exp(-5*t/2) - np.exp(-23*t/6) - np.exp(-4*t) - np.exp(-11*t/6)

# Create the plot
plt.plot(t,p)

plt.xlabel('time')
plt.ylabel('probability')

# Show the plot
plt.show()
