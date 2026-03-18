R = 69.71;
H = 200;
alphaR = 0.7;
alphaZ = 0.7;


matCoreNa.rmax = 1000;
x = 0.1248;
matCoreNa.na = 1.1784e+22;
matCoreNa.o = 1.4723e+22;
matCoreNa.u238 = 7.3614e+21 * (1-x);
matCoreNa.pu239 = 7.3614e+21 * (x);
matCoreNa.steel = 1.6993e+22;

matCoreNaked = rmfield(matCoreNa, 'na');
matCoreNaked.rmax = 6.5;

materialDefs = {matCoreNaked matCoreNa};

matCoreNaked.rmax = 1000;

materialDefsNaked = {matCoreNaked};

[flux, k] = CSGROV(R, H, alphaR, alphaZ, materialDefsNaked);

