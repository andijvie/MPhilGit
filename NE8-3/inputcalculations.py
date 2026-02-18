import numpy as np

FUEL_ENRICHMENT = 0.035 # weight fraction

UO2_DENSITY = 10.4 # [g/cm3] NOT GIVEN??? (from assignment 1)

# water denstyi from: thermofluids databook
H2O_DENSITY_150 = 664.9 # [kg/m3]
H2O_DENSITY_200 = 679.8 # [kg/m3]
H2O_DENSITY = H2O_DENSITY_150 + (H2O_DENSITY_200 - H2O_DENSITY_150) * (5/50) # [kg/m3] 15.5MPa @ 600K == 155bar @ 326.85C 
H2O_DENSITY *= 1e-3 # [g/m3]

# Atomic mass from: https://www-nds.iaea.org/relnsd/vcharthtml/VChartHTML.html
U235mass = 235.0439281 # [u]
U238mass = 238.0507869 # [u]
H1mass = 1.00782503190 # [u]
O16mass = 15.9949146193 # [u]



# Density calculations
U_mass = U235mass * FUEL_ENRICHMENT + U238mass * (1 - FUEL_ENRICHMENT) # [u] avg uranium mass
U_density = UO2_DENSITY * U_mass / (U_mass + 2 * O16mass) # [g/cm3] # avg uranium density
U235density = U_density * FUEL_ENRICHMENT # [g/cm3]
U238density = U_density * (1 - FUEL_ENRICHMENT) # [g/cm3]
O16fuelDensity = UO2_DENSITY * (2 * O16mass) / (U_mass + 2 * O16mass)

H2OMass = 2 * H1mass + O16mass # [u]
H1density = H2O_DENSITY * (2 * H1mass) / H2OMass # [u]
O16coolantDensity = H2O_DENSITY * O16mass / H2OMass


print("Fuel:")
print(f"U235 density = {U235density} g/cm3")
print(f"U238 density = {U238density} g/cm3")
print(f"O16 density = {O16fuelDensity} g/cm3")
print("")
print("Coolant:")
print(f"Coolant density = {H2O_DENSITY} g/cm3")
print(f"H1 density = {H1density} g/cm3")
print(f"O16 density = {O16coolantDensity} g/cm3")
print("")

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