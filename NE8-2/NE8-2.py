# Code written for NE8 Computational Reactor Modelling Assignment 2 - Discrete Ordinates
# Andy Zhang
# February 2026

# This code is loosely based on the methods outlined in the "NE8 Workshop 1 Finite Elements_Handout (1).pdf" and "NE8 Lecture 4: the discrete ordinates/SN method" handouts by Paul Cosgrove and Zi Liang Tan

# Naming convention: (slightly unual but i've always used these as it helps me more easily determine what a variable is)
# CONSTANTS
# derived_constants
# mathematical_functions()
# regularVariables
# regularFunctions()

# Import packages
import numpy as np
import numpy.typing as np_type
from numpy.polynomial.legendre import leggauss
import matplotlib.pyplot as plt
from line_profiler import LineProfiler

# Universal Constants
AVOGADRO_CONSTANT = 6.02214076e23 # per mol
ELEMENTARY_CHARGE = 1.602176634e-19 # C

# ----------------------Mathematical Functions----------------------
# - These functions are basic mathematical operations and are not a fundamental part of the code logic


# Various unit conversions
def barn_to_cm2(input):
    return input * 1e-24
def MeV_to_j(input):
    return input * ELEMENTARY_CHARGE * 1e6

# An inverse proportional relationship
# - used for curve fitting in exercise 6
def inverse_proportional(x, a, b):
    return a / x + b

# Generates a diffusion (leakage) operator in discrete matrix form
# - This corresponds to the -d/dx D d/dx operator in the handout 
# Inputs:
# - Points: no. points in the mesh = no. intervals + 1 [INTEGER]
# - delta: the Delta x length of each interval, corresponds to the Delta term in the handout [FLOAT]
# Outputs:
# - an [points x points] matrix that performs the diffusion/leakage operator
def diffusion_operator(points, delta):
    out = np.zeros((points, points)) # initialize output matrix 

    # Calculate terms on the diagonal, for derivation see: handout
    ai = -1/delta # ai = -D/delta
    bi = 2/delta # bi = 2D/delta
    ci = -1/delta # ci = -D/delta

    # fill in diagonal, ignore the boundary
    for i in np.arange(1, points - 1):
        out[i, i-1] = ai 
        out[i, i]   = bi 
        out[i, i+1] = ci 

    # left boundary: the b term is essentially "cut in half" (more detail in the handout)
    out[0, 0] = bi/2 # b0 = D/delta
    out[0, 1] = ci # c0 = -D/delta

    # right boundary (idem)
    out[-1, -2] = ai # aN = -D/delta
    out[-1, -1] = bi/2 # bN = D/delta
            
    return out # return output matrix

# Generates a signal product operator in discrete matrix form
# - This function generates a matrix from a signal, that can be used to perform a piece-wise multiplication of that signal with another signal
# - The function assumes that the signal array represents points that are IN BETWEEN the mush points, that is: they are coefficients of the interval (this is the definition used in the handout and i am following the handout)
# - For exact derivation of the calculation refer to the handout, but essentially all of the coefficients just ensure that the values are "smeared out" such that the output matrix has the right dimension
# - This is essentially what the handout does for the absorption and fission terms 
# Inputs:
# - points: no. points in the mesh = no. intervals + 1 [INTEGER]
# - delta: the Delta x length of each interval, corresponds to the Delta term in the handout [FLOAT]
# - multiplier: the signal that acts as a multiplier [FLOAT ARRAY length = points - 1] 
# Outputs:
# - an [points x points] matrix that performs the multiplication by the multiplier signal
def product_operator(points, delta, multiplier):
    out = np.zeros((points, points)) # initialize the output matrix
    
    # fill in the diagonal, ignore the boundaries
    for i in np.arange(1, points - 1):
        out[i, i-1] = multiplier[i - 1] * delta / 8 # a_i = Sigma_ai-1 * Delta / 8
        out[i, i]   = 3 * (multiplier[i - 1] + multiplier[i]) * delta / 8 # b_i = 3 * (Sigma_ai-1 + Sigma_ai) * Delta / 8
        out[i, i+1] = multiplier[i] * delta / 8 # c_i = Sigma_ai * Delta / 8

    # fill in boundaries
    out[0, 0] = 3 * multiplier[0] * delta / 8 # b_0 = 3 * Sigma_a0 * Delta / 8
    out[0, 1] = multiplier[0] * delta / 8 # c_0 = Sigma_a0 * Delta / 8
    out[-1, -2] = multiplier[-1] * delta / 8 # a_N = Sigma_aN-1 * Delta / 8
    out[-1, -1] = 3 * multiplier[-1] * delta / 8 # b_N = 3 * Sigma_aN-1 * Delta / 8

    return out # return output matrix


# Interpolates a signal
# - It finds the interpolated values between every 2 points 
# Inputs:
# - signal: signal to be interpolated [FLOAT ARRAY]
# Output:
# - a [points - 1] array of the interpolated values 
def interpolate(input):
    return np.array([(input[i, 0] + input[i+1, 0])/2 for i in range(len(input) - 1)])


# Integrates a signal
# - Technically it's a sum function 
# Inputs:
# - signal: signal to be integrated [FLOAT ARRAY]
# - delta: the DX value [FLOAT]
# Output:
# - float of the integral 
def integrate(signal, delta):
    return np.sum(signal) * delta






# ----------------------Element class----------------------
# - This class stores the properties of the elements present in the assignment
class Element:

    # Initializer, the variable names should speak for themselves
    def __init__(self, mass = None, microC = .0, microS = .0, microF = .0, nu = .0, density =None, fission_yield = .0, number_density = None):
        self.mass = mass # [u]
        self.micro_c = microC # [barns]
        self.micro_s = microS # [barns]
        self.micro_f = microF # [barns]
        self.nu = nu # (unitless)
        self.density = density # [g/cm3]
        self.fission_yield = fission_yield # (unitless)
        self.number_density = number_density # [atoms / cm3]
    
    # Number density setter
    def set_number_density(self, number_density):
        self.number_density = number_density
    
    # Various getters
    def get_number_density(self) -> float: # [atoms/cm3]
        if self.number_density is None:
            if self.density is not None and self.mass is not None:
                self.number_density = self.density * AVOGADRO_CONSTANT / self.mass 
            else:
                raise ValueError("Density or mass undefined")
        return self.number_density
    def get_macro_c(self): # [cm-1]
        return self.get_number_density() * barn_to_cm2(self.micro_c)
    def get_macro_s(self): # [cm-1]
        return self.get_number_density() * barn_to_cm2(self.micro_s)
    def get_macro_f(self): # [cm-1]
        return self.get_number_density() * barn_to_cm2(self.micro_f)
    def get_macro_a(self): # [cm-1]
        return self.get_macro_c() + self.get_macro_f()
    def get_macro_t(self): # [cm-1]
        return self.get_macro_a() + self.get_macro_s()
    def get_macro_f_nu(self): # [cm-1]
        return self.get_macro_f() * self.nu
    def get_micro_a(self): # [cm2]
        return barn_to_cm2(self.micro_c) + barn_to_cm2(self.micro_f)
    def get_mean_cos_scatter_angle(self) -> float: # [rad]
        if self.mass is not None:
            return 2 / (3 * self.mass) # equation was given
        raise ValueError("Density or mass undefined")



