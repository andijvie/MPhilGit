# ----------------------Exercise 7----------------------
# "Perform a two-group transport simulation for the geometry originally given in Q1. Neutrons are born
# fast and can be absorbed, scatter and remain in the same group, or scatter down to the thermal group.
# In the thermal group, neutrons can be absorbed, up-scatter, or scatter while remaining in the same
# group. The relevant cross section data is given below. Explain how you implement the two-group
# solver. Report the value of k and show the flux distributions in each energy group, explaining their
# similarities or differences. "

# Import packages
import numpy as np
import numpy.typing as np_type
from numpy.polynomial.legendre import leggauss
import matplotlib.pyplot as plt


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


resolution = 10

slab_thickness = 100

ENERGY_PER_FISSION = MeV_to_j(200.0) # [J]

slab_macro_c_1 = 0.1 #[cm-1]
slab_macro_c_2 = 1.0 #[cm-1]
slab_macro_f_1 = .03 #[cm-1]
slab_macro_f_2 = 1.5 #[cm-1]
slab_macro_s_1to1 = 0.2 #[cm-1]
slab_macro_s_1to2 = 0.4 #[cm-1]
slab_macro_s_2to1 = 0.1 #[cm-1]
slab_macro_s_2to2 = 3.0 #[cm-1]
slab_macro_t_1 = slab_macro_c_1 + slab_macro_f_1 + slab_macro_s_1to1 + slab_macro_s_1to2 #[cm-1]
slab_macro_t_2 = slab_macro_c_2 + slab_macro_f_2 + slab_macro_s_2to1 + slab_macro_s_2to2 #[cm-1]
nu_1 = 2.6
nu_2 = 2.43
slab_macro_f_nu_1 = slab_macro_f_1 * nu_1 #[cm-1]
slab_macro_f_nu_2 = slab_macro_f_2 * nu_2 #[cm-1]
slab_macro_f_pow_1 = slab_macro_f_1 * ENERGY_PER_FISSION # [j / cm]
slab_macro_f_pow_2 = slab_macro_f_2 * ENERGY_PER_FISSION # [j / cm]
frac_1 = 1
frac_2 = 0


mesh_intervals = round(resolution * slab_thickness) # number of intervals in the mesh
mesh_points = round(resolution * slab_thickness) + 1 # number of points in the mesh, its one more because there are 2 points on the boundary
delta_x = slab_thickness / mesh_intervals # [cm] distance between points on the mesh
x_axis = np.linspace(-slab_thickness/2, slab_thickness/2, mesh_points) # [cm] the x values of the mesh points


# matrix to perform the fnu multiplication
macro_f_nu_matrix_1 = product_operator(mesh_points, delta_x, np.full(mesh_intervals, slab_macro_f_nu_1)) 
macro_f_nu_matrix_2 = product_operator(mesh_points, delta_x, np.full(mesh_intervals, slab_macro_f_nu_2)) 



