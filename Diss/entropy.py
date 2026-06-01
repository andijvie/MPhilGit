import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import root_scalar
from pathlib import Path

file_path = Path(r"\\wsl$\Ubuntu\home\andijvie\SCONE\InputFiles\popRed.json")
script_dir = str(Path(__file__).resolve().parent) + "\\"

clrs = np.array(["black", "dimgrey", "darkgrey", "black", "dimgrey", "darkgrey", "black", "dimgrey", "darkgrey"])
lnstls = np.array(['-','-','-','--','--','--',':',':',':','-.','-.','-.'])

# vary pop
aHalf = 60
LHalf = 100
pops = np.array([200, 500, 1000, 2000, 5000, 10000, 20000, 50000])

plt.figure(figsize=(10,7))

i = 0
for pop in pops:
    ext = "_N" + str(pop) + "L" + str(LHalf) + "a" + str(aHalf) + ".npy"

    shannon_entropy = np.load(script_dir + "S" + ext)
    generations = np.arange(1, len(shannon_entropy) + 1)
    plt.plot(generations, shannon_entropy, color = clrs[i], linestyle = lnstls[i], lw = 1, label = str(pop))
    
    i += 1

plt.title("Halfwidth = "+ str(LHalf) + ", a = "+ str(aHalf) + ", vary population")
plt.xlabel("Generation")
plt.ylabel("Shannon entropy")
plt.legend(loc = 'lower right')
plt.tight_layout()
plt.show()


# vary a
aHalfs = [40, 50, 60, 70, 80, 90, 95, 97, 99]
LHalf = 100
pop = 2000

plt.figure(figsize=(10,7))

i = 0
for aHalf in aHalfs:
    ext = "_N" + str(pop) + "L" + str(LHalf) + "a" + str(aHalf) + ".npy"

    shannon_entropy = np.load(script_dir + "S" + ext)
    generations = np.arange(1, len(shannon_entropy) + 1)
    plt.plot(generations, shannon_entropy, color = clrs[i], linestyle = lnstls[i], lw = 1, label = str(aHalf))
    
    i += 1

plt.title("Population = "+ str(pop) + ", Halfwidth = "+ str(LHalf) + ", vary a")
plt.xlabel("Generation")
plt.ylabel("Shannon entropy")
plt.legend(loc = 'lower left')
plt.tight_layout()
plt.show()

# vary scale
LHalfs = [10, 20, 50, 100, 200, 500, 1000, 2000, 5000]
aRat = .8
pop = 2000

plt.figure(figsize=(10,7))

i = 0
for LHalf in LHalfs:
    aHalf = int(aRat * LHalf)
    ext = "_N" + str(pop) + "L" + str(LHalf) + "a" + str(aHalf) + ".npy"

    shannon_entropy = np.load(script_dir + "S" + ext)
    generations = np.arange(1, len(shannon_entropy) + 1)
    plt.plot(generations, shannon_entropy, color = clrs[i], linestyle = lnstls[i], lw = 1, label = str(LHalf))
    
    i += 1

plt.title("Population = "+ str(pop) + ", a/L = "+ str(aRat) + ", vary L")
plt.xlabel("Generation")
plt.ylabel("Shannon entropy")
plt.legend(loc = 'lower left')
plt.tight_layout()
plt.show()



