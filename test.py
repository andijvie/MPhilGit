import numpy as np

def product_interp_operator(points, delta, multiplier):
    out = np.zeros((points - 1, points))
    for i in np.arange(points - 1):
        out[i, i] = delta * multiplier[i]/2
        out[i, i + 1] = delta * multiplier[i]/2

    return out

print(product_interp_operator(11, 1, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
order = 2
print(np.linspace(-1, 1, order, endpoint=False) + 1 / order) 
order = 4





#_, ax1 = plt.subplots(figsize=((8,3)))
#ax1.set_xlim(self.x_axis[0], self.x_axis[-1])
#ax1.plot(self.x_axis, phiIn, linestyle = '-', color = 'k', label=f'{np.round((2*self.x_axis[-1]), 2)} cm slab')
#ax1.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
#ax1.set_xlabel(r"Position, $x$ [cm]", fontsize=12)
#ax1.set_ylabel(r"Normalized Scalar Flux", fontsize=12)
#ax1.legend(ncol=2,
#    fontsize=11.5,
#    columnspacing=1.5,
#    handletextpad=0.6,
#    frameon=True, loc = "lower left")
#ax2 = ax1.twiny()
#ax2.set_xlim(self.anal_x_axis[0], self.anal_x_axis[-1])
#ax2.plot(self.anal_x_axis, refPhi, linestyle = '--', color = 'k', label='100.00 cm slab')
#ax2.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
#ax2.set_xlabel(r"Position (reference), $x$ [cm]", fontsize=12)
#ax2.set_ylabel(r"Normalized Scalar Flux", fontsize=12)
#ax2.legend(ncol=2,
#    fontsize=11.5,
#    columnspacing=1.5,
#    handletextpad=0.6,
#    frameon=True, loc = "upper left")
#plt.tight_layout()
#plt.show()
#



