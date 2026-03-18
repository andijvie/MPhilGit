import numpy as np
import matplotlib.pyplot as plt






kNa = np.array([0.9727, 0.9882, 0.9842, 1.0000, 1.0131, 1.0104, 1.0238, 0.9965, 1.0208])
kVoid = np.array([0.9808, 0.9985, 0.9942, 1.0124, 1.0276, 1.0247, 1.0403, 1.0098, 1.0376])

rhoNa = (kNa - 1)/kNa
rhoVoid = (kVoid - 1)/kVoid

deltaRho = rhoVoid - rhoNa

print(deltaRho)


reactivity = np.array([
    [44, -11.1],
    [45, -8],
    [47.5, -5],
    [50, -3.5],
    [52.5, -3],
    [55, -2.6],
    [57.5, -2.4],
    [60, -2.1],
    [62.5, -1.9],
    [65, -1.8],
    [70, -1.5],
    [75, -1.25]
])

# between 44 and 45
t1, y1 = reactivity[0]
t2, y2 = reactivity[1]
segment1k = np.log(y2/y1) / (t2 - t1)
segment1A = y1 * np.exp(-segment1k * t1)
segment1 = np.array([segment1A * np.exp(segment1k * t) for t in reactivity[:,0]])

# between 45 and 50
t1, y1 = reactivity[1]
t2, y2 = reactivity[3]
segment2k = np.log(y2/y1) / (t2 - t1)
segment2A = y1 * np.exp(-segment2k * t1)
segment2 = np.array([segment2A * np.exp(segment2k * t) for t in reactivity[:,0]])

# between 50 and 75
t1, y1 = reactivity[3]
t2, y2 = reactivity[-1]
segment3k = np.log(y2/y1) / (t2 - t1)
segment3A = y1 * np.exp(-segment3k * t1)
segment3 = np.array([segment3A * np.exp(segment3k * t) for t in reactivity[:,0]])

print(segment1k)
print(segment2k)
print(segment3k)

plt.figure(figsize = (8, 4))
plt.plot(reactivity[:,0], reactivity[:,1], color = 'k')
plt.xlabel(r'Time, $t$ [s]', fontsize = 12)
plt.ylabel(r'Reactivity, $\rho$ [¢]', fontsize = 12)
plt.tight_layout()
plt.show()

plt.figure(figsize = (8, 4))
plt.plot(reactivity[:,0], -reactivity[:,1], color = 'k', lw = 1.8, label = 'Measurement')
plt.plot(reactivity[:,0], -segment1, color = 'darkgrey', linestyle = ':', lw = 1, label = r'$A\,\exp(-0.3275t)$')
plt.plot(reactivity[:,0], -segment2, color = 'darkgrey', linestyle = '--', lw = 1, label = r'$A\,\exp(-0.1653t)$')
plt.plot(reactivity[:,0], -segment3, color = 'darkgrey', linestyle = '-.', lw = 1, label = r'$A\,\exp(-0.0412t)$')
plt.xlabel(r'Time, $t$ [s]', fontsize = 12)
plt.ylabel(r'Absolute reactivity, $|\rho|$ [¢]', fontsize = 12)
plt.legend(fontsize = 11.5)
plt.yscale('log')
plt.ylim((1, 13))
plt.tight_layout()
plt.show()


# Time array (seconds)
t = np.linspace(-10, 50, 500)

tau_P = 4  
P = np.where(
    t < 0,
    546,
    479 + (488 - 479) * np.exp(-(t - 5) / tau_P)
)

# T_in: exponential decay from 687 K to 686 K
tau_Tin = 4
T_in = 686 + (687 - 686) * np.exp(-t / tau_Tin)

# T_out: exponential decay from 835 K to 815 K
tau_Tout = 4
T_out = 815 + (835 - 815) * np.exp(-t / tau_Tout)

for i in range(len(t)):
    if t[i] < 0:
        T_in[i] = 687
        T_out[i] = 835

# --- Plot with dual y-axis ---
fig, ax1 = plt.subplots(figsize = (6,4))

# Left axis (temperatures)
ax1.plot(t, T_in, label=r'$T_\text{in}$', color = 'grey', linestyle = ':')
ax1.plot(t, T_out, label=r'$T_\text{out}$', color = 'grey')
ax1.set_xlabel(r'Time, $t$ [unitless]')
ax1.set_ylabel(r'Temperature, $T$ [K]')
ax1.set_xticks([0])
ax1.axvline(0, color = 'lightgrey', lw = 1, linestyle = '--', zorder = -10)

# Right axis (power)
ax2 = ax1.twinx()
ax2.plot(t, P, linestyle='-', color = 'k', label=r'$P$')
ax2.set_ylabel(r'Power, $P$ [MW]')
ax2.set_ylim((400,700))

# --- Combined legend ---
lines_1, labels_1 = ax1.get_legend_handles_labels()
lines_2, labels_2 = ax2.get_legend_handles_labels()
ax1.legend(lines_1 + lines_2, labels_1 + labels_2)

plt.tight_layout()
plt.show()