# ----------------------Known quantities----------------------
# - Fill in all of the given quantities


# Define elements using the qunatities given in the assignment
U235 = Element(
    microC = 10.350, # [barns]
    microS = 11.5860, # [barns]
    microF = 47.500, # [barns]
    nu = 2.50 # [neutrons/fission]
)
U238 = Element(
    microC = 0.8900, # [barns]
    microS = 11.2221 # [barns]
)
H1 = Element(
    microS = 3.3723 #[barns]
)
O16 = Element(
    microS = 3.7156 # [barns]
)
slab_elements = np.array([U235, U238, H1, O16]) # array of all the elements in exercise 1-5

# Other given constants
H2O_DENSITY = 0.75 # [g/cm3]
UO2_DENSITY = 10.4 # [g/cm3]
FUEL_ENRICHMENT = 0.035 # weight fraction
ENERGY_PER_FISSION= MeV_to_j(200.0) # [J]

# Atomic mass from: https://www-nds.iaea.org/relnsd/vcharthtml/VChartHTML.html
U235.mass = 235.0439281 # [u]
U238.mass = 238.0507869 # [u]
H1.mass = 1.00782503190 # [u]
O16.mass = 15.9949146193 # [u]

# Density calculations
U_mass = U235.mass * FUEL_ENRICHMENT + U238.mass * (1 - FUEL_ENRICHMENT) # [u] avg uranium mass
U_density = UO2_DENSITY * U_mass / (U_mass + 2 * O16.mass) # [g/cm3] # avg uranium density
U235.density = U_density * FUEL_ENRICHMENT # [g/cm3]
U238.density = U_density * (1 - FUEL_ENRICHMENT) # [g/cm3]

H2OMass = 2 * H1.mass + O16.mass # [u]
H1.density = H2O_DENSITY * (2 * H1.mass) / H2OMass # [u]
O16.density = H2O_DENSITY * O16.mass / H2OMass + UO2_DENSITY * (2 * O16.mass) / (U_mass + 2 * O16.mass) # [u]



# ----------------------Iteration constants class----------------------
# - this class stores constants that may chagne depending on the exercise
class IterationConstants:
    def __init__(self,
                    resolution = 10, # [cells/cm] mesh resolution
                    slab_thickness = 100, # [cm]
                    is_isotropic = False, # For exercise 5: This boolean changes the scattering to isotromic by setting the average scattering angle mu_bar to 0. 
                    use_scatter_ratio = False,
                    scatter_ratio = 0.1,
                    multiplying = True,
                    doPrint = True # Print the outputs?
                ):
        
        # macroscopic crosssection calculations
        self.slab_macro_t = sum([i.get_macro_t() for i in slab_elements]) # [cm-1]
        self.slab_macro_s = sum([i.get_macro_s() for i in slab_elements]) # [cm-1]
        self.slab_macro_a = sum([i.get_macro_a() for i in slab_elements]) # [cm-1]
        self.slab_macro_f = sum([i.get_macro_f() for i in slab_elements]) # [cm-1]
        self.slab_macro_f_nu = sum([i.get_macro_f_nu() for i in slab_elements]) # [cm-1]
        self.slab_macro_f_pow = self.slab_macro_f * ENERGY_PER_FISSION # [j / cm]
        
        # calculate diffusion coefficient
        self.mu_bar = sum(
                [i.get_macro_s() * i.get_mean_cos_scatter_angle() for i in slab_elements]
            ) / self.slab_macro_s # [cm-1] equation given in the handout
        if is_isotropic:
            self.mu_bar = 0
        self.slab_macro_tr = self.slab_macro_t - self.slab_macro_s * self.mu_bar # [cm-1]
        self.slab_macro_s_tr = self.slab_macro_s - self.slab_macro_s * self.mu_bar # [cm-1]
        self.diffusion_coefficient = 1 / (3 * self.slab_macro_tr) # [cm]
        
        # define mesh
        self.mesh_intervals = round(resolution * slab_thickness) # number of intervals in the mesh
        self.mesh_points = round(resolution * slab_thickness) + 1 # number of points in the mesh, its one more because there are 2 points on the boundary
        self.delta_x = slab_thickness/self.mesh_intervals # [cm] distance between points on the mesh
        self.x_axis = np.linspace(-slab_thickness/2, slab_thickness/2, self.mesh_points) # [cm] the x values of the mesh points

        # initialize matrices
        self.macro_f_nu_matrix = product_operator(self.mesh_points, self.delta_x, np.full(self.mesh_intervals, self.slab_macro_f_nu)) # matrix to perform the fnu multiplication 
        self.diffusion_matrix = diffusion_operator(self.mesh_points, self.delta_x) * self.diffusion_coefficient # matrix for the diffusion
        self.absorption_matrix = product_operator(self.mesh_points, self.delta_x, np.full(self.mesh_intervals, self.slab_macro_a)) # matrix for the absorption
        
        self.M_matrix = self.diffusion_matrix + self.absorption_matrix # the M matrix in the handout, the iteration is trying to find the eigenvalues of this matrix
        self.M_matrix[0,0] += 1/2 # left boundary
        self.M_matrix[-1,-1] += 1/2 # right boundary
        self.M_inv = np.linalg.inv(self.M_matrix) # inverse M matrix used in the iteration

        # Analytic value of keff, for derivation see: report assignment 1
        self.kAnal = self.slab_macro_f_nu / (
            self.diffusion_coefficient/4 
            * (np.pi/(50 + 0.7104/self.slab_macro_tr))**2 + self.slab_macro_a)

        # Analytic value of phi, for derivation see: report assignment 1
        self.anal_x_axis = np.linspace(-100/2, 100/2, self.mesh_points)
        self.anal_delta_x = 100/self.mesh_intervals
        self.L = np.sqrt(self.diffusion_coefficient / ((self.slab_macro_f_nu/self.kAnal) - self.slab_macro_a))
        self.fluxAnal = np.cos(self.anal_x_axis /self.L)
        self.fluxAnal *= 1e3 / integrate(self.slab_macro_f_pow * self.fluxAnal, self.anal_delta_x) # normalize to 1000 W/cm2

        if not multiplying:
            self.slab_macro_f_nu = 0
            self.macro_f_nu_matrix = product_operator(self.mesh_points, self.delta_x, np.full(self.mesh_intervals, self.slab_macro_f_nu)) # matrix to perform the fnu multiplication 
        if use_scatter_ratio:
            self.slab_macro_s_tr = self.slab_macro_tr * scatter_ratio

        # print values
        if doPrint:
            print("Macroscopic total = " + str(self.slab_macro_t) + " cm-1")
            print("Macroscopic scatter = " + str(self.slab_macro_s) + " cm-1")
            print("Avg cosine of scattering = " + str(self.mu_bar) + " cm-1")
            print("Sigma_s * mu_bar = " + str(self.slab_macro_s * self.mu_bar) + " cm-1")
            print("Diffusion Coefficient = " + str(self.diffusion_coefficient) + " cm") # 0.5214833759422001 cm
            print("Macroscopic absorption = " + str(self.slab_macro_a) + " cm-1")
            print("Macroscopic neutron production = " + str(self.slab_macro_f_nu) + " cm-1")
            print("Analytic keff = " + str(self.kAnal))
            print("Analytic phi = A cos x/" + str(self.L))
            print("where A = " + str(np.max(self.fluxAnal)))
            print("Scatter ratio = " + str(self.slab_macro_s_tr/self.slab_macro_tr))

    def compare(self, keffIn, phiIn, doPlot = False, reference = False, refKeff = -9999.9, refPhi = np.array([-9999.9])):
        if not reference:
            refKeff = self.kAnal
            refPhi = self.fluxAnal
        print("Abs err keff = " + str(keffIn - refKeff) + " relative err = " + str((keffIn - refKeff)/refKeff))
        maxAbs = 0
        maxRel = 0
        maxAbsX = -1
        maxRelX = -1
        for j in range(self.mesh_points):
            diff = phiIn[j] - refPhi[j]
            if np.abs(diff) > np.abs(maxAbs):
                maxAbs = diff
                maxAbsX = self.x_axis[j]
            if np.abs(diff / (refPhi[j])) > np.abs(maxRel):
                maxRel = diff / (refPhi[j])
                maxRelX = self.x_axis[j]

        print("Max absolute flux err = " + str(maxAbs) + " @ " + str(maxAbsX) + ", max relative flux err = " + str(maxRel) + " @ " + str(maxRelX))
        
        if doPlot:
            plt.subplots(figsize=((8,3)))
            plt.xlim(self.x_axis[0], self.x_axis[-1])
            plt.plot(self.x_axis, phiIn, linestyle = '-', color = 'k', label=f'Discete ordinates')
            plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
            plt.plot(self.x_axis, refPhi, linestyle = '--', color = 'dimgrey', label='Diffusion')
            plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
            plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
            plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
            plt.legend(ncol=2,
                fontsize=11.5,
                columnspacing=1.5,
                handletextpad=0.6,
                frameon=True)
            plt.tight_layout()
            plt.show()
        
        return (keffIn - refKeff, maxRel)



