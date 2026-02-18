import numpy as np
import matplotlib.pyplot as plt

from outputs import DETEXERCISE1R, DETEXERCISE256E, DETEXERCISE3E, DETEXERCISE1, DETEXERCISE256fuel, DETEXERCISE256mod, DETEXERCISE3, DETEXERCISE3T, DETEXERCISE310, DETEXERCISE310T






ex1_bins   = np.append(DETEXERCISE1R[:,0], DETEXERCISE1R[-1, 1])
ex256_bins = np.append(DETEXERCISE256E[:,0], DETEXERCISE256E[-1, 1])
ex3_bins = np.append(DETEXERCISE3E[:,0], DETEXERCISE3E[-1, 1])


plt.plot(figsize=(8,3))
plt.stairs(DETEXERCISE1[:,0], ex1_bins)
plt.xlim((ex1_bins[0], ex1_bins[-1]))
plt.tight_layout()
plt.show()

plt.plot(figsize=(8,3))
plt.stairs(DETEXERCISE256fuel[:,0], ex256_bins, label = "Fuel")
plt.stairs(DETEXERCISE256mod[:,0], ex256_bins, label = "Moderator")
plt.yscale('log')
plt.xscale('log')
plt.xlim((ex256_bins[0], ex256_bins[-1]))
plt.legend()
plt.tight_layout()
plt.show()

plt.plot(figsize=(8,3))
plt.stairs(DETEXERCISE3[:,0], ex3_bins, label="3.5% 900K")
plt.stairs(DETEXERCISE3T[:,0], ex3_bins, label="3.5% 1200K")
plt.stairs(DETEXERCISE310[:,0], ex3_bins, label="10% 900K")
plt.stairs(DETEXERCISE310T[:,0], ex3_bins, label="10% 1200K")
plt.yscale('log')
plt.xscale('log')
plt.xlim((ex3_bins[0], ex3_bins[-1]))
plt.legend()
plt.tight_layout()
plt.show()
