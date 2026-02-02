# Code written for NE8 Computational Reactor Modelling Assignment 1 - Diffusion
# Andy Zhang
# January 2026

# This code is loosely based on the method outlined in the "NE8 Workshop 1 Finite Elements_Handout (1).pdf" handout

# Naming convention: (slightly unual but i've always used these as it helps me more easily determine what a variable is)
# CONSTANTS
# derived_constants
# mathematical_functions()
# regularVariables
# regularFunctions()

# Import packages
import numpy as np
import numpy.typing as np_type
import copy
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from line_profiler import LineProfiler

# Universal Constants
AVOGADRO_CONSTANT = 6.02214076e23 # per mol
ELEMENTARY_CHARGE = 1.602176634e-19 # C

# Randomizer
SEED = 1 # Set seed to a constant so the graphs in exercise 3 are deterministic
np.random.seed(SEED)



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
XE135 = Element(
    microC = 2.200e5, # [barns]
    microS = 6.99340, # [barns]
    fission_yield = 0.0640 # [per fission] (cumulative)
)
SM149 = Element(
    microC = 7.200e3, # [barns]
    microS = 8.65770, # [barns]
    fission_yield = 0.0113 # [per fission] (cumulative)
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
SLAB_THICKNESS = 100 # [cm]
FUEL_ENRICHMENT = 0.035 # weight fraction
ENERGY_PER_FISSION= MeV_to_j(200.0) # [J]
XE135_HALF_LIFE = 9.1 * 60 * 60 # [s]

# Atomic mass from: https://www-nds.iaea.org/relnsd/vcharthtml/VChartHTML.html
U235.mass = 235.0439281 # [u]
U238.mass = 238.0507869 # [u]
XE135.mass = 134.907231 # [u]
SM149.mass = 148.9171912 # [u]
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

# macroscopic crosssection calculations
slab_macro_t = sum([i.get_macro_t() for i in slab_elements]) # [cm-1]
slab_macro_s = sum([i.get_macro_s() for i in slab_elements]) # [cm-1]
slab_macro_a = sum([i.get_macro_a() for i in slab_elements]) # [cm-1]
slab_macro_f = sum([i.get_macro_f() for i in slab_elements]) # [cm-1]
slab_macro_f_nu = sum([i.get_macro_f_nu() for i in slab_elements]) # [cm-1]
slab_macro_f_pow = slab_macro_f * ENERGY_PER_FISSION # [j / cm]

SM149.number_density = SM149.fission_yield * slab_macro_f / SM149.get_micro_a() # [cm-3] equation given in NE1 lecture 10 notes

# ----------------------Iteration constants class----------------------
# - this class stores constants that may chagne depending on the exercise
class IterationConstants:
    def __init__(self,
                    resolution = 10, # [cells/cm] mesh resolution
                    is_isotropic = False, # For exercise 5: This boolean changes the scattering to isotromic by setting the average scattering angle mu_bar to 0. 
                    doPrint = True # Print the outputs?
                ):
        
        # calculate diffusion coefficient
        self.mu_bar = sum(
                [i.get_macro_s() * i.get_mean_cos_scatter_angle() for i in slab_elements]
            ) / slab_macro_s # [cm-1] equation given in the handout
        if is_isotropic:
            self.mu_bar = 0
        self.slab_macro_tr = slab_macro_t - slab_macro_s * self.mu_bar # [cm-1]
        self.diffusion_coefficient = 1 / (3 * self.slab_macro_tr) # [cm]
        
        # define mesh
        self.mesh_intervals = round(resolution * SLAB_THICKNESS) # number of intervals in the mesh
        self.mesh_points = round(resolution * SLAB_THICKNESS) + 1 # number of points in the mesh, its one more because there are 2 points on the boundary
        self.delta_x = SLAB_THICKNESS/self.mesh_intervals # [cm] distance between points on the mesh
        self.x_axis = np.linspace(-SLAB_THICKNESS/2, SLAB_THICKNESS/2, self.mesh_points) # [cm] the x values of the mesh points

        # initialize matrices
        self.macro_f_nu_matrix = product_operator(self.mesh_points, self.delta_x, np.full(self.mesh_intervals, slab_macro_f_nu)) # matrix to perform the fnu multiplication 
        self.diffusion_matrix = diffusion_operator(self.mesh_points, self.delta_x) * self.diffusion_coefficient # matrix for the diffusion
        self.absorption_matrix = product_operator(self.mesh_points, self.delta_x, np.full(self.mesh_intervals, slab_macro_a)) # matrix for the absorption
        self.M_matrix = self.diffusion_matrix + self.absorption_matrix # the M matrix in the handout, the iteration is trying to find the eigenvalues of this matrix
        self.M_matrix[0,0] += 1/2 # left boundary
        self.M_matrix[-1,-1] += 1/2 # right boundary
        self.M_inv = np.linalg.inv(self.M_matrix) # inverse M matrix used in the iteration

        # print values
        if doPrint:
            print("Macroscopic total = " + str(slab_macro_t) + " cm-1")
            print("Macroscopic scatter = " + str(slab_macro_s) + " cm-1")
            print("Avg cosine of scattering = " + str(self.mu_bar) + " cm-1")
            print("Sigma_s * mu_bar = " + str(slab_macro_s * self.mu_bar) + " cm-1")
            print("Diffusion Coefficient = " + str(self.diffusion_coefficient) + " cm") # 0.5214833759422001 cm
            print("Macroscopic absorption = " + str(slab_macro_a) + " cm-1")
            print("Macroscopic neutron production = " + str(slab_macro_f_nu) + " cm-1")



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
def solvePowerIteration(convergenceCriteria = 1, # 0 is k, 1 is S
                        fluxGuess = None, 
                        eigenGuess = 1.0, 
                        doPlot = True,
                        doSave = False,
                        saveFile = 'flux.npy',
                        doNormalize = False,
                        powerTarget = 100e3, # W/cm2
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

    # normalize the flux if necessary
    if doNormalize:
        fluxNext *= powerTarget / integrate(slab_macro_f_pow * fluxNext, ic.delta_x)

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
            loss = np.max(np.abs(S[0] - SNext[0])/S[0]) # max|S(n+1) - S(n) / S(n)| < 0.00001
        
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
        if doNormalize: # normalize phi if necessary
            powErrRatio = powerTarget / integrate(slab_macro_f_pow * fluxNext, ic.delta_x) # calculate fraction by which phi and S need to be changed
            fluxNext *= powErrRatio # rescale phi_n+1
            S *= powErrRatio # rescale S_n
            SNext *= powErrRatio # rescale S_n+1
        eigenNext = eigen * np.sum(SNext) / np.sum(S) # calculate keff_n+1

        # store values
        if doPlot: 
            eigenHist = np.append(eigenHist, eigenNext) 
            fluxHist = np.append(fluxHist, fluxNext, axis=1)

        convIt += 1 # count iteration
        
    # save to file if necessary
    if doSave:
        np.save(saveFile, fluxNext)

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
    fluxHist_norm = copy.deepcopy(fluxHist)
    for i in range(len(fluxHist_norm[0])):
        fluxHist_norm[:, i] /= integrate(fluxHist_norm[:,i], ic.delta_x)
    plt.figure(figsize=((8,3)))
    plt.xlim(-50, 50)
    plt.plot(ic.x_axis, fluxHist_norm[:, 0], linestyle = (0, (1, 1)), color = 'red', alpha=0.2, label='Iteration 1 (guess)')
    plt.plot(ic.x_axis, fluxHist_norm[:, 1], linestyle = "dashdot", color = 'gold', label='Iteration 2')
    plt.plot(ic.x_axis, fluxHist_norm[:, 9], linestyle = "dashed", color = 'cyan', label='Iteration 10')
    plt.plot(ic.x_axis, fluxHist_norm[:, 29], linestyle = (0, (3, 1, 1, 1, 1, 1)), color = 'blue', label='Iteration 30')
    plt.plot(ic.x_axis, fluxHist_norm[:, 64], linestyle = "dotted", color = 'hotpink', label='Iteration 65')
    plt.plot(ic.x_axis, fluxHist_norm[:, -1], linestyle = "solid", color = 'k', label='Iteration ' + f'{len(eigenHist)}' + ' (final)')
    #plt.plot(ic.x_axis, fluxHist_norm[:, 0], linestyle = (0, (1, 1)), color = 'red', alpha = 0.2, label='Iteration 1 (guess)')
    #plt.plot(ic.x_axis, fluxHist_norm[:, 1], linestyle = "dashdot", color = 'gold', label='Iteration 2')
    #plt.plot(ic.x_axis, fluxHist_norm[:, 9], linestyle = "dashed", color = 'cyan', label='Iteration 10')
    #plt.plot(ic.x_axis, fluxHist_norm[:, 19], linestyle = (0, (3, 1, 1, 1, 1, 1)), color = 'blue', label='Iteration 20')
    #plt.plot(ic.x_axis, fluxHist_norm[:, 39], linestyle = "dotted", color = 'hotpink', label='Iteration 40')
    #plt.plot(ic.x_axis, fluxHist_norm[:, -1], linestyle = "solid", color = 'k', label='Iteration ' + f'{len(eigenHist)}' + ' (final)')
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel("Normalized flux", fontsize=12)
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

# ----------------------Exercise 1----------------------
# -"Calculate all the macroscopic constants (D, Σa, and νΣf ) necessary for solving the neutron diffusion equation for the slab."

# icBase will be used as the default settings for the following exercises
icBase = IterationConstants(resolution=10, is_isotropic=False, doPrint=True)

# ----------------------Exercise 2----------------------
# -"Solve the diffusion equation using the finite element approach and source iteration method."
(kEigenResult, kConvNormal, kFluxResult) = solvePowerIteration(convergenceCriteria = 0, doPlot=True, ic=icBase)
(SEigenResult, SConvNormal, SFluxResult) = solvePowerIteration(convergenceCriteria = 1, doPlot=True, ic=icBase)

print("Convergence k keff = " + str(kEigenResult))
print("Convergence S keff = " + str(SEigenResult))
print("difference in keff = " + str(SEigenResult - kEigenResult))



# ----------------------Exercise 3----------------------
# - "Repeat the calculations using initial guesses for the flux values at each mesh point which are random numbers sampled from a uniform distribution between 0 and 2."
# - I used this function to optimize the power iteration (make it faster) 
# Inputs:
# - Samples: number of times to generate a new random flux array [INTEGER]
# - Convergence criteria: 0 is k criteria, 1 is S criteria [0 OR 1]
def q3(samples = 1000, convergenceCriteria = 1):
    convItHist = np.array([]) # array to store the number of iterations needed

    # main loop
    for i in range(samples):
        fluxRand = np.random.uniform(0, 2, size=icBase.mesh_points) # generate a random phi with uniform distribution
        (_, conv, _) = solvePowerIteration(convergenceCriteria = convergenceCriteria, fluxGuess=fluxRand, eigenGuess = 1.0, doPlot = i in [0, 100], ic=icBase) # solve the power iteration
        print(str(i) + " " + str(conv)) # print the iterations needed
        convItHist = np.append(convItHist, conv) # store the number of iterations

    bins = np.arange(convItHist.min() - 0.5, convItHist.max() + 1.5, 1)

    # plot a histogram
    plt.figure(figsize=([8,4]))
    (_, edges, _) = plt.hist(
        convItHist,
        bins=bins,
        facecolor="lightgrey",
        linewidth=1
    )

    # calculate mu, U_mu and sigma
    mean = np.mean(convItHist)
    std = np.std(convItHist, ddof=1)
    meanU = std / np.sqrt(convItHist.size)

    # generates the gaussian
    # note the gaussian is not plotted for S convergence as it is not normally distributed
    x = np.linspace(edges[0], edges[-1], 500)
    pdf = (1/(std*np.sqrt(2*np.pi))) * np.exp(-0.5*((x - mean)/std)**2) * samples
    if convergenceCriteria == 0:
        plt.plot(x, pdf, color = "dimgray", linestyle="solid", linewidth=1.3, label="Gaussian fit")
        refernceIterations = kConvNormal
    else: 
        refernceIterations = SConvNormal

    # finish plot
    plt.axvline(refernceIterations, linestyle="dashdot", linewidth=1.5, color="k", label="Reference iterations")
    plt.axvline(mean, linestyle="--", linewidth=1.5, color="dimgray", label="Sample mean")
    plt.axvline(float(mean - std), color="grey", linestyle=":", linewidth=1, label="Standard deviation")
    plt.axvline(float(mean + std), color="grey", linestyle=":", linewidth=1)
    plt.xlabel("Iterations", fontsize=12)
    plt.ylabel("Counts", fontsize=12)
    plt.legend(fontsize=11.5)
    plt.tight_layout()
    plt.show()

    # print results
    print("Mean (mu) = " + str(mean))
    print("Std (sigma) = " + str(std))
    print("Uncertainty in mean (SE) = " + str(meanU) + "(N=" + str(convItHist.size))

# Uncomment the lines below to run lineprofiler on exercise 3, really handy for optimization
#lp = LineProfiler()
#lp.add_function(q3)
#lp.add_function(solvePowerIteration)
#lp.run('q3()')
#lp.print_stats()

# Uncomment to run exercise 3
#q3(samples = 10000, convergenceCriteria = 0)
#q3(samples = 10000, convergenceCriteria = 1)




#----------------------Exercise 4----------------------
#- "Obtain the analytic solution to the problem and an analytic value of k. Perform a mesh-size sensitivity study"


def q4():

    # Analytic value of keff, for derivation see: report
    kAnal = slab_macro_f_nu / (
        icBase.diffusion_coefficient/4 
        * (np.pi/(50 + 0.7104/icBase.slab_macro_tr))**2 + slab_macro_a)
    print("Analytic keff = " + str(kAnal))

    # Analytic value of phi, for derivation see: report
    L = np.sqrt(icBase.diffusion_coefficient / ((slab_macro_f_nu/kAnal) - slab_macro_a))
    fluxAnal = np.cos(icBase.x_axis/L)

    eigenResHist = np.array([]) # stores the keff found at different resolutions
    res = np.arange(0.02, 1, 0.01) # [points/cm] resolutions to be checked

    # loop 1: plotting keff
    for i in res:
        ic = IterationConstants(resolution=i, is_isotropic=False, doPrint=False) # generate new iteration constants object with the resolution i
        (eigenRes, iter, _) = solvePowerIteration(convergenceCriteria=1, ic=ic, doPlot=False) # solve the power iteration
        print(str(i) + " cells/cm --> keff = " + str(eigenRes) + " after " + str(iter) + " iterations") # print the outputs
        eigenResHist = np.append(eigenResHist, eigenRes) # store keff
    
    # plot the result
    plt.figure(figsize=((8,3)))
    plt.plot(res, eigenResHist, color = 'k', linewidth = 1.5, label="Interpolated values")
    plt.scatter(res, eigenResHist, color='darkgray', marker='x', linewidths = 0.8, s = 15, label=r"$k_{eff}$ estimations")
    plt.hlines(kAnal, res[0], res[-1], colors = 'gray', linestyle = 'dotted', linewidth=1, label="Analytic")
    plt.legend(fontsize=11.5)
    plt.text(
        0.6, 0.83, 
        r"First $k_{eff}$ = " + f"{eigenResHist[0]:.7f}\nFinal " + r"$k_{eff}$" + f" = {eigenResHist[-1]:.7f}\nAnalytic " + r"$k_{eff}$" + f" = {kAnal:.7f}",
        transform=plt.gca().transAxes,
        ha="left",
        va="top",
        fontsize=14,
        linespacing=1.5
    )  
    plt.xlabel("Resolution [points/cm]", fontsize=12)
    plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
    plt.tight_layout()
    plt.show()


    res = np.array([0.02, 0.03, 0.04, 0.05, 0.1, 1, 10, 100]) # resolutions for plotting the flulx
    analArea = integrate(fluxAnal, icBase.delta_x) # area of the analytic phi
    fluxAnal /= analArea # normalize phi

    # now phi will be plotted
    plt.figure(figsize=((8,3)))
    plt.xlim(-51, 51)
    plt.plot(icBase.x_axis, fluxAnal, linestyle = "solid", color = 'lightgray', linewidth = 2, label='Analytic') # plot the analytic phi

    # loop2: plotting phi
    for i in res:
        ic = IterationConstants(resolution=i, is_isotropic=False, doPrint=False) # generate new iteration constants object with the resolution i
        (eigenRes, iter, flux) = solvePowerIteration(convergenceCriteria=1, ic=ic, doPlot=False) # solve the power iteration
        flux /= integrate(flux, ic.delta_x) # normalize

        # determine and print the error
        maxAbs = 0
        maxRel = 0
        maxAbsX = -1
        maxRelX = -1
        for j in range(len(ic.x_axis)):
            diff = np.abs(flux[j] - np.cos(ic.x_axis[j]/L)/analArea)
            if diff > maxAbs:
                maxAbs = diff
                maxAbsX = ic.x_axis[j]
            if diff / np.cos(ic.x_axis[j]/L)/analArea > maxRel:
                maxRel = diff
                maxRelX = ic.x_axis[j]
        print("Max absolute flux err = " + str(maxAbs) + " @ " + str(maxAbsX) + ", max relative flux err = " + str(maxRel) + " @ " + str(maxRelX))
        print(str(i) + " cells/cm --> keff = " + str(eigenRes) + " after " + str(iter) + " it. error of " + str(kAnal - eigenRes))

        # plot phi
        if i == 0.02:
            plt.scatter(ic.x_axis, flux, marker='x', linewidths = 0.8, s = 15, color = 'red', label='0.02 points/cm')
        if i == 0.03:
            plt.scatter(ic.x_axis, flux, marker='o', linewidths = 0.8, s = 15, color = 'gold', label='0.03 points/cm')
        if i == 0.05:
            plt.scatter(ic.x_axis, flux, marker='1', linewidths = 1.5, s = 50, color = 'teal', label='0.05 points/cm')
        if i == 0.1:
            plt.scatter(ic.x_axis, flux, marker='^', linewidths = 0.8, s = 15, color = 'blue', label='0.1 points/cm')
        if i == 1:
            plt.plot(ic.x_axis, flux, linestyle = "dotted", color = 'k', label='1 points/cm', linewidth = 1.5)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel("Normalized flux", fontsize=12)
    plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True)
    plt.tight_layout()
    plt.show()

# uncomment to run exercise 4
#q4()




#----------------------Exercise 5----------------------
#- "Using your code, show and explain the effect of scattering anisotropy on reactor criticality.


def q5():
    # Generate the iteration constants using IS_ISOTROPIC = True.
    # This changes the diffusion coefficient to:  0.4369374149600331 cm
    # comapared to the original value of:         0.5214833759422001 cm
    ic5 = IterationConstants(resolution=10, is_isotropic=True, doPrint=True) 

    # Solve and compare power iterations for both the anisotropic and the isotropic case
    # For accuracy use the fission source criterion: CONVERGENCE_CRITERIA = 1
    # This results in:   keff = 1.4379050678144036
    # Compared to:       keff = 1.4362695035684803 (original)
    # A difference of:  DKeff = 0.0016355642459233
    (eigenAniso, _ ,fluxAniso) = solvePowerIteration(convergenceCriteria=1, ic=icBase)
    (eigenIso, _ ,fluxIso) = solvePowerIteration(convergenceCriteria=1, ic=ic5)
    print("Isotropic keff = " + str(eigenIso))
    print("Anisotropic keff = " + str(eigenAniso))
    print("A difference of: " + str(eigenIso - eigenAniso))

    # normalize
    fluxIso /= integrate(fluxIso, icBase.delta_x)
    fluxAniso /= integrate(fluxAniso, icBase.delta_x)

    # plot
    plt.figure(figsize=((16,5)))
    plt.xlim(-50, 50)
    plt.plot(icBase.x_axis, fluxAniso, linestyle = "-", color = 'k', label='Anisotropic scattering')
    plt.plot(icBase.x_axis, fluxIso, linestyle = '--', color = 'red', label='Isotropic scattering')
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.xlabel(r"Position, $x$ [cm]", fontsize=12)
    plt.ylabel("Normalized flux", fontsize=12)
    plt.legend(ncol=2,
        fontsize=11.5,
        columnspacing=1.5,
        handletextpad=0.6,
        frameon=True,
        loc="lower center")
    plt.tight_layout()
    plt.show()

# uncomment to run exercise 5
#q5()



#----------------------Exercise 6----------------------
#- "Modify the calculation scheme such that the flux is normalised to a fixed fission power production per unit area, P = 100kW/cm2, during each step of the power iteration. 
#- Having done so, suggest and implement a calculation procedure for obtaining the steady-state flux distribution and criticality in the presence of the fission products Xe135 and Sm149."


# As explained in the report, the idea behind the algorithm below is that after each power iteration, the equilibrium value of the fission products are recalculated
# This should result in an equilibrium value to eventually be found. The convergence condition is based on when the change in fission product concentration becomes minimal
# The code below runs this algorithm for multiple equilibrium powers.

exit() # <--- COMMENT TO RUN EXERCISE 6


ic6 = copy.deepcopy(icBase) # ic6 will be used for modidifying the M matrix
eigenPowHist = np.array([]) # stores the history of keff found at different powers
pows = np.linspace(10e6, 1000e6, 100) # [W/cm2] power to be explored
(eigenNoFP, _, fluxNoFP) = solvePowerIteration(ic=icBase) # the default (fission-product-less) solution 


# main loop over the different power levels
for pow in pows:

    # Initialize variables for the power iteration
    # Note that variables ending in "Next" are the n+1 (next iteration) guesses
    fluxNoFP *= pow / integrate(slab_macro_f_pow * fluxNoFP, icBase.delta_x) # normalize the FP-free solution to the correct power level
    fluxFP = copy.deepcopy(fluxNoFP) # [W/cm-2] this copy is a good initial guess for what the flux should look like
    eigenFP = eigenNoFP # again this should be a good guess for what the eigenvalue looks like
    fluxInterval = (fluxFP[:-1] + fluxFP[1:])/2 # this array stores the average value of phi between 2 mesh points (on the interval), used in the next step
    xenonPopNext = XE135.fission_yield * slab_macro_f * fluxInterval / (
        np.log(2)/XE135_HALF_LIFE + XE135.get_micro_a() * fluxInterval) # [/cm3], calculate the initial number density of xenon using the equilibrium xenon equation
    xenonPop = None # current xenon number density guess (starts empty)
    xeLossHist = np.array([]) # stores the error in the xenon convergence criteria
    powIt = 1 # counts the iteration number

    # function that calculates the macroscopic absorption WITH fussion products
    def get_tot_macro_a():
        return SM149.get_macro_a() + xenonPop * XE135.get_micro_a() + slab_macro_a

    # xenon convergence criteria
    def hasConvergedXe():
        if xenonPop is None: # if first iteration
            return False # return NOT converged
        
        xeLoss = np.max(np.abs(xenonPop - xenonPopNext)/xenonPop) # max|X(n) - X(n+1) / X(n)| < 0.00001
        global xeLossHist
        xeLossHist = np.append(xeLossHist, xeLoss) # store the convergence error
        return xeLoss < 0.00001 # output if converged

    # main convergence loop
    while not hasConvergedXe():
        xenonPop = xenonPopNext #update xenon number density

        # calculate new M matrix
        totAbsorptionMatrix = product_operator(ic6.mesh_points, ic6.delta_x, get_tot_macro_a()) # calculate new absorption matrix based on the new xenon density
        MNext = ic6.diffusion_matrix + totAbsorptionMatrix # Generate new M matrix
        MNext[0,0] += 1/2 # left boundary
        MNext[-1,-1] += 1/2 # right boundary
        ic6.M_inv = np.linalg.inv(MNext) # calculate new inverse M matrix and store in iteration constant object

        # Solve the power iteration using the new iteration constant, which contains the new inverse M matrix calculated from the xenon population
        (eigenFP, _, fluxFP) = copy.deepcopy(solvePowerIteration(fluxGuess=fluxFP, eigenGuess=eigenFP, doPlot=False, doNormalize=True, powerTarget=pow, ic=ic6))

        # the calculate the xenonpopulation for n+1 
        fluxInterval = (fluxFP[:-1] + fluxFP[1:])/2
        xenonPopNext = XE135.fission_yield * slab_macro_f * fluxInterval / (np.log(2)/XE135_HALF_LIFE + XE135.get_micro_a() * fluxInterval) # /cm3

        powIt += 1
    
    # if the loop is exited means that the equilibrium xenon density, phi and keff have been found
    eigenPowHist = np.append(eigenPowHist, eigenFP) # store the keff found

    # print results
    print("POW = " + str(pow))
    print("EV = " + str(eigenFP))
    print("loss = " + str(xeLossHist[-1]))
    print("attempts = " + str(powIt))
    print()

    # the question asks for the specific case of 100 MW/cm2
    if pow == 100e6:
        # print the FP densities
        print(SM149.get_number_density())
        print(min(xenonPop))
        print(max(xenonPop))
        print(np.mean(xenonPop))

        # plot phi
        fig, ax1 = plt.subplots(figsize=((8,3)))
        ax1.plot(ic6.x_axis[1:] - ic6.delta_x/2, xenonPop, label = "Xe-135", color = 'blue', linestyle = 'dotted')
        ax1.plot(ic6.x_axis[1:] - ic6.delta_x/2, np.full(ic6.mesh_intervals, SM149.get_number_density()), label = "Sm-149", color = 'grey', linestyle = 'dashdot')
        ax1.set_ylabel(r'Number density, $N$ [cm$^{-3}$]')
        ax1.set_xlabel(r"Position, $x$ [cm]", fontsize=12)
        ax1.set_ylim(0, 8e16)
        ax1.set_xlim(-50, 50)
        ax2 = ax1.twinx()
        ax2.plot(ic6.x_axis, fluxFP, linestyle = "-", color = 'k', label=r'$\phi$ w/ FP')
        ax2.plot(icBase.x_axis, fluxNoFP, linestyle = '--', color = 'red', label=r'$\phi$ w/o FP')
        ax2.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
        ax2.set_ylabel(r"Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
        ax1.legend(fontsize=11.5, loc = "upper left")
        ax2.legend(fontsize=11.5, loc = "upper right")
        plt.tight_layout()
        plt.show()

        
# The relationship between the power and keff appeared to be inverse proportional
# An inver proportional curve is fit 
fit, _ = curve_fit(inverse_proportional, pows, eigenPowHist)
a, b = fit
print("a = " + str(a)) # =
print("b = " + str(b)) # =
y_fit = a / pows + b

plt.figure(figsize=((8,3)))
plt.plot(pows, y_fit, color='k', linewidth=1.5, label="Least-squares fit curve")
plt.scatter(pows, eigenPowHist, color='darkgray', marker='x', linewidths = 0.7, s = 15, label=r"Values found", zorder = 10)
plt.scatter(100e6, eigenPowHist[np.where(pows == 100e6)], color='gray', marker='x', linewidths = 1.2, s = 25, label=r"$k_{eff}$ at 100 MW/cm$^{2}$ ", zorder = 20)
plt.legend(fontsize=11.5)
plt.text(
    0.2, 0.83, 
    r"$k_{eff} = \frac{a}{P} + b$" + "\n" + r"$a=$" + f"{a:.7f}" + r" W/cm$^{2}$" + "\n" + r"$b=$" + f"{b:.7f}",
    transform=plt.gca().transAxes,
    ha="left",
    va="top",
    fontsize=14,
    linespacing=1.5
)  
plt.xlabel(r"Areal power, $P$ [W/cm$^{2}$]", fontsize=12)
plt.ylabel(r"Eigenvalue, $k_{eff}$", fontsize=12)
plt.tight_layout()
plt.show()


    





