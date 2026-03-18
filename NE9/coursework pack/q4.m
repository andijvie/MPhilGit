R = 85 * (1+100 * 17e-6);
H = 110 * (1+100 * 17e-6);
volExp = (1+100 * 17e-6)^3;
volExpNa = (1+100 * 290e-6); % > volExp


alphaR = 0.7;
alphaZ = 0.7;
matCoreExp.rmax = 1000;

x = 0.1248;

matCoreExp.na = 1.1784e+22 / volExp;

matCoreExp.o = 1.4723e+22 / volExp;
matCoreExp.u238 = 7.3614e+21 * (1-x) / volExp;
matCoreExp.pu239 = 7.3614e+21 * (x) / volExp;

matCoreExp.steel = 1.6993e+22 / volExp;
materialDefs = {matCoreExp};

[fluxNaExp, k] = CSGROV(R, H, alphaR, alphaZ, materialDefs);

