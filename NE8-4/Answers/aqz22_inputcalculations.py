# By Andy Zhang for NE8 assignment 3
# Feb 2026

import numpy as np

# water density from: thermofluids databook
H2O_DENSITY_150 = 664.9 # [kg/m3]
H2O_DENSITY_200 = 679.8 # [kg/m3]
H2O_DENSITY = H2O_DENSITY_150 + (H2O_DENSITY_200 - H2O_DENSITY_150) * (5/50) # [kg/m3] 15.5MPa @ 600K == 155bar @ 326.85C 
H2O_DENSITY *= 1e-3 # [g/m3]

# heavy water density from: https://inis.iaea.org/records/bgt3d-ng660
D2O_DENSITY_150 = 1/0.0013699 # [kg/m3]
D2O_DENSITY_160 = 1/0.0013627 # [kg/m3]
D2O_DENSITY = D2O_DENSITY_150 + (D2O_DENSITY_160 - D2O_DENSITY_150) * (1/2) # [kg/m3] 15.5MPa @ 600K == 15500kPa @ 326.85C 
D2O_DENSITY *= 1e-3 # [g/m3]

print(f"H2O Density = {H2O_DENSITY} g/cm3 @ 15.5MPa, 600K")
print(f"D2O Density = {D2O_DENSITY} g/cm3 @ 15.5MPa, 600K")
print("")

# Atomic mass from: https://www-nds.iaea.org/relnsd/vcharthtml/VChartHTML.html
U235mass = 235.0439281 # [u]
U238mass = 238.0507869 # [u]
H1mass = 1.00782503190 # [u]
D2mass = 2.01410177784 # [u]
O16mass = 15.9949146193 # [u]
B10mass = 10.012936862 # [u]
B11mass = 11.009305167 # [u]

B10frac = .198
B11frac = .802
B10massfrac = B10frac * B10mass / (B10frac * B10mass + B11frac * B11mass)
B11massfrac = B11frac * B11mass / (B10frac * B10mass + B11frac * B11mass)


# Density calculations
H2OMass = 2 * H1mass + O16mass # [u]
D2OMass = 2 * D2mass + O16mass # [u]

print("H2O Coolant:")
print(f"H fraction = {2 * H1mass / H2OMass}")
print(f"O fraction = {O16mass / H2OMass}")
print("")
print("D2O Coolant:")
print(f"D fraction = {2 * D2mass / D2OMass}")
print(f"O fraction = {O16mass / D2OMass}")
print("")

defaultVf = np.pi * 0.4095**2
defaultVcell = 1.260 ** 2
defaultVm = defaultVcell - defaultVf
print(f"default Vf = {defaultVf}")
print(f"default Vm = {defaultVm}")
print(f"default Vm/Vf = {defaultVm/defaultVf}")
print("")

for VmVf in np.geomspace(0.3, 500000, 10):
    Vm = defaultVf * VmVf
    Vcell = Vm + defaultVf
    pitch = np.sqrt(Vcell)
    
    print(f"* pitch {pitch:.5f} == Vm/Vf {VmVf} --->")
print("")

for VmVf in np.geomspace(90, 600, 5):
    Vm = defaultVf * VmVf
    Vcell = Vm + defaultVf
    pitch = np.sqrt(Vcell)
    
    print(f"* pitch {pitch:.5f} == Vm/Vf {VmVf} --->")
print("")

for VmVf in np.geomspace(3, 12, 5):
    Vm = defaultVf * VmVf
    Vcell = Vm + defaultVf
    pitch = np.sqrt(Vcell)
    
    print(f"* pitch {pitch:.5f} == Vm/Vf {VmVf} --->")
print("")


ass2_rad_bins = 20
radii = [0.4095 * np.sqrt(i / ass2_rad_bins) for i in range(ass2_rad_bins + 1)]
radiiString = ""

print(f"EXERCISE 2, volume = {np.pi * (radii[1]**2 - radii[0]**2):.6f} cm2:")
for i in range(len(radii)):
    if i > 0:
        print(f"rodsub 1 {i} {radii[i]:.6f}  {i}")
        
for i in np.linspace(2,20, 19):
    print(f"material {int(i)} = 1")
print("")


print(f"Exercise 3, Vm/Vf = {defaultVm/defaultVf}")
for r in np.geomspace(0.001, 20, 10):
    r = np.round(r, 4)
    Vf = np.pi * r**2
    Vm = Vf * defaultVm/defaultVf
    Vcell = Vf + Vm
    L = np.sqrt(Vcell)

    Vcell = 1.260 ** 2
    print(f"* {r:.4f},   L = {L:.3E} ---> ")

for r in np.geomspace(0.7368, 6.6548, 7):
    r = np.round(r, 4)
    Vf = np.pi * r**2
    Vm = Vf * defaultVm/defaultVf
    Vcell = Vf + Vm
    L = np.sqrt(Vcell)

    Vcell = 1.260 ** 2
    print(f"* {r:.4f},   L = {L:.3E} ---> ")




