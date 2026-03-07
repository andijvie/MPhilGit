# By Andy Zhang for NE8 assignment 3
# Feb 2026

import numpy as np

FUEL_ENRICHMENT = 0.035 # weight fraction
# FUEL_ENRICHMENT = 0.1 # <--- uncomment for exercise 3 and 5
# FUEL_ENRICHMENT = 0.007 # <--- uncomment for exercise 5
# FUEL_ENRICHMENT = 0.9 # <--- uncomment for exercise 5

BORON_CONCENTRATION = 500 # [ppm mass]
# BORON_CONCENTRATION = 550 # <--- uncomment for exercise 4

UO2_DENSITY = 10.4 # [g/cm3] NOT GIVEN??? (from assignment 1)

# water density from: thermofluids databook
H2O_DENSITY_150 = 664.9 # [kg/m3]
H2O_DENSITY_200 = 679.8 # [kg/m3]
H2O_DENSITY = H2O_DENSITY_150 + (H2O_DENSITY_200 - H2O_DENSITY_150) * (5/50) # [kg/m3] 15.5MPa @ 600K == 155bar @ 326.85C 
H2O_DENSITY *= 1e-3 # [g/m3]

# heavy water density from: file://ifs.eng.cam.ac.uk/users/aqz22/Downloads/14730979.pdf
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
U_mass = U235mass * FUEL_ENRICHMENT + U238mass * (1 - FUEL_ENRICHMENT) # [u] avg uranium mass
U_density = UO2_DENSITY * U_mass / (U_mass + 2 * O16mass) # [g/cm3] # avg uranium density
U235density = U_density * FUEL_ENRICHMENT # [g/cm3]
U238density = U_density * (1 - FUEL_ENRICHMENT) # [g/cm3]
O16fuelDensity = UO2_DENSITY * (2 * O16mass) / (U_mass + 2 * O16mass)

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

exit()

print("Fuel:")
print(f"U235 density = {U235density} g/cm3")
print(f"U238 density = {U238density} g/cm3")
print(f"O16 density = {O16fuelDensity} g/cm3")

fuel_pellet_outer_diameter = 0.950 # [cm]
clad_thickness = 0.0655 # [cm]

print("Pin:")
print(f"Fuel pellet radius = {fuel_pellet_outer_diameter/2} cm")
print(f"Cladding radius = {fuel_pellet_outer_diameter/2 + clad_thickness} cm")
print()


power_density = 38 # [kW/kgHM]
print("Power:")
print(f"Power density = {power_density/1000} kW/gHM")
print()

ass1_rad_bins = 10
radii = [fuel_pellet_outer_diameter/2 * np.sqrt(i / ass1_rad_bins) for i in range(ass1_rad_bins + 1)]
radiiString = ""

print("ASSIGNMENT 1:")
for i in range(len(radii)):
    radiiString += f"{radii[i]:.6f} "
    if i > 0:
        print(f"{radii[i - 1]:.6f} to {radii[i]:.6f} has volume {np.pi * (radii[i]**2 - radii[i - 1]**2):.6f}")
print("ASSIGNMENT 1 Radii: " + radiiString)