def solveDiscreteOrdinates_2group(
                        convergenceCriteria = 1, # 0 is k, 1 is phi,
                        order = 12,
                        fluxGuess1 = None,
                        fluxGuess2 = None, 
                        eigenGuess = 1.0, 
                        doPlot = True,
                        doSave = False,
                        saveFile = 'discrOrd.npy',
                        doNormalize = True,
                        powerTarget = 1e3, # W/cm2
                        closure = 0, # 0 is Diamond-differencing, 1 is step method
                        ) -> tuple[float, int, np_type.NDArray[np.float64], np_type.NDArray[np.float64]]:
    
    # initialize variables
    if fluxGuess1 is None or fluxGuess2 is None:
        fluxNext1 = np.full(mesh_points, 1.0)[:,np.newaxis] # phi_n+1 group 1
        fluxNext2 = np.full(mesh_points, 1.0)[:,np.newaxis] # phi_n+1 group 2
    else:
        fluxNext1 = fluxGuess1[:,np.newaxis] # phi_n+1 group 1
        fluxNext2 = fluxGuess2[:,np.newaxis] # phi_n+1 group 2
        
    flux1 = np.array([]) # phi_n group 1
    flux2 = np.array([]) # phi_n group 2
    eigenNext = eigenGuess # keff_n+1
    eigen = None # keff_n
    abscissae, weights = leggauss(order)
    QNext1 = np.array([])
    eigenHist = np.array([eigenNext]) # stores the histary of keff iterations
    fluxHist1 = np.empty((mesh_points, 0)) # stores the history of phi iterations
    fluxHist1 = np.append(fluxHist1, fluxNext1, axis=1) # add first guess
    fluxHist2 = np.empty((mesh_points, 0)) # stores the history of phi iterations
    fluxHist2 = np.append(fluxHist1, fluxNext1, axis=1) # add first guess
    loss = -1 # stores the error in the convergence criteria
    convIt = 1 # counts number of iterations

    # initialize the S vector
    S1 = np.array([]) # S_n
    S2 = np.array([]) # S_n
    SNext1 = macro_f_nu_matrix_1 @ fluxNext1 # S_n+1
    SNext2 = macro_f_nu_matrix_1 @ fluxNext1 # S_n+1


    def getPsi(abscissa, QNext, slab_macro_t):
        psi = np.zeros(mesh_points) # This will become our output angular nuetron flux. Note that the vacuum boundary condition is already set since the edges of the array are 0   
        coeff = 2 if closure == 0 else 1
        psi[0] = .0

        psiPrev = 0
        for it in range(0, mesh_intervals):
            if abscissa > 0:
                iNow = it 
                iNext = it + 1
            else:
                iNow = -(it + 1)
                iNext = -(it + 2)
            
            psi_int = (delta_x * QNext[iNow] + coeff * np.abs(abscissa) * psiPrev) / (
                                delta_x * slab_macro_t + coeff * np.abs(abscissa)
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

        else: # max|phi(n+1) - phi(n) / phi(n)| < 0.00001
            loss1 = np.max(np.abs(flux1[0] - fluxNext1[0])/flux1[0]) # group 1
            loss2 = np.max(np.abs(flux2[0] - fluxNext2[0])/flux2[0]) # group 2
            loss = max(loss1, loss2)
        print("loss group 1 = " + str(loss1) + ", group 2 = " + str(loss2))
        return loss < 0.00001 # return if converged


    # main loop
    while not hasConverged():
        # update keff, phi and S
        eigen = eigenNext 
        flux1 = fluxNext1
        flux2 = fluxNext2
        S1 = SNext1
        S2 = SNext2

        # calculate n+1 values of keff, phi and S   
        QNext1 = interpolate((1/2) * (
                flux1 * (
                    slab_macro_s_1to1 + slab_macro_f_nu_1/(eigen + 1e-99) * frac_1
                ) + flux2 * (
                    slab_macro_s_2to1 + slab_macro_f_nu_2/(eigen + 1e-99) * frac_1
                )
            ))
        QNext2 = interpolate((1/2) * (
                flux1 * (
                    slab_macro_s_1to2 + slab_macro_f_nu_1/(eigen + 1e-99) * frac_2
                ) + flux2 * (
                    slab_macro_s_2to2 + slab_macro_f_nu_2/(eigen + 1e-99) * frac_2
                )
            ))
        fluxNext1 = np.zeros(mesh_points)[:, np.newaxis]
        fluxNext2 = np.zeros(mesh_points)[:, np.newaxis]
        for i in range(order):
            angFlux1 = getPsi(abscissae[i], QNext1, slab_macro_t_1)[:, np.newaxis]
            angFlux2 = getPsi(abscissae[i], QNext2, slab_macro_t_2)[:, np.newaxis]
            fluxNext1 += weights[i] * angFlux1
            fluxNext2 += weights[i] * angFlux2
            
        SNext1 = macro_f_nu_matrix_1 @ fluxNext1 # S_n+1 = F * phi_n+1
        SNext2 = macro_f_nu_matrix_2 @ fluxNext2 # S_n+1 = F * phi_n+1
        eigenNext = eigen * np.sum(SNext1 + SNext2) / (np.sum(S1 + S2) + 1e-99) # calculate keff_n+1

        # store values
        if doPlot or doSave: 
            eigenHist = np.append(eigenHist, eigenNext) 

            if doNormalize: # normalize phi if necessary

                # calculate the fraction by which the power is different from the target
                powerScaling = powerTarget / (integrate(slab_macro_f_pow_1 * fluxNext1, delta_x) + integrate(slab_macro_f_pow_2 * fluxNext2, delta_x))

                # normalize and store
                fluxHist1 = np.append(fluxHist1, fluxNext1 * powerScaling, axis=1)
                fluxHist2 = np.append(fluxHist2, fluxNext2 * powerScaling, axis=1) 
            
            else: # store
                fluxHist1 = np.append(fluxHist1, fluxNext1, axis=1)
                fluxHist2 = np.append(fluxHist2, fluxNext2, axis=1)


        convIt += 1 # count iteration
        

    if doNormalize: # normalize phi if necessary

        # calculate the fraction by which the power is different from the target
        powerScaling = powerTarget / (integrate(slab_macro_f_pow_1 * fluxNext1, delta_x) + integrate(slab_macro_f_pow_2 * fluxNext2, delta_x))
        
        # normalize by the fraction such that the power equals the target
        fluxNext1 *= powerScaling 
        fluxNext2 *= powerScaling

        # if necessary, also normalize the power int he first iteration
        if doPlot:
            powerScaling = powerTarget / (integrate(slab_macro_f_pow_1 * fluxHist1[:,0], delta_x) + integrate(slab_macro_f_pow_2 * fluxHist2[:,0], delta_x))
            fluxHist1[:,0] *= powerScaling
            fluxHist2[:,0] *= powerScaling

    # save to file if necessary
    if doSave:
        np.save("eigen_" + saveFile, eigenHist)
        np.save("flux1_" + saveFile, fluxHist1)
        np.save("flux2_" + saveFile, fluxHist2)

    # return values found
    if not doPlot:
        return (float(eigenNext), convIt, fluxNext1[:,0], fluxNext2[:,0]) 
    
    

    # plot the iterations of k
    plt.figure(figsize=((8,3)))
    plt.plot(np.arange(len(eigenHist[:300])) + 1, eigenHist[:300], color = 'k', linewidth = 1.5, label="Interpolated values")
    #plt.scatter(np.arange(len(eigenHist)) + 1, eigenHist, color='darkgray', marker='x', linewidths = 0.8, s = 15, label=r"$k_{eff}$ iteration values")
    #plt.scatter([len(eigenHist)], [eigenHist[-1]], color='dimgrey', marker='x', linewidths = 1.2, s = 25, label=r"$k_{eff}$ final value")
    #plt.legend(fontsize=11.5)
    plt.text(
        0.6, 0.83, 
        r"Final $k_{eff}$ = " + f"{eigenHist[-1]:.7f}\nIterations = {len(eigenHist)}",
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
    plt.xlim(x_axis[0], x_axis[-1])
    plt.plot(x_axis, fluxHist1[:, 0], linestyle = (0, (1, 1)), color = 'red', alpha=1, label='Iteration 1 (guess)')
    if len(fluxHist1[0, :]) > 600:
        plt.plot(x_axis, fluxHist1[:, 10], linestyle = "dashdot", color = 'gold', label='Iteration 10')
        plt.plot(x_axis, fluxHist1[:, 100], linestyle = "dashed", color = 'cyan', label='Iteration 100')
        plt.plot(x_axis, fluxHist1[:, 800], linestyle = (0, (3, 1, 1, 1, 1, 1)), color = 'blue', label='Iteration 800')
        plt.plot(x_axis, fluxHist1[:, 1500], linestyle = "dotted", color = 'hotpink', label='Iteration 1500')
    plt.plot(x_axis, fluxHist1[:, -1], linestyle = "solid", color = 'k', label='Iteration ' + f'{len(eigenHist)}' + ' (final)')
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

    # plot the normalized phi of different iterations
    plt.figure(figsize=((8,3)))
    plt.xlim(x_axis[0], x_axis[-1])
    plt.plot(x_axis, fluxHist2[:, 0], linestyle = (0, (1, 1)), color = 'red', alpha=1, label='Iteration 1 (guess)')
    if len(fluxHist2[0, :]) > 600:
        plt.plot(x_axis, fluxHist2[:, 10], linestyle = "dashdot", color = 'gold', label='Iteration 10')
        plt.plot(x_axis, fluxHist2[:, 100], linestyle = "dashed", color = 'cyan', label='Iteration 100')
        plt.plot(x_axis, fluxHist2[:, 800], linestyle = (0, (3, 1, 1, 1, 1, 1)), color = 'blue', label='Iteration 800')
        plt.plot(x_axis, fluxHist2[:, 1500], linestyle = "dotted", color = 'hotpink', label='Iteration 1500')
    plt.plot(x_axis, fluxHist2[:, -1], linestyle = "solid", color = 'k', label='Iteration ' + f'{len(eigenHist)}' + ' (final)')
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
    

    return (float(eigenNext), convIt, fluxNext1[:,0], fluxNext2[:,0]) # return values found



keff, _, fluxResult1, fluxResult2 = solveDiscreteOrdinates_2group(doPlot=True)


plt.figure(figsize=((8,3)))
plt.xlim(x_axis[0], x_axis[-1])
plt.plot(x_axis, fluxResult1, linestyle = "solid", color = 'k', label='Energy group 1 (fast)')
plt.plot(x_axis, fluxResult2, linestyle = "--", color = 'k', label='Energy group 2 (slow)')
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

