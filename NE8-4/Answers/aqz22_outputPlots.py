import matplotlib.pyplot as plt
import numpy as np
import os

H2Okeff_VmVf = np.array([[0.3,                  0.964836],
                        [1.4737973878784933,   1.330905],
                        [2.0135847212666578,   1.393305],
                        [3.0,                  1.450173],
                        [4.242640687119285,    1.471615],
                        [6.0,                  1.461798],
                        [7.240262468391569,    1.442372],
                        [35.56893304490063,    0.925581],
                        [90.0,                 0.531564],
                        [144.61711541003726,   0.373886],
                        [174.73800203733202,   0.321927],
                        [232.37900077244493,   0.255066],
                        [373.39978637308684,   0.170990],
                        [600.0,                0.114077],
                        [858.4280365524219,    0.084405],
                        [4217.163326508749,    0.026802],
                        [20717.480982885267,   0.014590],
                        [101777.8978533288,    0.0],
                        [500000.0,             0.0]])

D2Okeff_VmVf = np.array([[0.3,                 0.722045],
                        [1.4737973878784933,  0.770894],
                        [2.0135847212666578,  0.807091],    
                        [3.0,                 0.880641],
                        [4.242640687119285,   0.970215],
                        [6.0,                 1.079264],
                        [7.240262468391569,   1.144106],
                        [35.56893304490063,   1.633975],
                        [90.0,                1.770580],
                        [144.61711541003726,  1.804631],
                        [174.73800203733202,  1.813239],
                        [232.37900077244493,  1.821604],
                        [373.39978637308684,  1.824441],
                        [600.0,               1.813707],
                        [858.4280365524219,   1.795571],
                        [4217.163326508749,   1.549598],
                        [20717.480982885267,  0.918186],
                        [101777.8978533288,   0.311898],
                        [500000.0,            0.081639]])

radii = np.array([0, 0.091567, 0.129495, 0.158599, 0.183134, 0.204750, 0.224292, 0.242263, 0.258991, 0.274701, 0.289560, 
                  0.303693, 0.317197, 0.330149, 0.342612, 0.354637, 0.366268, 0.377540, 0.388486, 0.399131, 0.409500])

fastFlux = np.array([1.62740E+04, 1.62678E+04, 1.62609E+04, 1.62560E+04, 1.62472E+04, 1.62416E+04, 1.62345E+04, 1.62253E+04, 1.62188E+04, 1.62103E+04, 
                     1.62013E+04, 1.61924E+04, 1.61826E+04, 1.61713E+04, 1.61626E+04, 1.61506E+04, 1.61350E+04, 1.61191E+04, 1.61054E+04, 1.60998E+04])

slowFlux = np.array([2.33721E+03, 2.34586E+03, 2.35471E+03, 2.36384E+03, 2.37320E+03, 2.38280E+03, 2.39266E+03, 2.40284E+03, 2.41332E+03, 2.42420E+03,
                     2.43544E+03, 2.44717E+03, 2.45942E+03, 2.47228E+03, 2.48585E+03, 2.50030E+03, 2.51589E+03, 2.53297E+03, 2.55226E+03, 2.57577E+03])


q3r = np.array([0.0010, 0.0030, 0.0090, 0.0271, 0.0816, 0.2452, 0.4095, 0.7368, 1.0633, 1.5344, 2.2143, 3.1955, 4.6114, 6.6548, 20.000])
q3kinf = np.array([1.294650, 1.295031, 1.297543, 1.304512, 1.323475, 1.364917, 1.393305, 1.428594, 1.448299, 1.462478, 1.467893, 1.460648, 1.436399, 1.390381, 1.098306])
q3U238capture = np.array([1.1016, 1.1009, 1.0955, 1.0816, 1.0424, 0.95411, 0.89119, 0.80550, 0.74797, 0.68847, 0.62679, 0.56134, 0.49017, 0.41424, 0.23956])

def q1():
    plt.figure(figsize=((8,3)))
    plt.axhline(0, color = 'darkgrey', linewidth = '1')
    plt.plot(H2Okeff_VmVf[:, 0], H2Okeff_VmVf[:, 1], color='k', linestyle = '-', linewidth = '1.5', marker = 'o', markersize = 3, zorder = 0)
    plt.scatter([2.0135847212666578], [1.393305], color = 'dimgrey', marker = 'x', linewidth=10, s=1.5, zorder = 10, label = r'Reference:' +'\n' +r'$k_\infty=1.393305$' + '\n' + r'$V_\text{m}/V_\text{f}=2.0136$')
    plt.xscale('log')
    plt.ylabel(r"Eigenvalue, $k_\infty$", fontsize=12)
    plt.xlabel(r"Moderator-fuel ratio, $V_\text{m}/V_\text{f}$", fontsize=12)
    plt.legend(fontsize = 11.5)
    plt.ylim((-0.05, 1.9))
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=((8,3)))
    plt.axhline(0, color = 'darkgrey', linewidth = '1')
    plt.plot(D2Okeff_VmVf[:, 0], D2Okeff_VmVf[:, 1], color='k', linestyle = '-', linewidth = '1.5', marker = 'o', markersize = 3, zorder = 0)
    plt.scatter([2.0135847212666578], [0.807091], color = 'dimgrey', marker = 'x', linewidth=10, s=1.5, zorder = 10, label = r'Reference:' +'\n' +r'$k_\infty=0.807091$' + '\n' + r'$V_\text{m}/V_\text{f}=2.0136$')
    plt.xscale('log')
    plt.ylabel(r"Eigenvalue, $k_\infty$", fontsize=12)
    plt.xlabel(r"Moderator-fuel ratio, $V_\text{m}/V_\text{f}$", fontsize=12)
    plt.legend(fontsize = 11.5)
    plt.ylim((-0.05, 1.9))
    plt.tight_layout()
    plt.show()

