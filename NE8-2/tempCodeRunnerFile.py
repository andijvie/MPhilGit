scOrd = np.load("eigen_discrOrd.npy")

plt.figure(figsize=((8,3)))
plt.plot(np.arange(len(eigenHist_DiscOrd)) + 1, eigenHist_DiscOrd, color = 'k', linewidth = 1.5, label="Discrete ordinates $k_{eff}$ iterations")
plt.plot(np.arange(len(eigenHist_powIt)) + 1, eigenHist_powIt, color = 'k', linewidth = 1.5, label="Diffusion $k_{eff}$ iterations")
plt.scatter([len(eigenHist_DiscOrd)], [eigenHist_DiscOrd[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, label=r"$k_{eff}$ final value", zorder=10)
plt.scatter([len(eigenHist_powIt)], [eigenHist_powIt[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, zorder=10)
plt.legend(fontsize=11.5)
#plt.text(
#    0.6, 0.83, 
#    r"Final $k_{eff}$ = " + f"{eigenHist[-1]:.7f}\nError in " + r"$k_{eff}$" + f" = {abs((eigenNext - eigen)/eigen):.7f}\nIterations = {len(eigenHist)}",
#    transform=plt.gca().transAxes,
#    ha="left",
#    va="top",
#    fontsize=14,
#    linespacing=1.5
#)  
plt.xlabel("Iteration", fontsize=12)
plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
plt.tight_layout()
plt.show()