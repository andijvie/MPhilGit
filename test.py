import numpy as np

def product_interp_operator(points, delta, multiplier):
    out = np.zeros((points - 1, points))
    for i in np.arange(points - 1):
        out[i, i] = delta * multiplier[i]/2
        out[i, i + 1] = delta * multiplier[i]/2

    return out

print(product_interp_operator(11, 1, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))