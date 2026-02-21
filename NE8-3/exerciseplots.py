import numpy as np
import matplotlib.pyplot as plt

from outputs import DETEXERCISE1R, DETEXERCISE256E, DETEXERCISE3E, DETEXERCISE1, DETEXERCISE256fuel, DETEXERCISE256mod, DETEXERCISE3, DETEXERCISE3T, DETEXERCISE310, DETEXERCISE310T, DETEXERCISE6mod, DETEXERCISE6fuel
from outputs import DETfluxCoolant10, DETfluxCoolant35, DETfluxCoolant6, DETfluxCoolant7, DETfluxCoolant90, DETfluxfuel10, DETfluxfuel35, DETfluxfuel6, DETfluxfuel7, DETfluxfuel90
from outputs import DETEXERCISE5fuel7, DETEXERCISE5fuel10, DETEXERCISE5fuel90, DETEXERCISE5mod7, DETEXERCISE5mod10, DETEXERCISE5mod90

from outputs8 import HIS_ANA_KEFF10, HIS_ANA_KEFF50, HIS_ANA_KEFF100, HIS_ANA_KEFF400, HIS_IMP_KEFF10, HIS_IMP_KEFF50, HIS_IMP_KEFF100, HIS_IMP_KEFF400, HIS_ENTR_SPT10, HIS_ENTR_SPT100, HIS_ENTR_SPT400, HIS_ENTR_SPT50, HIS_ENTR_SPTtest, HIS_ANA_KEFF400red, HIS_ENTR_SPT400red, HIS_IMP_KEFF400red


K0_4 = 1.16927 
U_K0_4 = 0.00013 * 1.16927
KFuel4 = 1.16841
U_KFuel4 = 0.00012 * 1.16841
KMod4 = 1.16549
U_KMod4 = 0.00013 * 1.16549
KBor4 = 1.14826
U_KBor4 = 0.00013 * 1.14826

K0_7 = 1.76681
U_K0_7 = 6.5e-05 * 1.76681
KFuel7 = 1.76602
U_KFuel7 = 6.4e-05 * 1.76602
KMod7 = 1.76656
U_KMod7 = 6.4e-05 * 1.76656
KBor7 = 1.76121
U_KBor7 = 6.3e-05 * 1.76121




ex1_bins   = np.append(DETEXERCISE1R[:,0], DETEXERCISE1R[-1, 1])
ex256_bins = np.append(DETEXERCISE256E[:,0], DETEXERCISE256E[-1, 1])
ex3_bins = np.append(DETEXERCISE3E[:,0], DETEXERCISE3E[-1, 1])

ex1_x = DETEXERCISE1R[:,2]
ex256_x = DETEXERCISE256E[:,2]
ex3_x = DETEXERCISE3E[:,2]


def q1():
        plt.figure(figsize=(8,3))
        plt.plot(ex1_x, DETEXERCISE1[:,0], color = 'k')
        plt.xlabel(r"Radial distance $r$, [cm]", fontsize=12)
        plt.ylabel(r"Reaction rate, [s$^{-1}$]", fontsize=12)
        plt.tight_layout()
        plt.show()
#q1()

lw = 1.1