# ----------------------Power iteration function----------------------
# - this function performs the power iteration for all of the exercises 
# - it is based on the method outlined in the handout
# - the function has many inputs to account for the different exercises
# Inputs:
# - convergenceCriteria: selects the convergence criteria, 0 is the one based on k, 1 is the one based on S [0 OR 1]
# - fluxGuess: the initial guess for phi [FLOAT ARRAY]
# - eigenGuess: the initial guess for keff [FLOAT]
# - doPlot: if plots should be made [BOOLEAN]
# - doFile: if the flux should be saved to a file (handy for plotting) [BOOLEAN]
# - saveFile: name of the file in which the flux is saved [STRING]
# - doNormalize: if the total areal flux should be set to a certain value at every iteration [BOOLEAN]
# - powerTarget: the value of power that the flux should be normalized to [FLOAT, W/cm2]
# - ic: the iteration constants containing the matrices, this is an input to reduce computation time when solving multiple times [ITERATIIONCONSTANTS OBJECT]
# Outputs:
# - float of the keff found
# - integer of number of iterations needed
# - float array of the phi found
def solvePowerIteration(
                        convergenceCriteria = 1, # 0 is k, 1 is S
                        fluxGuess = None, 
                        eigenGuess = 1.0, 
                        doPlot = True,
                        doSave = False,
                        saveFile = 'powIt.npy',
                        doNormalize = True,
                        powerTarget = 1e3, # W/cm2
                        ic = IterationConstants(resolution=10, is_isotropic=False, doPrint=False)
                        ) -> tuple[float, int, np_type.NDArray[np.float64]]:
    
    # initialize variables
    if fluxGuess is None:
        fluxNext = np.full(ic.mesh_points, 1.0)[:,np.newaxis] # phi_n+1
    else:
        fluxNext = fluxGuess[:,np.newaxis] # phi_n+1
    flux = np.array([]) # phi_n
    eigenNext = eigenGuess # keff_n+1
    eigen = None # keff_n
    eigenHist = np.array([eigenNext]) # stores the histary of keff iterations
    fluxHist = np.empty((ic.mesh_points, 0)) # stores the history of phi iterations
    fluxHist = np.append(fluxHist, fluxNext, axis=1) # add first guess
    loss = -1 # stores the error in the convergence criteria
    convIt = 1 # counts number of iterations

    # initialize the S vector
    S = np.array([]) # S_n
    SNext = ic.macro_f_nu_matrix @ fluxNext # S_n+1

    # function to check if converged
    def hasConverged(): 
        if eigen is None: # First iteration? 
            return False # return NOT CONVERGED
        
        nonlocal loss
        if convergenceCriteria == 0:
            loss = abs((eigenNext - eigen)/eigen) # |k(n+1) - k(n) / k(n)| < 0.00001
        else:
            loss = np.max(np.abs(S[:,0] - SNext[:,0])/S[:,0]) # max|S(n+1) - S(n) / S(n)| < 0.00001
        
        return loss < 0.00001 # return if converged 
    
    
    # main loop
    while not hasConverged():
        # update keff, phi and S
        eigen = eigenNext 
        flux = fluxNext
        S = SNext

        # calculate n+1 values of keff, phi and S     
        fluxNext = ic.M_inv @ ((1/eigen) * S) # phi_n+1 = M_inv * (S_n/k_n)
        SNext = ic.macro_f_nu_matrix @ fluxNext # S_n+1 = F * phi_n+1
        eigenNext = eigen * np.sum(SNext) / (np.sum(S) + 1e-99) # calculate keff_n+1

        # store values
        if doPlot or doSave: 
            eigenHist = np.append(eigenHist, eigenNext) 
            if doNormalize:
                fluxHist = np.append(fluxHist, fluxNext * powerTarget / integrate(ic.slab_macro_f_pow * fluxNext, ic.delta_x), axis=1)
            else:
                fluxHist = np.append(fluxHist, fluxNext, axis=1)

        convIt += 1 # count iteration
    
    if doNormalize: # normalize phi if necessary
        fluxNext *= powerTarget / integrate(ic.slab_macro_f_pow * fluxNext, ic.delta_x) # normalize by the fraction such that the power equals the target
        if doPlot:
            fluxHist[:,0] *= powerTarget / integrate(ic.slab_macro_f_pow * fluxHist[:,0], ic.delta_x)
        
    # save to file if necessary
    if doSave:
        np.save("eigen_" + saveFile, eigenHist)
        np.save("flux_" + saveFile, fluxHist)

    # return values found
    if not doPlot:
        return (float(eigenNext), convIt, fluxNext[:,0]) 
    
    
    # plot the iterations of k
    plt.figure(figsize=((8,3)))
    plt.plot(np.arange(len(eigenHist)) + 1, eigenHist, color = 'k', linewidth = 1.5, label="Interpolated values")
    plt.scatter(np.arange(len(eigenHist)) + 1, eigenHist, color='darkgray', marker='x', linewidths = 0.8, s = 15, label=r"$k_{eff}$ iteration values")
    plt.scatter([len(eigenHist)], [eigenHist[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, label=r"$k_{eff}$ final value")
    plt.legend(fontsize=11.5)
    plt.text(
        0.6, 0.83, 
        r"Final $k_{eff}$ = " + f"{eigenHist[-1]:.7f}\nError in " + r"$k_{eff}$" + f" = {abs((eigenNext - eigen)/eigen):.7f}\nIterations = {len(eigenHist)}",
        transform=plt.gca().transAxes,
        ha="left",
        va="top",
        fontsize=14,
        linespacing=1.5
    )  
    plt.xlabel("Iteration", fontsize=12)
    plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
    plt.tight_layout()
    plt.show()

    # plot the normalized phi of different iterations
    plt.figure(figsize=((8,3)))
    plt.xlim(-50, 50)
    plt.plot(ic.x_axis, fluxHist[:, 0], linestyle = (0, (1, 1)), color = 'red', label='Iteration 1 (guess)')
    plt.plot(ic.x_axis, fluxHist[:, 1], linestyle = "dashdot", color = 'gold', label='Iteration 2')
    plt.plot(ic.x_axis, fluxHist[:, 9], linestyle = "dashed", color = 'cyan', label='Iteration 10')
    plt.plot(ic.x_axis, fluxHist[:, 29], linestyle = (0, (3, 1, 1, 1, 1, 1)), color = 'blue', label='Iteration 30')
    plt.plot(ic.x_axis, fluxHist[:, 64], linestyle = "dotted", color = 'hotpink', label='Iteration 65')
    plt.plot(ic.x_axis, fluxHist[:, -1], linestyle = "solid", color = 'k', label='Iteration ' + f'{len(eigenHist)}' + ' (final)')
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
    plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
    plt.tight_layout()
    plt.show()

    # print the values found
    print("EV = " + str(eigenNext))
    print("loss = " + str(loss))
    print("attempts = " + str(convIt))
    

    return (float(eigenNext), convIt, fluxNext[:,0]) # return values found




def solveDiscreteOrdinates(
                        convergenceCriteria = 1, # 0 is k, 1 is S,
                        order = 12,
                        fluxGuess = None, 
                        eigenGuess = 1.0, 
                        doPlot = True,
                        doSave = False,
                        saveFile = 'discrOrd.npy',
                        doNormalize = True,
                        powerTarget = 1e3, # W/cm2
                        ic = IterationConstants(resolution=10, is_isotropic=False, doPrint=False),
                        useRectangle = False,
                        doSavePolar = False,
                        polarIt = 1300,
                        closure = 0, # 0 is Diamond-differencing, 1 is step method
                        leftSource = .0
                        ) -> tuple[float, int, np_type.NDArray[np.float64]]:
    
    # initialize variables
    if fluxGuess is None:
        fluxNext = np.full(ic.mesh_points, 1.0)[:,np.newaxis] # phi_n+1
    else:
        fluxNext = fluxGuess[:,np.newaxis] # phi_n+1
    flux = np.array([]) # phi_n
    eigenNext = eigenGuess # keff_n+1
    eigen = None # keff_n
    abscissae, weights = leggauss(order)
    if useRectangle:
        weights = np.full(order, 2/order)
        abscissae = np.linspace(-1, 1, order, endpoint=False) + 1 / order
    QNext = np.array([])
    eigenHist = np.array([eigenNext]) # stores the histary of keff iterations
    fluxHist = np.empty((ic.mesh_points, 0)) # stores the history of phi iterations
    fluxHist = np.append(fluxHist, fluxNext, axis=1) # add first guess
    loss = -1 # stores the error in the convergence criteria
    convIt = 1 # counts number of iterations

    # initialize the S vector
    S = np.array([]) # S_n
    SNext = ic.macro_f_nu_matrix @ fluxNext # S_n+1


    def getPsi(abscissa):
        psi = np.zeros(ic.mesh_points) # This will become our output angular nuetron flux. Note that the vacuum boundary condition is already set since the edges of the array are 0   
        coeff = 2 if closure == 0 else 1
        psi[0] = .0 if abscissa < 0 else leftSource

        psiPrev = 0
        for it in range(0, ic.mesh_intervals):
            if abscissa > 0:
                iNow = it 
                iNext = it + 1
            else:
                iNow = -(it + 1)
                iNext = -(it + 2)
            
            psi_int = (ic.delta_x * QNext[iNow] + coeff * np.abs(abscissa) * psiPrev) / (
                                ic.delta_x * ic.slab_macro_tr + coeff * np.abs(abscissa)
                            )
            
            if psi_int < 0:
                print("WARNING in psi sweep: less than 0!")

            psi[iNext] = 2 * psi_int - psiPrev if closure == 0 else psi_int
            psiPrev = psi[iNext]
        return psi


    # function to check if converged
    def hasConverged(): 
        if eigen is None: # First iteration? 
            return False # return NOT CONVERGED
        
        nonlocal loss
        if convergenceCriteria == 0:
            loss = abs((eigenNext - eigen)/eigen) # |k(n+1) - k(n) / k(n)| < 0.00001
        else:
            loss = np.max(np.abs(flux[:,0] - fluxNext[:,0])/flux[:,0]) # max|phi(n+1) - phi(n) / phi(n)| < 0.00001
        return loss < 0.00001 # return if converged


    # main loop
    while not hasConverged():
        # update keff, phi and S
        eigen = eigenNext 
        flux = fluxNext
        S = SNext

        # calculate n+1 values of keff, phi and S   
        QNext = interpolate((1/2) * (ic.slab_macro_s_tr + ic.slab_macro_f_nu/(eigen + 1e-99)) * flux)
        fluxNext = np.zeros(ic.mesh_points)[:, np.newaxis]
        for i in range(order):
            angFlux = getPsi(abscissae[i])[:, np.newaxis]
            fluxNext += weights[i] * angFlux

            if doSavePolar and convIt > polarIt:
                np.save(f"polar_start_{i}_" + saveFile, angFlux[0,0])
                np.save(f"polar_mid_{i}_" + saveFile, angFlux[int(np.floor(ic.mesh_points/2)),0])
                np.save(f"polar_end_{i}_" + saveFile, angFlux[-1,0])
            
        SNext = ic.macro_f_nu_matrix @ fluxNext # S_n+1 = F * phi_n+1
        eigenNext = eigen * np.sum(SNext) / (np.sum(S) + 1e-99) # calculate keff_n+1

        # store values
        if doPlot or doSave: 
            eigenHist = np.append(eigenHist, eigenNext) 
            if doNormalize:
                fluxHist = np.append(fluxHist, fluxNext * powerTarget / integrate(ic.slab_macro_f_pow * fluxNext, ic.delta_x), axis=1)
            else:
                fluxHist = np.append(fluxHist, fluxNext, axis=1)

        convIt += 1 # count iteration
        

    if doNormalize: # normalize phi if necessary
        fluxNext *= powerTarget / integrate(ic.slab_macro_f_pow * fluxNext, ic.delta_x) # normalize by the fraction such that the power equals the target
        if doPlot:
            fluxHist[:,0] *= powerTarget / integrate(ic.slab_macro_f_pow * fluxHist[:,0], ic.delta_x)

    # save to file if necessary
    if doSave:
        np.save("eigen_" + saveFile, eigenHist)
        np.save("flux_" + saveFile, fluxHist)

    # return values found
    if not doPlot:
        return (float(eigenNext), convIt, fluxNext[:,0]) 
    
    
    
    
    # plot the iterations of k
    plt.figure(figsize=((8,3)))
    plt.plot(np.arange(len(eigenHist)) + 1, eigenHist, color = 'k', linewidth = 1.5, label="Interpolated values")
    plt.scatter(np.arange(len(eigenHist)) + 1, eigenHist, color='darkgray', marker='x', linewidths = 0.8, s = 15, label=r"$k_{eff}$ iteration values")
    plt.scatter([len(eigenHist)], [eigenHist[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, label=r"$k_{eff}$ final value")
    plt.legend(fontsize=11.5)
    plt.text(
        0.6, 0.83, 
        r"Final $k_{eff}$ = " + f"{eigenHist[-1]:.7f}\nError in " + r"$k_{eff}$" + f" = {abs((eigenNext - eigen)/(eigen + 1e-99)):.7f}\nIterations = {len(eigenHist)}",
        transform=plt.gca().transAxes,
        ha="left",
        va="top",
        fontsize=14,
        linespacing=1.5
    )  
    plt.xlabel("Iteration", fontsize=12)
    plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
    plt.tight_layout()
    plt.show()

    # plot the normalized phi of different iterations
    plt.figure(figsize=((8,3)))
    plt.xlim(ic.x_axis[0], ic.x_axis[-1])
    plt.plot(ic.x_axis, fluxHist[:, 0], linestyle = (0, (1, 1)), color = 'red', alpha=1, label='Iteration 1 (guess)')
    if len(fluxHist[0, :]) > 600:
        plt.plot(ic.x_axis, fluxHist[:, 10], linestyle = "dashdot", color = 'gold', label='Iteration 10')
        plt.plot(ic.x_axis, fluxHist[:, 100], linestyle = "dashed", color = 'cyan', label='Iteration 100')
        plt.plot(ic.x_axis, fluxHist[:, 300], linestyle = (0, (3, 1, 1, 1, 1, 1)), color = 'blue', label='Iteration 300')
        plt.plot(ic.x_axis, fluxHist[:, 600], linestyle = "dotted", color = 'hotpink', label='Iteration 600')
    plt.plot(ic.x_axis, fluxHist[:, -1], linestyle = "solid", color = 'k', label='Iteration ' + f'{len(eigenHist)}' + ' (final)')
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
    plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
    plt.tight_layout()
    plt.show()
    

    # print the values found
    print("EV = " + str(eigenNext))
    print("loss = " + str(loss))
    print("attempts = " + str(convIt))
    

    return (float(eigenNext), convIt, fluxNext[:,0]) # return values found




# icBase will be used as the default settings for the following exercises
icBase = IterationConstants(resolution=10, slab_thickness = 100, is_isotropic=False, doPrint=True)




# ----------------------Exercise 1----------------------
# "Write a discrete ordinates/SN solver for 1D slab geometry problems using the Gauss-Legendre quadrature, diamond-difference closure, and a ϵ < 0.00001 convergence criterion on the flux. Report k and
# show the flux distribution for S2, S6, and S12 on a problem with identical geometry and cross sections
# to that in coursework 1. Comment on how this compares with neutron diffusion in terms of accuracy,
# number of iterations and runtime. How does this compare with your expectations? What might explain
# your observations?"


(SEigenResult, SConvNormal, SFluxResult) = solvePowerIteration(convergenceCriteria = 1, doPlot=True, ic=icBase, doSave=True)
print("Diffusion keff = " + str(SEigenResult))
icBase.compare(SEigenResult, SFluxResult)



def lpf(order = 12, doOutput = False):
    (SEigenResultDO, SConvNormalDO, SFluxResultDO) = solveDiscreteOrdinates(convergenceCriteria = 1, order=order, doPlot=doOutput, ic=icBase, doSave=doOutput)
    print("Discrete Ordinates, " + str(order) + " order --> keff = " + str(SEigenResultDO))
    icBase.compare(SEigenResultDO, SFluxResultDO)

#lp = LineProfiler()
#lp.add_function(lpf)
#lp.add_function(solvePowerIteration)
#lp.run('lpf(order=12)')
#lp.run('solvePowerIteration(convergenceCriteria = 1, doPlot=False, ic=icBase)')
#lp.print_stats()

def q1():
    lpf(order = 2, doOutput = True)
    lpf(order = 6, doOutput = True)
    lpf(order = 12, doOutput = True)

    eigenHist_powIt = np.load("eigen_powIt.npy")
    eigenHist_DiscOrd = np.load("eigen_discrOrd.npy")

    plt.figure(figsize=((7.3,3)))
    plt.plot(np.arange(len(eigenHist_DiscOrd)) + 1, eigenHist_DiscOrd, color = 'k', linewidth = 1.5, label="Discrete ordinates $k_{eff}$ iterations", zorder=0)
    plt.plot(np.arange(len(eigenHist_powIt)) + 1, eigenHist_powIt, color = 'k', linewidth = 1.5, label="Diffusion $k_{eff}$ iterations", linestyle = '--', zorder=0)
    plt.scatter([len(eigenHist_DiscOrd)], [eigenHist_DiscOrd[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, label=r"$k_{eff}$ final values", zorder=10)
    plt.scatter([len(eigenHist_powIt)], [eigenHist_powIt[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, zorder=10)
    plt.axvline(x=len(eigenHist_DiscOrd), linestyle = ':', color = 'grey', linewidth='1')
    plt.axvline(x=len(eigenHist_powIt), linestyle = ':', color = 'grey', linewidth='1')
    plt.legend(fontsize=11.5)
    plt.text(
        0.17, 0.9, 
        f"{len(eigenHist_powIt)} iterations\n",
        transform=plt.gca().transAxes,
        ha="left",
        va="top",
        fontsize=14,
        linespacing=1.5
    )  
    plt.text(
        0.965, 0.9, 
        f"{len(eigenHist_DiscOrd)} iterations\n",
        transform=plt.gca().transAxes,
        ha="right",
        va="top",
        fontsize=14,
        linespacing=1.5
    )  
    plt.xlim((0, 1050))
    plt.xlabel("Iteration", fontsize=12)
    plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
    plt.tight_layout()
    plt.show()

#q1()




# ----------------------Exercise 2----------------------
# "Set the problem length to 30 cm. Generate an S12 solution using the Gauss-Legendre quadrature
# and take this as the reference solution. Replicate the quadrature study shown in Section 1.1 of the
# Discrete Ordinates note: study the differences in the estimation of k between various orders of the
# Gauss-Legendre quadrature and a quadrature with equal spacing. Comment on the results."

def q2():
    ic30 = IterationConstants(resolution=10, slab_thickness = 30, is_isotropic=False, doPrint=False)
    ordersRect = np.array([2, 4, 6, 8, 10, 12])
    ordersLeg = np.array([2, 4, 6, 8, 10, 12])

    for order in ordersLeg:
        (keffLeg, _,  _) = solveDiscreteOrdinates(convergenceCriteria=1, order=order, doPlot=False, ic=ic30, doSave=True, saveFile=f'leg_S_{order}.npy', useRectangle=False)
        print("Legendre, " + str(order) + " order --> keff = " + str(keffLeg))
        keffHist = np.load(f"eigen_leg_S_{order}.npy")
        print()

    for order in ordersRect:
        (keffRect, _,  _) = solveDiscreteOrdinates(convergenceCriteria=1, order=order, doPlot=False, ic=ic30, doSave=True, saveFile=f'rect_S_{order}.npy', useRectangle=True)
        print("Rectangle, " + str(order) + " order --> keff = " + str(keffRect))
        print()



    plt.figure(figsize=((8,3)))

    eigenHistPlot = np.load(f"eigen_rect_S_2.npy")
    plt.plot(np.arange(len(eigenHistPlot)) + 1, eigenHistPlot, color = 'grey', linewidth = 1, label="Uniform order 2", zorder=0, linestyle = '--')
    plt.scatter([len(eigenHistPlot)], [eigenHistPlot[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, zorder=10)
    plt.axvline(x=len(eigenHistPlot), linestyle = ':', color = 'grey', linewidth='1')

    eigenHistPlot = np.load(f"eigen_rect_S_12.npy")
    plt.plot(np.arange(len(eigenHistPlot)) + 1, eigenHistPlot, color = 'grey', linewidth = 1, label="Uniform order 12", zorder=0)
    plt.scatter([len(eigenHistPlot)], [eigenHistPlot[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, zorder=10)
    plt.axvline(x=len(eigenHistPlot), linestyle = ':', color = 'grey', linewidth='1')

    eigenHistPlot = np.load(f"eigen_leg_S_2.npy")
    plt.plot(np.arange(len(eigenHistPlot)) + 1, eigenHistPlot, color = 'k', linewidth = 1, zorder=0, linestyle = '--', label="Gauss-Legendre order 2")
    plt.scatter([len(eigenHistPlot)], [eigenHistPlot[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, zorder=10)
    plt.axvline(x=len(eigenHistPlot), linestyle = ':', color = 'grey', linewidth='1')

    eigenHistPlot = np.load(f"eigen_leg_S_12.npy")
    plt.plot(np.arange(len(eigenHistPlot)) + 1, eigenHistPlot, color = 'k', linewidth = 1, label="Gauss-Legendre order 12 (reference)", zorder=0)
    plt.scatter([len(eigenHistPlot)], [eigenHistPlot[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, zorder=10, label=r"$k_{eff}$ final values")
    plt.axvline(x=len(eigenHistPlot), linestyle = ':', color = 'grey', linewidth='1')

    plt.legend(fontsize=11.5)
    plt.xlim((0, 180))
    plt.xlabel("Iteration", fontsize=12)
    plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=((8,3)))

    labeled = False
    for i in ordersLeg[:-1]:
        eigenPlot = np.load(f"eigen_leg_S_{i}.npy")[-1]
        if not labeled:
            plt.scatter([i], [eigenPlot], marker='x', color = 'k', label = r"Gauss-Legendre", zorder=10)
            labeled = True
        else:
            plt.scatter([i], [eigenPlot], marker='x', color = 'k', zorder=10)
    labeled = False
    for i in ordersRect:
        eigenPlot = np.load(f"eigen_rect_S_{i}.npy")[-1]
        if not labeled:
            plt.scatter([i], [eigenPlot], marker='o', color = 'k', label = r"Uniform", zorder=10)
            labeled = True
        else:
            plt.scatter([i], [eigenPlot], marker='o', color = 'k', zorder=10)

    eigenRef = np.load(f"eigen_leg_S_12.npy")[-1]
    plt.scatter([i], [eigenRef], marker='x', color = 'dimgrey', linewidth = 2, label = r"Reference solution", zorder=10)
    plt.axhline(y=eigenRef, linestyle = ':', color = 'grey', linewidth='1', zorder=5)

    plt.legend(fontsize=11.5)
    plt.xlabel("Order", fontsize=12)
    plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
    plt.tight_layout()

    plt.show()

#q2()


# ----------------------Exercise 3----------------------
# "Using S12 and your diffusion solver, vary the length of the problem from 5 cm to 5 m. Compare
# differences in k, the maximum relative difference in the flux, and show the number of iterations required.
# Comment on the results.
def q3():
    lengths = np.linspace(5, 500, 25)
    #lengths = [100]
    kErrHist = np.array([])
    phiErrHist = np.array([])
    itHistDO = np.array([])
    itHistDiff = np.array([])

    for l in lengths:
        icRes = IterationConstants(resolution=100/l, slab_thickness = l, is_isotropic=False, doPrint=True)
        print("Slab Length = " + str(l) + " cm")
        (keffDO, itDO, phiDO) = solveDiscreteOrdinates(convergenceCriteria = 1, order=12, doPlot=False, ic=icRes)
        print("Discrete Ordinates --> keff = " + str(keffDO) + " after " + str(itDO) + " iterations")
        (keffDiff, itDiff, phiDiff) = solvePowerIteration(convergenceCriteria = 1, doPlot=False, ic=icRes)
        print("Diffusion --> keff = " + str(keffDiff) + " after " + str(itDiff) + " iterations")

        kErr, phiErr = icRes.compare(keffDO, phiDO, reference=True, refKeff=keffDiff, refPhi=phiDiff, doPlot=True)
        kErrHist = np.append(kErrHist, kErr)
        phiErrHist = np.append(phiErrHist, phiErr)
        itHistDO = np.append(itHistDO, itDO)
        itHistDiff = np.append(itHistDiff, itDiff)
        print()


    plt.figure(figsize=((8,3)))
    plt.plot(lengths, kErrHist, color='k', linestyle = '-', linewidth = '1.5', marker = 'o')
    #plt.legend(fontsize=11.5)
    plt.ylabel(r"$k_\text{eff}^\text{DO} - k_\text{eff}^\text{Diff}$", fontsize=12)
    plt.xlabel(r"Slab length [cm]", fontsize=12)
    plt.yscale('log')
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=((8,3)))
    plt.plot(lengths, -phiErrHist, color='k', linestyle = '-', linewidth = '1.5', marker = 'o')
    #plt.legend(fontsize=11.5)
    plt.ylabel(r"Max $|\phi^\text{DO} - \phi^\text{Diff}|/\phi^\text{Diff}$", fontsize=12)
    plt.xlabel(r"Slab length [cm]", fontsize=12)
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=((8,3)))
    plt.plot(lengths, itHistDO, color='k', linestyle = '-', linewidth = '1.5', marker = 'o', label="Discrete ordinates")
    plt.plot(lengths, itHistDiff, color='k', linestyle = '--', linewidth = '1.5', marker = 'x', label="Diffusion")
    plt.legend(fontsize=11.5)
    plt.ylabel("Iterations", fontsize=12)
    plt.xlabel(r"Slab length [cm]", fontsize=12)
    plt.tight_layout()
    plt.show()

#q3()



# ----------------------Exercise 4----------------------
# "Fix the problem length at 100 cm and the quadrature at S12. On the final iteration of your simulation,
# store and report the angular fluxes in all direction in the centre of your problem and close to one of
# the edges. Plot these in polar co-ordinates and comment on the results. "

def q4():
    solveDiscreteOrdinates(convergenceCriteria = 1, order=12, doPlot=False, ic=icBase, doSavePolar=True, polarIt=1370)

    angFluxStart = np.array([])
    angFluxMid = np.array([])
    angFluxEnd = np.array([])
    abscissae, _ = leggauss(12)
    angles = np.arccos(abscissae)

    for i in range(12):
        angFluxStart = np.append(angFluxStart, np.load(f"polar_start_{i}_discrOrd.npy"))
        angFluxMid = np.append(angFluxMid, np.load(f"polar_mid_{i}_discrOrd.npy"))
        angFluxEnd = np.append(angFluxEnd, np.load(f"polar_end_{i}_discrOrd.npy"))

    angFluxStart = np.append(angFluxStart, np.flip(angFluxStart))
    angFluxMid = np.append(angFluxMid, np.flip(angFluxMid))
    angFluxEnd = np.append(angFluxEnd, np.flip(angFluxEnd))
    angles = np.append(angles, -np.flip(angles))

    angFluxStart = np.append(angFluxStart, angFluxStart[0])/(2 * np.pi)
    angFluxMid = np.append(angFluxMid, angFluxMid[0])/(2 * np.pi)
    angFluxEnd = np.append(angFluxEnd, angFluxEnd[0])/(2 * np.pi)
    angles = np.append(angles, angles[0])

    plt.figure(figsize=((4,4)))
    plt.polar(angles, angFluxStart, color = 'k', linewidth = 1)
    plt.fill(angles, angFluxStart, alpha=0.3, color = 'gray') 
    plt.yticks([0.005, 0.01, 0.015])
    plt.show()

    plt.figure(figsize=((4,4)))
    plt.polar(angles, angFluxMid, color = 'k')
    plt.fill(angles, angFluxMid, alpha=0.3, color = 'gray', linewidth = 1)
    plt.yticks([0.05,0.1, 0.15, 0.2])
    plt.show()

    plt.figure(figsize=((4,4)))
    plt.polar(angles, angFluxEnd, color = 'k', linewidth = 1)
    plt.fill(angles, angFluxEnd, alpha=0.3, color = 'gray')
    plt.yticks([0.005, 0.01, 0.015])
    plt.show()

#q4()




# ----------------------Exercise 5----------------------
# "Fix the problem length at 100 cm and the quadrature at S12. Generate a reference solution and then
# vary the mesh size using both the diamond-difference closure and the step closure. Examine and
# comment on the maximum relative flux error versus mesh size. "

def q5():
    phiErrHistDiamond = np.array([]) # stores the maximum relative phi error found at different resolutions for diamond-difference
    phiErrHistStep = np.array([]) # stores the maximum relative phi error found at different resolutions for step

    res = np.arange(0.02, 1.01, 0.01) # [points/cm] resolutions to be checked
    res = np.arange(1, 5.1, 0.1) # [points/cm] resolutions to be checked

    # find the ultimate value
    print()
    print("Convergence at 100 points/cm:")
    print("diamond-->")
    ic = IterationConstants(resolution=100, is_isotropic=False, doPrint=False) # generate new iteration constants object with the resolution i
    #(eigenRes, iter, flux) = solveDiscreteOrdinates(ic=ic, doPlot=False) # solve the power iteration
    #_, fluxErrFinD = ic.compare(eigenRes, flux, doPlot=False)
    fluxErrFinD = 0.18641535374455748 # @ 50
    print("ERROR = " + str(fluxErrFinD))
    print("step-->")
    #(eigenRes, iter, flux) = solveDiscreteOrdinates(ic=ic, doPlot=False, closure=1) # solve the power iteration
    #_, fluxErrFinS = ic.compare(eigenRes, flux, doPlot=False)
    fluxErrFinS = 0.18261859862294094 # @ 50
    print("ERROR = " + str(fluxErrFinS))
    print()

    # loop1: diamond-difference
    # plot for phi
    plt.figure(figsize=((8,3)))
    plt.xlim(-51, 51)
    plt.plot(icBase.x_axis, icBase.fluxAnal, linestyle = "solid", color = 'lightgray', linewidth = 2, label='Analytic') # plot the analytic phi
    for i in res:
        print()
        print(f"Resolution = {i} points/cm")
        ic = IterationConstants(resolution=i, is_isotropic=False, doPrint=False) # generate new iteration constants object with the resolution i
        (eigenRes, iter, flux) = solveDiscreteOrdinates(ic=ic, doPlot=False) # solve the power iteration

        # determine and store the error
        _, fluxErr = ic.compare(eigenRes, flux, doPlot=False)
        phiErrHistDiamond = np.append(phiErrHistDiamond, fluxErr)

        # plot phi
        if np.isclose(i, 0.02):
            plt.scatter(ic.x_axis, flux, marker='x', linewidths = 0.8, s = 15, color = 'red', label='0.02 points/cm')
        if np.isclose(i, 0.03):
            plt.scatter(ic.x_axis, flux, marker='o', linewidths = 0.8, s = 15, color = 'gold', label='0.03 points/cm')
        if np.isclose(i, 0.05):
            plt.scatter(ic.x_axis, flux, marker='1', linewidths = 1.5, s = 50, color = 'teal', label='0.05 points/cm')
        if np.isclose(i, 0.1):
            plt.scatter(ic.x_axis, flux, marker='^', linewidths = 0.8, s = 15, color = 'blue', label='0.1 points/cm')
        if np.isclose(i, 1):
            plt.plot(ic.x_axis, flux, linestyle = "dotted", color = 'k', label='1 points/cm', linewidth = 1.5)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
    plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
    plt.tight_layout()
    plt.show()


    # loop2: step
    # plot for phi
    plt.figure(figsize=((8,3)))
    plt.xlim(-51, 51)
    plt.plot(icBase.x_axis, icBase.fluxAnal, linestyle = "solid", color = 'lightgray', linewidth = 2, label='Analytic') # plot the analytic phi
    for i in res:
        print()
        print(f"Resolution = {i} points/cm")
        ic = IterationConstants(resolution=i, is_isotropic=False, doPrint=False) # generate new iteration constants object with the resolution i
        (eigenRes, iter, flux) = solveDiscreteOrdinates(ic=ic, doPlot=False, closure=1) # solve the power iteration

        # determine and store the error
        _, fluxErr = ic.compare(eigenRes, flux, doPlot=False)
        phiErrHistStep = np.append(phiErrHistStep, fluxErr)

        # plot phi
        if np.isclose(i, 0.02):
            plt.scatter(ic.x_axis, flux, marker='x', linewidths = 0.8, s = 15, color = 'red', label='0.02 points/cm')
        if np.isclose(i, 0.03):
            plt.scatter(ic.x_axis, flux, marker='o', linewidths = 0.8, s = 15, color = 'gold', label='0.03 points/cm')
        if np.isclose(i, 0.05):
            plt.scatter(ic.x_axis, flux, marker='1', linewidths = 1.5, s = 50, color = 'teal', label='0.05 points/cm')
        if np.isclose(i, 0.1):
            plt.scatter(ic.x_axis, flux, marker='^', linewidths = 0.8, s = 15, color = 'blue', label='0.1 points/cm')
        if np.isclose(i, 1):
            plt.plot(ic.x_axis, flux, linestyle = "dotted", color = 'k', label='1 points/cm', linewidth = 1.5)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
    plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
    plt.tight_layout()
    plt.show()



    plt.figure(figsize=((8,3)))
    plt.plot(res, -phiErrHistDiamond, color='k', linestyle = '-', linewidth = '1', marker = 'o', markersize=3, label = "Diamond-difference")
    plt.plot(res, np.abs(phiErrHistStep), color='k', linestyle = '--', linewidth = '1', marker = 'x', markersize=3, label = 'Step method')
    plt.legend(fontsize=11.5)
    plt.ylabel(r"Max $|\phi^\text{DO} - \phi^\text{An.}|/\phi^\text{An.}$", fontsize=12)
    plt.xlabel(r"Resolution [points/cm]", fontsize=12)
    plt.tight_layout()
    plt.show()

#q5()





# ----------------------Exercise 6----------------------
# "Fix the problem length at 100 cm and the quadrature at S12. Modify the solver such that there is a
# source of neutrons at the left boundary which is isotropic across the half-sphere of directions pointing
# to the right. The boundary remains vacuum otherwise. Define c = Σs/Σtr as the scattering ratio.
# Make the slab non-multiplying but keep the value of Σtr fixed as before. Produce a series of flux plots
# while varying the value of c over a wide range. Comment on the number of iterations required and
# physical behaviour of the system as c is varied. Also report and comment on any strange numerical
# behaviour observed. "


def q6():
    #scatter_ratios = [1.0e-03, 3.0e-03, 5.0e-03, 1.0e-02, 3.0e-02, 5.0e-02]
    #scatter_ratios = [0.1, 0.3, 0.5, 0.9, 0.93, 0.95]
    #scatter_ratios = [0.99, 0.992, 0.994, 0.996, 0.997, 0.998]
    #scatter_ratios = [0.999, 0.9993, 0.9995, 0.9999, 0.99999, 1]
    scatter_ratios = [1]
    color = ['k', 'dimgrey', 'darkgrey', 'k', 'dimgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey', 'darkgrey']
    linestyle = ['-', '-', '-', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--', '--']
    itHist = np.array([])
    plt.figure(figsize=((8,3)))

    for i in range(len(scatter_ratios)):
        c = scatter_ratios[i]
        icC = IterationConstants(use_scatter_ratio=True, scatter_ratio=c, multiplying=False)
        eigen, it, flux = solveDiscreteOrdinates(convergenceCriteria = 1, doPlot=True, ic=icC, leftSource=.5, doNormalize=False)
        print("Iterations = " + str(it))
        itHist = np.append(itHist, it)
        #plt.xlim(-50, -46) # 2
        #plt.xlim(icC.x_axis[0], icC.x_axis[-1])
        #plt.ylim(-0.1, 2)
        #plt.ylim(-1e-3 * 0.1, 1e-3) # 1
        #plt.ylim(-0.2e-1 * 0.1, 0.2e-1) # 3
        #plt.ylim(-0.1 * 0.1, 0.1) # 4
        #plt.ylim(-0.5 * 0.1, 0.5) # 5
        plt.plot(icC.x_axis, flux, linestyle = linestyle[i], color = color[i], linewidth = 1, label=f'c={c}')

    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
    plt.legend(ncol=1,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
    plt.tight_layout()
    plt.show()

    #np.save("scatter_1.npy", scatter_ratios)
    #np.save("iterations_1.npy", itHist)
    #np.save("scatter_2.npy", scatter_ratios)
    #np.save("iterations_2.npy", itHist)
    #np.save("scatter_3.npy", scatter_ratios)
    #np.save("iterations_3.npy", itHist)
    #np.save("scatter_4.npy", scatter_ratios)
    #np.save("iterations_4.npy", itHist)
    
    scatter_ratios = np.array([])
    itHist = np.array([])
    
    scatter_ratios = np.append(scatter_ratios,np.load("scatter_1.npy"))
    itHist = np.append(itHist, np.load("iterations_1.npy"))
    scatter_ratios = np.append(scatter_ratios,np.load("scatter_2.npy"))
    itHist = np.append(itHist, np.load("iterations_2.npy"))
    scatter_ratios = np.append(scatter_ratios,np.load("scatter_3.npy"))
    itHist = np.append(itHist, np.load("iterations_3.npy"))
    scatter_ratios = np.append(scatter_ratios,np.load("scatter_4.npy"))
    itHist = np.append(itHist, np.load("iterations_4.npy"))

    order = np.argsort(scatter_ratios)
    scatter_ratios = scatter_ratios[order]
    itHist = itHist[order]


    plt.figure(figsize=((8,3)))
    plt.plot(scatter_ratios, itHist, color='k', linestyle = '-', linewidth = '1.5', marker = 'o', label="Diffusion")
    #plt.legend(fontsize=11.5)
    plt.ylabel("Iterations", fontsize=12)
    plt.xlabel(r"Scattering Ratio, $c$", fontsize=12)
    #plt.xscale('log')
    #plt.yscale('log')
    plt.tight_layout()
    plt.show()

q6()


# ----------------------Exercise 7----------------------
# see: FILENAME








