import numpy as np

FUEL_ENRICHMENT = 0.035 # weight fraction
# FUEL_ENRICHMENT = 0.1 # <--- uncomment for exercise 3 and 5
# FUEL_ENRICHMENT = 0.007 # <--- uncomment for exercise 5
# FUEL_ENRICHMENT = 0.9 # <--- uncomment for exercise 5

BORON_CONCENTRATION = 500 # [ppm mass]
# BORON_CONCENTRATION = 550 # <--- uncomment for exercise 4

UO2_DENSITY = 10.4 # [g/cm3] NOT GIVEN??? (from assignment 1)

# water denstyi from: thermofluids databook
H2O_DENSITY_150 = 664.9 # [kg/m3]
H2O_DENSITY_200 = 679.8 # [kg/m3]
H2O_DENSITY = H2O_DENSITY_150 + (H2O_DENSITY_200 - H2O_DENSITY_150) * (5/50) # [kg/m3] 15.5MPa @ 600K == 155bar @ 326.85C 
H2O_DENSITY *= 1e-3 # [g/m3]
H2O_DENSITY_red = H2O_DENSITY - 10e-3 # [g/m3], reduced H2O density for exercise 8

# Atomic mass from: https://www-nds.iaea.org/relnsd/vcharthtml/VChartHTML.html
U235mass = 235.0439281 # [u]
U238mass = 238.0507869 # [u]
H1mass = 1.00782503190 # [u]
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
H1density = H2O_DENSITY * (2 * H1mass) / H2OMass # [u]
O16coolantDensity = H2O_DENSITY * O16mass / H2OMass # [g/cm3]
H1densityRed = H2O_DENSITY_red * (2 * H1mass) / H2OMass # [u]
O16coolantDensityRed = H2O_DENSITY_red * O16mass / H2OMass # [g/cm3]


boronDensity = H2O_DENSITY * BORON_CONCENTRATION/1e6 # [g/cm3]
B10Density = boronDensity * B10massfrac # [g/cm3]
B11Density = boronDensity * B11massfrac # [g/cm3]

boronDensityRed = H2O_DENSITY_red * BORON_CONCENTRATION/1e6 # [g/cm3]
B10DensityRed = boronDensityRed * B10massfrac # [g/cm3]
B11DensityRed = boronDensityRed * B11massfrac # [g/cm3]


print("Fuel:")
print(f"U235 density = {U235density} g/cm3")
print(f"U238 density = {U238density} g/cm3")
print(f"O16 density = {O16fuelDensity} g/cm3")
print("")
print("Coolant:")
print(f"Coolant density = {H2O_DENSITY} g/cm3")
print(f"H1 density = {H1density} g/cm3")
print(f"O16 density = {O16coolantDensity} g/cm3")
print(f"B10 density = {B10Density} g/cm3")
print(f"B11 density = {B11Density} g/cm3")
print("")
print("Coolant reduced density for exercise 8:")
print(f"Coolant density = {H2O_DENSITY_red} g/cm3")
print(f"H1 density = {H1densityRed} g/cm3")
print(f"O16 density = {O16coolantDensityRed} g/cm3")
print(f"B10 density = {B10DensityRed} g/cm3")
print(f"B11 density = {B11DensityRed} g/cm3")
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