def q25():
        plt.figure(figsize=(8,4))
        plt.plot(ex256_x, DETEXERCISE5mod7[:,0], label = "Moderator, 0.7%", linestyle = '--', color='k', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE256mod[:,0], label = "Moderator, 3.5%", color='k')
        plt.plot(ex256_x, DETEXERCISE5mod10[:,0], label = "Moderator, 10%", linestyle = 'dashdot', color='k', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE5mod90[:,0], label = "Moderator, 90%", linestyle = ':', color='k', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE5fuel7[:,0], label = "Fuel, 0.7%", linestyle = '--', color='grey', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE256fuel[:,0], label = "Fuel, 3.5%", color='grey')
        plt.plot(ex256_x, DETEXERCISE5fuel10[:,0], label = "Fuel, 10%", linestyle = 'dashdot', color='grey', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE5fuel90[:,0], label = "Fuel, 90%", linestyle = ':', color='grey', linewidth = lw)
        plt.yscale('log')
        plt.xscale('log')
        plt.xlim((ex256_x[0], ex256_x[-1]))
        plt.legend(ncol=2,
                fontsize=11.5,
                columnspacing=1.5,
                handletextpad=0.6,
                frameon=True)
        plt.xlabel(r"Neutron energy [MeV]", fontsize=12)
        plt.ylabel(r"Reaction rate, [s$^{-1}$]", fontsize=12)
        plt.tight_layout()
        plt.show()
        
        
        plt.figure(figsize=(8,4))
        plt.plot(ex256_x, DETfluxCoolant35[:,0], label = "Moderator, 3.5%", color='k')
        plt.plot(ex256_x, DETfluxCoolant10[:,0], label = "Moderator, 10%", linestyle = 'dashdot', color='k', linewidth = lw)
        plt.plot(ex256_x, DETfluxCoolant7[:,0], label = "Moderator, 0.7%", linestyle = '--', color='k', linewidth = lw)
        plt.plot(ex256_x, DETfluxCoolant90[:,0], label = "Moderator, 90%", linestyle = ':', color='k', linewidth = lw)
        plt.plot(ex256_x, DETfluxfuel35[:,0], label = "Fuel, 3.5%", color='grey')
        plt.plot(ex256_x, DETfluxfuel10[:,0], label = "Fuel, 10%", linestyle = 'dashdot', color='grey', linewidth = lw)
        plt.plot(ex256_x, DETfluxfuel7[:,0], label = "Fuel, 0.7%", linestyle = '--', color='grey', linewidth = lw)
        plt.plot(ex256_x, DETfluxfuel90[:,0], label = "Fuel, 90%", linestyle = ':', color='grey', linewidth = lw)
        plt.yscale('log')
        plt.xscale('log')
        plt.xlim((ex256_x[0], ex256_x[-1]))
        plt.legend(ncol=2,
                fontsize=11.5,
                columnspacing=1.5,
                handletextpad=0.6,
                frameon=True)
        plt.xlabel(r"Neutron energy [MeV]", fontsize=12)
        plt.ylabel(r"Neutron Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
        plt.tight_layout()
        plt.show()
#q25()

def q3():
        plt.figure(figsize=(16,8))
        plt.plot(ex3_x, DETEXERCISE3[:,0], label="3.5% 900K", color = 'k', linewidth = 1)
        plt.plot(ex3_x, DETEXERCISE3T[:,0], label="3.5% 1200K", color = 'k', linewidth = 1, linestyle = "--")
        plt.plot(ex3_x, DETEXERCISE310[:,0], label="10% 900K", color = 'grey', linewidth = 1)
        plt.plot(ex3_x, DETEXERCISE310T[:,0], label="10% 1200K", color = 'grey', linewidth = 1, linestyle = "--")
        #plt.yscale('log')
        plt.xscale('log')
        plt.xlabel(r"Neutron Energy [MeV]", fontsize=12)
        plt.ylabel(r"Microscopic reaction rate, [s$^{-1}$]", fontsize=12)
        plt.xlim((ex3_x[0], ex3_x[-1]))
        plt.legend()
        plt.tight_layout()
        plt.show()
#q3()






def coefficient(kinf0_in, kinfFuel_in, deltaT_in):
        return 1e5 * (kinfFuel_in - kinf0_in)/(kinf0_in * kinfFuel_in * deltaT_in)
def U_coefficient(kinf0_in, kinfFuel_in, deltaT_in, U_kinf0_in, U_kinfFuel_in):
        return ((1e5 * U_kinfFuel_in/(kinfFuel_in**2 * deltaT_in)) ** 2 + (1e-5 * U_kinf0_in/(kinf0_in**2 * deltaT_in)) ** 2)**0.5


def q4():
        print("Exercise 4:")
        print(f"MTC = {coefficient(K0_4, KMod4, 5)} +- {U_coefficient(K0_4, KMod4, 5, U_K0_4, U_KMod4)} pcm/K")
        print(f"DC = {coefficient(K0_4, KFuel4, 50)} +- {U_coefficient(K0_4, KFuel4, 50, U_K0_4, U_KFuel4)} pcm/K")
        print(f"BW = {coefficient(K0_4, KBor4, 50)} +- {U_coefficient(K0_4, KBor4, 50, U_K0_4, U_KBor4)} pcm/ppm")
        print()
q4()



def q6():
        plt.figure(figsize=(8,4))
        plt.plot(ex256_x, DETEXERCISE5fuel90[:,0], label =r"Fuel, in H$_2$O", linestyle = ':', color='k', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE6fuel[:,0], label = "Fuel, in vacuum", linestyle = '-', color='k', linewidth = lw)
        plt.plot(ex256_x, DETEXERCISE5mod90[:,0], label =r"Moderator, in H$_2$O", linestyle = ':', color='grey', linewidth = lw)
        plt.yscale('log')
        plt.xscale('log')
        plt.xlim((ex256_x[0], ex256_x[-1]))
        plt.legend(fontsize=11.5, loc=2)
        plt.xlabel(r"Neutron energy [MeV]", fontsize=12)
        plt.ylabel(r"Reaction rate, [s$^{-1}$]", fontsize=12)
        plt.tight_layout()
        plt.show()
        
        plt.figure(figsize=(8,4))
        plt.plot(ex256_x, DETfluxfuel90[:,0], label = r"Fuel, in H$_2$O", linestyle = ':', color='k', linewidth = lw)
        plt.plot(ex256_x, DETfluxfuel6[:,0], label = "Fuel, in vacuum", linestyle = '-', color='k', linewidth = lw)
        plt.plot(ex256_x, DETfluxCoolant90[:,0], label = r"Moderator, in H$_2$O", linestyle = ':', color='grey', linewidth = lw)
        plt.yscale('log')
        plt.xscale('log')
        plt.xlim((ex256_x[0], ex256_x[-1]))
        plt.legend(fontsize=11.5, loc=2)
        plt.xlabel(r"Neutron energy [MeV]", fontsize=12)
        plt.ylabel(r"Scalar Flux, $\phi$ [cm$^{-2}$s$^{-1}$]", fontsize=12)
        plt.tight_layout()
        plt.show()
#q6()


def q7():
        print("Exercise 7:")
        print(f"MTC = {coefficient(K0_7, KMod7, 5)} +- {U_coefficient(K0_7, KMod7, 5, U_K0_7, U_KMod7)} pcm/K")
        print(f"DC = {coefficient(K0_7, KFuel7, 50)} +- {U_coefficient(K0_7, KFuel7, 50, U_K0_7, U_KFuel7)} pcm/K")
        print(f"BW = {coefficient(K0_7, KBor7, 50)} +- {U_coefficient(K0_7, KBor7, 50, U_K0_7, U_KBor7)} pcm/ppm")
q7()


def q8():
        plt.figure(figsize=(8,3))
        plt.plot(HIS_ANA_KEFF400[:50,0], color = 'k', linestyle = ':', linewidth = lw, label = "Analytic, 400 cm")
        plt.plot(HIS_ANA_KEFF100[:50,0], color = 'k', linestyle = '--', linewidth = lw, label = "Analytic, 100 cm")
        plt.plot(HIS_ANA_KEFF50[:50,0], color = 'k', linestyle = '-.', linewidth = lw, label="Analytic, 50 cm")
        plt.plot(HIS_ANA_KEFF10[:50,0], color = 'k', linewidth = lw, label="Analytic, 10 cm")
        plt.plot(HIS_IMP_KEFF400[:50,0], color = 'grey', linestyle = ':', linewidth = lw, label = "Implicit, 400 cm")
        plt.plot(HIS_IMP_KEFF100[:50,0], color = 'grey', linestyle = '--', linewidth = lw, label = "Implicit, 100 cm")
        plt.plot(HIS_IMP_KEFF50[:50,0], color = 'grey', linestyle = '-.', linewidth = lw, label = "Implicit, 50 cm")
        plt.plot(HIS_IMP_KEFF10[:50,0], color = 'grey', linewidth = lw, label = "Implicit, 10 cm")
        plt.legend(ncol=2,
                fontsize=11.5,
                columnspacing=1.5,
                handletextpad=0.6,
                frameon=True)
        plt.ylabel(r"Multiplication factor, $k_\text{eff}$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()

        plt.figure(figsize=(8,3))
        plt.plot(HIS_ANA_KEFF400red[:50,0], color = 'k', linewidth = lw, label=r"Analytic, 656.39 kg/m$^3$")
        plt.plot(HIS_ANA_KEFF400[:50,0], color = 'k', linestyle = ':', linewidth = lw, label = r"Analytic, 666.39 kg/m$^3$")
        plt.plot(HIS_IMP_KEFF400red[:50,0], color = 'grey', linewidth = lw, label = r"Implicit, 656.39 kg/m$^3$")
        plt.plot(HIS_IMP_KEFF400[:50,0], color = 'grey', linestyle = ':', linewidth = lw, label = r"Implicit, 666.39 kg/m$^3$")
        plt.ylabel(r"Multiplication factor, $k_\text{eff}$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.legend(ncol=2,
                fontsize=11.5,
                columnspacing=1.5,
                handletextpad=0.6,
                frameon=True)
        plt.tight_layout()
        plt.show()


        plt.figure(figsize=(8,3))
        plt.plot(HIS_ANA_KEFF400[:150,1], color = 'k', linestyle = ':', linewidth = lw, label = "400 cm, analytic")
        plt.plot(HIS_ANA_KEFF100[:150,1], color = 'k', linestyle = '--', linewidth = lw, label = "100 cm, analytic")
        plt.plot(HIS_ANA_KEFF50[:150,1], color = 'k', linestyle = '-.', linewidth = lw, label = "50 cm, analytic")
        plt.plot(HIS_ANA_KEFF10[:150,1], color = 'k', linewidth = lw, label = "10 cm, analytic")
        plt.plot(HIS_IMP_KEFF400[:150,1], color = 'grey', linestyle = ':', linewidth = lw, label = "400 cm, implicit")
        plt.plot(HIS_IMP_KEFF100[:150,1], color = 'grey', linestyle = '--', linewidth = lw, label = "100 cm, implicit")
        plt.plot(HIS_IMP_KEFF50[:150,1], color = 'grey', linestyle = '-.', linewidth = lw, label = "50 cm, implicit")
        plt.plot(HIS_IMP_KEFF10[:150,1], color = 'grey', linewidth = lw, label = "10 cm, implicit")
        plt.axvline(100, linestyle = ':', linewidth = 0.8, color='dimgrey',alpha = 0.5)
        plt.legend(ncol=2,
                fontsize=11.5,
                columnspacing=1.5,
                handletextpad=0.6,
                frameon=True)
        plt.ylabel(r"Multiplication factor, $k_\text{eff}$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()


        plt.figure(figsize=(8,3))
        plt.plot(HIS_ENTR_SPT10[:,0], color = 'k', linestyle = '-', label=r"10 cm", linewidth = lw)
        plt.plot(HIS_ENTR_SPT100[:,0], color = 'dimgrey', linestyle = '-', label=r"100 cm", linewidth = lw)
        plt.plot(HIS_ENTR_SPT400[:,0], color = 'darkgrey', linestyle = '-', label=r"400 cm", linewidth = lw)
        plt.legend(fontsize=11.5)
        plt.ylabel(r"Shannon entropy, $S$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()

        plt.figure(figsize=(8,3))
        plt.plot(HIS_ENTR_SPT400[:,0], color = 'k', linestyle = '-', label=r"666.39 kg/m$^3$", linewidth = lw)
        plt.plot(HIS_ENTR_SPT400red[:,0], color = 'grey', linestyle = '-', label=r"656.39 kg/m$^3$", linewidth = lw)
        plt.legend(fontsize=11.5)
        plt.ylabel(r"Shannon entropy, $S$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()
        
        plt.figure(figsize=(8,3))
        plt.plot(HIS_ENTR_SPT400[:,1], color = 'k', linestyle = '-', label=r"666.39 kg/m$^3$")
        plt.plot(HIS_ENTR_SPT400red[:,1], color = 'grey', linestyle = ':', label=r"656.39 kg/m$^3$")
        plt.legend(fontsize=11.5)
        plt.ylabel(r"Shannon entropy, $S$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()
        
        plt.figure(figsize=(8,3))
        plt.plot(HIS_ENTR_SPT10[:,1], color = 'k', label = "10 cm")
        plt.plot(HIS_ENTR_SPT50[:,1], color = 'dimgrey', linestyle = '-.', label = "50 cm")
        plt.plot(HIS_ENTR_SPT100[:,1], color = 'grey', linestyle = '--', label = "100 cm")
        plt.plot(HIS_ENTR_SPT400[:,1], color = 'dimgrey', linestyle = ':', label = "400 cm")
        plt.axvline(100, linestyle = ':', linewidth = 0.8, color='dimgrey',alpha = 0.5)
        plt.legend(fontsize=11.5)
        plt.ylabel(r"Shannon entropy, $S$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()

        plt.figure(figsize=(8,3))
        plt.plot(HIS_ENTR_SPTtest[:200,0], color = 'k', linestyle = '-', label=r"100$\,$000 neutrons")
        plt.plot(HIS_ENTR_SPT400[:200,0], color = 'grey', linestyle = '-', label=r"  10$\,$000 neutrons")
        plt.legend(fontsize=11.5)
        plt.ylabel(r"Shannon entropy, $S$", fontsize=12)
        plt.xlabel(r"Generation", fontsize=12)
        plt.tight_layout()
        plt.show()
q8()