import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import root_scalar

Sigma_t = 1.
Sigma_a = 0.01
Sigma_s = Sigma_t-Sigma_a
Sigma_f = Sigma_a
Sigma_c = Sigma_a

def getMubar():
    return 0.17785713513681772

def getD():
    return 1/(3*(Sigma_t - getMubar() * Sigma_s))

def getAlpha():
    return np.sqrt(Sigma_c/getD())


# -----------------------------
# Parameters (edit these)
A = 1.0
a = 40
L = 50
alpha = getAlpha()
print(f"Alpha = {alpha}")





k_max = 3          # how far in kappa to search/plot
samples_per_branch = 800  # resolution per tan-branch for plotting + bracketing
eps = 1e-6            # avoid tan singularities


d = a - L
rhs = -alpha * np.tanh(alpha * a)

def f(k):
    # f(k) = k*tan(k*(a-L)) + alpha*tanh(alpha*a)  (same equation rearranged to f=0)
    return k * np.tan(k * d) - rhs

# --- Find roots up to k_max by scanning between tan poles ---
absd = abs(d)
if absd == 0:
    raise ValueError("a-L must be nonzero.")

# tan poles in k>0: k*abs(d) = (m+1/2)pi  ->  k = (m+1/2)pi/abs(d)
m_max = int(np.floor((k_max * absd) / np.pi - 0.5))
poles = (np.arange(m_max + 1) + 0.5) * np.pi / absd
# build branch boundaries: [0, pole0, pole1, ..., k_max]
bounds = np.concatenate(([0.0], poles[poles < k_max], [k_max]))

roots = []

for i in range(len(bounds) - 1):
    left, right = bounds[i], bounds[i + 1]
    if right - left <= 10 * eps:
        continue

    # shrink away from endpoints to avoid evaluating too close to poles
    Lk = left + eps
    Rk = right - eps
    if Lk >= Rk:
        continue

    # sample inside branch and locate sign changes
    ks = np.linspace(Lk, Rk, samples_per_branch)
    ys = f(ks)

    # remove any non-finite values (should be rare if eps is sensible)
    finite = np.isfinite(ys)
    ks, ys = ks[finite], ys[finite]
    if len(ks) < 2:
        continue

    s = np.sign(ys)
    # indices where sign changes between consecutive points
    idx = np.where(s[:-1] * s[1:] < 0)[0]

    for j in idx:
        a_k, b_k = ks[j], ks[j + 1]
        try:
            sol = root_scalar(f, bracket=(a_k, b_k), method="brentq", maxiter=200)
            if sol.converged:
                r = sol.root
                # dedupe (can happen if two brackets converge to same root)
                if all(abs(r - rr) > 1e-5 for rr in roots):
                    roots.append(r)
        except ValueError:
            pass

roots.sort()

print(f"Found {len(roots)} solution(s) for kappa in (0, {k_max}]:")
for r in roots:
    print(f"  kappa = {r:.10f}")

# --- Plot f(k) with poles and mark roots ---
plt.figure(figsize=(9, 4.5))

for i in range(len(bounds) - 1):
    left, right = bounds[i], bounds[i + 1]
    Lk = left + eps
    Rk = right - eps
    if Lk >= Rk:
        continue
    ks = np.linspace(Lk, Rk, samples_per_branch)
    ys = f(ks)
    # clip extreme values so the plot stays readable (optional)
    ys = np.clip(ys, -50, 50)
    plt.plot(ks, ys)

# zero line
plt.axhline(0, linewidth=1)

# poles as vertical dashed lines
for p in poles:
    if 0 < p < k_max:
        plt.axvline(p, linestyle="--", linewidth=0.8, alpha=0.5)

# roots as markers
if roots:
    plt.scatter(roots, np.zeros_like(roots), zorder=5)

plt.xlim(0, k_max)
plt.ylim(-10, 10)
plt.xlabel(r"$\kappa$")
plt.ylabel(r"$f(\kappa) = \kappa \tan(\kappa(a-L)) + \alpha \tanh(\alpha a)$")
plt.title("Transcendental equation solutions (roots where f=0)")
plt.grid(True, alpha=0.25)
plt.tight_layout()
plt.show()








kappa = 0.1002947963
# -----------------------------

# x grid on (-L, L)
x = np.linspace(-L, L, 4000)

# Precompute constants used in the outer pieces
C_left  = A * np.cosh(alpha * a) / np.cos(kappa * (a - L))   # for -L < x < -a
C_right = A * np.cosh(alpha * a) / np.cos(kappa * (a - L))   # for  a < x <  L

phi = np.empty_like(x)

# Regions (use <= for boundaries to avoid gaps; adjust if you want strict <)
mask_left   = x <= -a
mask_middle = (x > -a) & (x < a)
mask_right  = x >= a

phi[mask_left]   = C_left  * np.cos(kappa * (x[mask_left]  + L))
phi[mask_middle] = A * np.cosh(alpha * x[mask_middle])
phi[mask_right]  = C_right * np.cos(kappa * (x[mask_right] - L))

# Plot
plt.figure(figsize=(16, 8))
plt.axvline(-a, linestyle='--', color = 'lightgrey', lw = 1)
plt.axvline( a, linestyle='--', color = 'lightgrey', lw = 1)
plt.axvline(-L, linestyle=':', color = 'lightgrey', lw = 1)
plt.axvline( L, linestyle=':', color = 'lightgrey', lw = 1)
plt.plot(x, phi, label=r'$\phi(x)$', color = 'k', linestyle='--', lw=2)
plt.xlabel('x')
plt.ylabel(r'$\phi$')
plt.title('Piecewise function plot')
plt.legend()
plt.tight_layout()
plt.show()