q1()

def q2():
    plt.figure(figsize=(8,4))
    plt.stairs(fastFlux, radii, color = 'k', lw = 1.5)
    plt.xlabel(r"Radial intervals, $r_i$ [cm]", fontsize=12)
    plt.ylabel(r"Total flux per interval", fontsize=12)
    plt.ylim((16e3, 16.3e3))
    plt.xlim(min(radii), max(radii) - 0.0005)
    plt.vlines(radii, ymin=0, ymax=17e3, colors="dimgrey", alpha=0.5, linestyles=":", linewidth=1)
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=(8,4))
    plt.stairs(slowFlux, radii, color = 'k', lw = 1.5)
    plt.xlabel(r"Radial intervals, $r_i$ [cm]", fontsize=12)
    plt.ylabel(r"Total flux per interval", fontsize=12)
    plt.ylim((2.3e3, 2.6e3))
    plt.xlim(min(radii), max(radii) - 0.0005)
    plt.vlines(radii, ymin=0, ymax=17e3, colors="dimgrey", alpha=0.5, linestyles=":", linewidth=1)
    plt.tight_layout()
    plt.show()

#q2()

def q3():
    plt.figure(figsize=((8,3)))
    plt.axhline(0, color = 'darkgrey', linewidth = '1')
    plt.plot(q3r, q3kinf, color='k', linestyle = '-', linewidth = '1.5', marker = 'o', markersize = 3, zorder = 0)
    plt.scatter([0.4095], [1.393305], color = 'dimgrey', marker = 'x', linewidth=10, s=1.5, zorder = 10, label = r'Reference:' +'\n' +r'$k_\infty=1.393305$' + '\n' + r'$R=0.4095$ cm')
    plt.xscale('log')
    plt.ylabel(r"Eigenvalue, $k_\infty$", fontsize=12)
    plt.xlabel(r"Fuel pin radius, $R$ [cm]", fontsize=12)
    plt.legend(fontsize = 11.5)
    plt.ylim((1, 1.5))
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=((8,3)))
    plt.plot(q3r, q3U238capture, color='k', linestyle = '-', linewidth = '1.5', marker = 'o', markersize = 3, zorder = 0)
    plt.scatter([0.4095], [0.89119], color = 'dimgrey', marker = 'x', linewidth=10, s=1.5, zorder = 10, label = r'Reference:' +'\n' +r'$\sigma_\text{c}=0.89119$ barns' + '\n' + r'$R=0.4095$ cm')
    plt.xscale('log')
    plt.ylabel(r"U238 capture, $\sigma_\text{c}$ [barns]", fontsize=12)
    plt.xlabel(r"Fuel pin radius, $R$ [cm]", fontsize=12)
    plt.legend(fontsize = 11.5)
    #plt.ylim((1, 1.5))
    plt.tight_layout()
    plt.show()

def q4():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    filename = os.path.join(script_dir, "4", "results")
    print(filename)

    days = []
    data = {
        "Pu239": [],
        "Pu240": [],
        "Pu241": [],
        "Pu242": [],
        "U235": [],
        "U238": []
    }

    with open(filename) as f:
        lines = [line.strip() for line in f if line.strip()]

    i = 0
    while i < len(lines):
        t = float(lines[i])
        days.append(t)
        i += 1
        for _ in range(6):
            isotope, value = lines[i].split()
            data[isotope].append(float(value))
            i += 1

    plt.figure(figsize=(8,4))
    plt.plot(days, data["U235"], label='U235', color = 'k')
    plt.plot(days, data["Pu239"], label='Pu239', color = 'grey', linestyle = '-')
    plt.plot(days, data["Pu240"], label='Pu240', color = 'grey', linestyle = '--')
    plt.plot(days, data["Pu241"], label='Pu241', color = 'grey', linestyle = ':')
    plt.plot(days, data["Pu242"], label='Pu242', color = 'grey', linestyle = '-.')

    plt.xlabel(r"Burnup time, $t$ [days]", fontsize = 12)
    plt.ylabel(r"Concentration, $c$ [mol/cm$^{3}$]", fontsize = 12)
    plt.legend(fontsize = 11.5)
    plt.xlim(0, 588)
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=(8,4))

    plt.plot(days, data["U238"], label='U238', color = 'k')

    plt.xlabel(r"Burnup time, $t$ [days]", fontsize = 12)
    plt.ylabel(r"Concentration, $c$ [mol/cm$^{3}$]", fontsize = 12)
    plt.legend(fontsize = 11.5)
    plt.xlim(0, 588)
    plt.tight_layout()
    plt.show()

