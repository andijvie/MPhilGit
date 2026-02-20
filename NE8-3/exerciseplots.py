import numpy as np
import matplotlib.pyplot as plt
from os import path
import scipy.io

basepath = path.dirname(__file__)
filepath = path.abspath(path.join(basepath, "outputs.mat"))
data = scipy.io.loadmat(filepath)
data = np.array(data) # For converting to a NumPy array
print(data)
exit()

from outputs import DETEXERCISE1R, DETEXERCISE256E, DETEXERCISE3E, DETEXERCISE1, DETEXERCISE256fuel, DETEXERCISE256mod, DETEXERCISE3, DETEXERCISE3T, DETEXERCISE310, DETEXERCISE310T
from outputs import DETEXERCISE5fuel7, DETEXERCISE5fuel10, DETEXERCISE5fuel90, DETEXERCISE5mod7, DETEXERCISE5mod10, DETEXERCISE5mod90





ex1_bins   = np.append(DETEXERCISE1R[:,0], DETEXERCISE1R[-1, 1])
ex256_bins = np.append(DETEXERCISE256E[:,0], DETEXERCISE256E[-1, 1])
ex3_bins = np.append(DETEXERCISE3E[:,0], DETEXERCISE3E[-1, 1])

ex1_x = DETEXERCISE1R[:,2]
ex256_x = DETEXERCISE256E[:,2]
ex3_x = DETEXERCISE3E[:,2]



plt.plot(figsize=(8,3))
plt.plot(ex1_x, DETEXERCISE1[:,0])
plt.xlim((ex1_x[0], ex1_x[-1]))
plt.tight_layout()
plt.show()



plt.plot(figsize=(8,3))
plt.plot(ex256_x, DETEXERCISE256fuel[:,0], label = "Fuel")
plt.plot(ex256_x, DETEXERCISE256mod[:,0], label = "Moderator")
plt.yscale('log')
plt.xscale('log')
plt.xlim((ex256_x[0], ex256_x[-1]))
plt.legend()
plt.tight_layout()
plt.show()


plt.plot(figsize=(8,3))
plt.plot(ex3_x, DETEXERCISE3[:,0], label="3.5% 900K")
plt.plot(ex3_x, DETEXERCISE3T[:,0], label="3.5% 1200K")
plt.plot(ex3_x, DETEXERCISE310[:,0], label="10% 900K")
plt.plot(ex3_x, DETEXERCISE310T[:,0], label="10% 1200K")
plt.yscale('log')
plt.xscale('log')
plt.xlim((ex3_x[0], ex3_x[-1]))
plt.legend()
plt.tight_layout()
plt.show()

plt.plot(figsize=(8,3))
plt.plot(ex256_x, DETEXERCISE5mod7[:,0], label = "Moderator 0.7", linestyle = '--', color='k')
plt.plot(ex256_x, DETEXERCISE256mod[:,0], label = "Moderator 3.5", color='k')
plt.plot(ex256_x, DETEXERCISE5mod10[:,0], label = "Moderator 10", linestyle = 'dashdot', color='k')
plt.plot(ex256_x, DETEXERCISE5mod90[:,0], label = "Moderator 90", linestyle = ':', color='k')
plt.plot(ex256_x, DETEXERCISE5fuel7[:,0], label = "Fuel 0.7", linestyle = '--', color='grey')
plt.plot(ex256_x, DETEXERCISE256fuel[:,0], label = "Fuel 3.5", color='grey')
plt.plot(ex256_x, DETEXERCISE5fuel10[:,0], label = "Fuel 10", linestyle = 'dashdot', color='grey')
plt.plot(ex256_x, DETEXERCISE5fuel90[:,0], label = "Fuel 90", linestyle = ':', color='grey')
plt.yscale('log')
plt.xscale('log')
plt.xlim((ex256_x[0], ex256_x[-1]))
plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
plt.tight_layout()
plt.show()

