%
% CSGROV: Cylindrical Simulator using GROups and Volumes
% Simulator designed for exploring fast reactors.
% Written by Paul Cosgrove (pmc55). Email if things misbehave (provided the 
% misbehaviour is caused by my code and not by further modifications).
%
% Solves a radial + axial diffusion equation using a finite volume approach
% XSs may vary radially, but not axially.
% R is the radius, H is the height, alphaR is radial albedo, alphaZ is 
% axial albedo and materialDefs describes the materials. 
% The final argument has a particular syntax.
%
% Input syntax for materialDefs:
% materialDefs = {mat1 mat2 ... matN};
% Each mat will be defined as:
% matX.rmax  = maximum radial position of material [cm] (make it greater
%                        than the outer radius for the outermost material)
% matX.[symbol+isotope number] = atomic density [atoms/cm3]
% For example: matX.pu239 = 0.005, matX.o = 0.01, etc.
% A material can contain several isotopes. The allowable isotope (or
% isotope mixture) names are the following:
% pu239, pu240, pu241, pu242, th232, u233, u235, u238, am241, np237, na, 
% fe, c, o, cr, mo, pb, bi, b10, ni, zr, steel
%
% These rely on the corresponding data files being present locally.
%
% An example materialDefs input might be:
% matInner.pu239 = 20; matInner.rmax = 42; matInner.o16 = 2.718;
% matOuter.u235 = 8; matOuter.u238 = 70; matOuter.rmax = 1000000;
% materialDefs = [matOuter matInner]
%
% Flux is a 3D array output, k is the eigenvalue, r is an array of radial
% positions h is an array of heights (both averaged in each volume), and
% EB is an array of energy bounds in MeV [upper bounds, lower bounds] for
% use in spectrum plotting.
%
% The cross sections used here are extended from:
% Templin, L J (ed) ANL-5800 Reactor Physics Constants 2nd edition, 
% Argonne National Laboratory 1963
%
function [flux,k,it,rbar,hbar,EB] = CSGROV(R,H,alphaR,alphaZ,materialDefs)

% Dimensions are in cm

% Maximum number of iterations - may need to change this when dealing with
% a difficult problem
maxIter = 300;

% Determine mesh width
% Have a fixed number of meshes in both directions
nr = 100;
nh = 100;
dr = R/nr;
dh = H/nh;

% Initialise necessary geometric info.
r = zeros(1,nr);
dr2 = r;
rbar = r;
h = zeros(1,nh);
hbar = h;

for i = 1:nr
    r(i) = i*dr;
    rbar(i) = (i-1)*dr + dr/2;
    dr2(i) = (i*dr)^2 - ((i-1)*dr)^2;
end
for i = 1:nh
    h(i) = i*dh;
    hbar(i) = (i-1)*dh + dh/2;
end

% Process material inputs to create XSs
[G,nuSigmaF,chi,SigmaR,SigmaS,D,SigmaF,EB] = makeXSs(r,materialDefs);

% If you want to test the solver out, these XSs could be replaced by 1G
% XSs here by setting G = 1 and initialising the vectors as size [nr, 1].
% SigmaS can be zero'd safely and SigmaR set as SigmaA.

% Initialise flux
flux = ones(nr*nh*G,1);
prevFlux = flux;
k = 1;
err = 1;
tol = 1E-5;

% Create diffusion + removal matrix
M = makeMatrix(nr,nh,G,r,dr,dr2,dh,SigmaR,D,alphaR,alphaZ);

% Perform power iteration
it = 0;
while err > tol

    % Update source
    Q = makeSource(flux,chi,nuSigmaF,k,SigmaS,nr,nh,G,dh,dr2);

    % Invert diffusion operator
    flux = M\Q;

    % Update eigenvalue
    k = calculateK(flux,prevFlux,k,nuSigmaF,dr2,dh,nr,nh,G);

    % Check convergence
    err = max(abs(flux - prevFlux)./flux);
    prevFlux = flux;
    
    it = it + 1;

    if it > maxIter
        error(['The maximum number of iterations has been exceeded. ',...
            'There may be an error in your input. Otherwise, ',...
            'modify maxIter at the top of the code'])
    end
end

% Rescale flux to correspond to a realistic power density
% Assume 300 MW/m3 and 200 MeV/fission
powerDens = 300 * 10^6 / (100^3); % W/cm3
EPF = 200 * 10^6 * 1.60218E-19;
flux = scaleFluxToPower(flux,SigmaF,EPF,powerDens,dr2,dh,nr,nh,G);

% Reshape flux into a 3D array for plotting
flux = reshape(flux,[G,nr,nh]);

end

%
% Make the diffusion/removal matrix.
% Flux array indexes by group, then radius, then height in order of speed.
%
function M = makeMatrix(nr,nh,G,r,dr,dr2,dz,SigmaR,D,alphaR,alphaZ)

% Preallocate sparse matrix and estimate number of nonsparse elements
nonSparse = nr*nh*G*5;
M = spalloc(nr*nh*G,nr*nh*G,nonSparse);
albedoR = 0.5*(1-alphaR)/(1+alphaR);
albedoZ = 0.5*(1-alphaZ)/(1+alphaZ);

for i = 1:nh
    for j = 1:nr
        for g = 1:G

            % Create indices in matrix
            ijg = (i - 1)*nr*G + (j - 1)*G + g;  % Index of phi_{i,j,g}
            iPjg = ijg + nr*G;   % Index of phi_{i+1,j,g}
            iMjg = ijg - nr*G;   % Index of phi_{i-1,j,g}
            ijPg = ijg + G;      % Index of phi_{i,j+1,g}
            ijMg = ijg - G;      % Index of phi_{i,j-1,g}

            % Add removal term - present in all circumstances
            m = SigmaR(j,g)*dz*pi*dr2(j);

            % Radial boundary condition check
            if j == 1
                m = m + dz*pi*r(j)*(D(j,g)+D(j+1,g))/dr;
                M(ijg,ijPg) = -pi*r(j)*dz*(D(j,g)+D(j+1,g))/dr;
            elseif j == nr
                m = m + 2*albedoR*dz*pi*r(j) + dz*pi*r(j-1)*(D(j-1,g)+D(j,g))/dr;
                M(ijg,ijMg) = -pi*r(j-1)*dz*(D(j,g)+D(j-1,g))/dr;
            else
                m = m + dz*pi*(r(j-1)*(D(j,g)+D(j-1,g))/dr + r(j)*(D(j,g)+D(j+1,g))/dr);
                M(ijg,ijMg) = -pi*r(j-1)*dz*(D(j,g)+D(j-1,g))/dr;
                M(ijg,ijPg) = -pi*r(j)*dz*(D(j,g)+D(j+1,g))/dr;
            end

            % Axial boundary condition check
            if i == 1
                m = m + pi*dr2(j)*(albedoZ + D(j,g)/dz);
                M(ijg,iPjg) = -D(j,g)*pi*dr2(j)/dz;
            elseif i == nh
                m = m + pi*dr2(j)*(albedoZ + D(j,g)/dz);
                M(ijg,iMjg) = -D(j,g)*pi*dr2(j)/dz;
            else
                m = m + 2*pi*D(j,g)*dr2(j)/dz;
                M(ijg,iPjg) = -D(j,g)*pi*dr2(j)/dz;
                M(ijg,iMjg) = -D(j,g)*pi*dr2(j)/dz;
            end
            
            M(ijg,ijg) = m;

        end
    end
end

end


%
% Function to construct the source in each region
%
function Q = makeSource(flux,chi,nuSigmaF,k,SigmaS,nr,nh,G,dz,dr2)

Q = zeros(nr*nh*G,1);

% Loop over all meshes
for i = 1:nh
    for j = 1:nr


        % Flux idxs
        idxF0 = (i - 1)*nr*G + (j - 1)*G + 1;
        idxF1 = (i - 1)*nr*G + j*G;

        % Calculate fission and scattering sources
        fiss = nuSigmaF(j,1:G)*flux(idxF0:idxF1)/k;

        scatMat(:,:) = SigmaS(1:G,1:G,j);
        scatter = scatMat*flux(idxF0:idxF1);

        V = dz*pi*dr2(j);
        Q(idxF0:idxF1) = V*(fiss*chi(j,1:G)' + scatter);
        

    end
end

end

%
% Calculate k: 
% calculate total neutron production rates in this iteration and the
% previous and take a ratio
%
function k = calculateK(flux,prevFlux,k,nuSigmaF,dr2,dz,nr,nh,G)

% Loop to accumulate total fission production rates
fiss = 0;
prevFiss = 0;
for i = 1:nh
    for j = 1:nr
        
        V = dr2(j) * pi * dz; 

        % Flux idxs
        idxF0 = (i - 1)*nr*G + (j - 1)*G + 1;
        idxF1 = (i - 1)*nr*G + j*G;

        fiss = fiss + nuSigmaF(j,1:G)*flux(idxF0:idxF1)*V;
        prevFiss = prevFiss + nuSigmaF(j,1:G)*prevFlux(idxF0:idxF1)*V;

    end
end

k = k * fiss / prevFiss;

end

%
% Scale the flux to correspond to a given power density and energy
% per fission (in W/cm3 and J, respectively)
%
function flux = scaleFluxToPower(flux,SigmaF,EPF,powerDens,dr2,dh,nr,nh,G)

integral = 0;
Vtotal = 0;
for i = 1:nh
    for j = 1:nr

        V = dr2(j)*pi*dh;
        Vtotal = Vtotal + V;

        % Flux idxs
        idxF0 = (i - 1)*nr*G + (j - 1)*G + 1;
        idxF1 = (i - 1)*nr*G + j*G;

        integral = integral + V*SigmaF(j,1:G)*flux(idxF0:idxF1)*EPF;

    end
end

scaleFactor = Vtotal * powerDens / integral;
flux = flux * scaleFactor;

end

%
% Produce the multigroup XSs necessary for the simulation given
% material definitions and the radius vector 
% (to ensure XSs are positioned correctly)
% Must ensure materialDefs is defined correctly!
%
function [G,nuSigmaF,chi,SigmaR,SigmaS,D,SigmaF,EB] = makeXSs(r,materialDefs)

% Find how many materials are present
N = length(materialDefs);

G = 20;

rmax = zeros(N,1);

% Loop through materials once to order in terms of rmax
for n = 1:N

    if iscell(materialDefs)
        mat = materialDefs{n};
    else
        if length(materialDefs) > 1
            error('materialDefs should be a cell array')
        end
        mat = materialDefs;
    end

    % Must have rmax or else produce a crash
    if isfield(mat,'rmax')
        rmax(n) = mat.rmax;
    else
        error('A material does not have the property rmax');
    end

end

% Ensure one value of rmax is greater than the maximum radius
if (max(rmax) < r(end))
    error('rmax across all materials is less than the radius');
end

% Sort materials by their rmax
[~,I] = sort(rmax);

% Initialise global XS arrays
SigmaR = zeros(length(r),G);
SigmaF = zeros(length(r),G);
nuSigmaF = zeros(length(r),G);
chi = zeros(length(r),G);
SigmaS = zeros(G,G,length(r));
D = zeros(length(r),G);

% Loop through materials in order of radius
rInitial = 1;
for n = 1:N
    if iscell(materialDefs)
        mat = materialDefs{I(n)};
    else
        if length(materialDefs) > 1
            error('materialDefs should be a cell array')
        end
        mat = materialDefs;
    end

    % Find the maximum radius into which XS values may be placed
    rlocal = mat.rmax;
    rFinal = find(r>rlocal,1);

    % Check for an empty rFinal - rmax is greater than the problem, i.e.,
    % this is the last material
    if isempty(rFinal)
        rFinal = length(r);
    end

    % Initialise local XS arrays
    SigTr = zeros(G,1);
    SigF = zeros(G,1);
    SigR = zeros(G,1);
    nuSigF = zeros(G,1);
    chiLoc = zeros(G,1);
    sumNSF = zeros(G,1);
    SigS = zeros(G,G);

    % Read isotopes and densities to produce partial macroscopic XSs
    isotopes = fieldnames(mat);
    densities = struct2cell(mat);
    % Check for only one entry, i.e., rmax:
    if length(isotopes) == 1
        error('Must have more than one entry in material structure')
    end
    % Loop over entries to construct XSs
    for i = 1:length(isotopes)

        if strcmp(isotopes{i},'rmax')
            continue
        end

        [sigTr,nsf,chiI,sigS,sigR,sigF,EL,EU] = readXS(isotopes{i},densities{i},G);

        SigTr = SigTr + sigTr;
        if (any(nsf>0))
            SigF = SigF + sigF;
            nuSigF = nuSigF + nsf;
            chiLoc = chiLoc + chiI * sum(nsf);
            sumNSF = sumNSF + sum(nsf);
        end
        SigS = SigS + sigS;
        SigR = SigR + sigR;

        if ~exist("EB","var")
            EB = [EU EL];
        end
    end

    % Ensure chi is suitably normalised
    if (sumNSF>0)
        chiLoc = chiLoc./sumNSF; % this step is probably redundant...
        chiLoc = chiLoc./sum(chiLoc);
    end

    % Convert sigTr to a diffusion coefficient
    Dloc = 1./(3.*SigTr);
    if any(isnan(Dloc))
        error('Somehow have a NaN diffusion coefficient. Check nuclide densities!');
    end

    % Place XSs in the appropriate radial regions of their vectors
    for rIdx = rInitial:rFinal
        SigmaR(rIdx,:) = SigR';
        SigmaF(rIdx,:) = SigF';
        nuSigmaF(rIdx,:) = nuSigF';
        chi(rIdx,:) = chiLoc';
        SigmaS(:,:,rIdx) = SigS(:,:);
        D(rIdx,:) = Dloc';
    end

    % Terminate loop if greater than outer radius, just in case
    % there are even more materials further out that aren't relevant
    if rlocal > r(end)
        break
    end

    rInitial = rFinal + 1;
end


end

%
% Produces partial macroscopic XSs for an isotope with a given density
% isoName is the name of the isotope which must be one of the allowed
% names, density is the isotope's density in atom/cm3, G is the number of
% groups allowed (20 by default, will be truncated if less, will error if 
% greater)
%
% sigTr is the transport XS, nsf is nu*fission XS, chi is the fission
% spectrum, sigS is the scattering matrix, sigR is the removal XS, sigF is
% the fission XS, EL is the lower energy bound for a group and EU is the
% upper energy bound for a group.
%
function [sigTr,nsf,chi,sigS,sigR,sigF,EL,EU] = readXS(isoName,density,G)

b = 10^(-24); % 1barn = 10^-24 cm2

% list of acceptable isotope names
names = {'pu239', 'pu240', 'pu241', 'pu242', 'th232', 'u233', 'u235', ...
    'u238', 'am241', 'np237', 'na', 'fe', 'c', 'o', 'cr', 'mo', 'pb', ...
    'bi', 'b10', 'ni', 'zr', 'steel'};

% Ensure G is valid
if G > 20 || G < 1
    error('Number of groups must be between 1 and 20')
end

% Ensure isotope name is valid
if ~any(strcmp(names,isoName))
    error(['Invalid isotope name provided: ',isoName,'.']);
end

% Must have files locally and named appropriately, otherwise this won't
% work!
load(isoName,'sigf','nu','sigtr','chi','sigs','sigr','EL','EU');

sigTr = sigtr(1:G) * density * b;
sigF = sigf(1:G) * density * b;
nsf = nu(1:G) .* sigf(1:G) * density * b;
chi = chi(1:G);
sigS = sigs(1:G,1:G) * density * b;
sigR = sigr(1:G) * density * b;

end


% input:
% [flux, k, it, rbar, hbar, EB] = CSGROV(R, H, alphaR, alphaZ, materialDefs)
% R = the outer radius of the reactor in cm.the outer radius of the reactor in cm.
% H =  the height of the reactor in cm.
% alphaR = the radial albedo of the reactor (dimensionless).
% alphaZ = the axial albedo of the reactor (dimensionless).
% materialDefs = the definitions of the materials in the reactor.


% EX 2a
% R = 85
% H = 110
% alphaR = 0.7
% alphaZ = 0.7
% matCore.rmax = 1000

% x = 0.1248

% density = 0.9 g * 6.023e23 /mol /23 u = 2.3568e22 atoms / cm3
% 50% --> 1.1784 atoms / cm3
% matCore.na = 1.1784e+22

% density = 11 g * 6.023e23 /mol /270 u = 2.4538e22 atoms / cm3
% 30% --> 7.3614e21 / cm3
% two molecules --> 1.4723e22 / cm3
% matCore.o = 1.4723e+22
% matCore.u238 = 7.3614e+21 * (1-x)
% matCore.pu239 = 7.3614e+21 * (x)

% density = 7.9 g * 6.023e23 /mol /56 u = 8.4967e22 atoms / cm3
% 20% --> 1.6993e22 atoms / cm3
% matCore.steel = 1.6993e+22

% materialDefs = {matCore}

% [fluxS, k] = CSGROV(R, H, alphaR, alphaZ, materialDefs)

% x = 0.1; matCore.u238 = 7.3614e+21 * (1-x); matCore.pu239 = 7.3614e+21 * (x); materialDefs = {matCore}; [flux, k] = CSGROV(R, H, alphaR, alphaZ, materialDefs)

% ex 2b
% matCore = rmfield(matCore, 'na')

% density = 11.3 g * 6.023e23 /mol /207 u = 3.2879e22 atoms / cm3
% 50% --> 1.6440e22 atoms / cm3
% matCore.pb = 1.6440e+22

% materialDefs = {matCore}

% [flux, k] = CSGROV(R, H, alphaR, alphaZ, materialDefs)


% x = 0.1; matCore.u238 = 7.3614e+21 * (1-x); matCore.pu239 = 7.3614e+21 * (x); materialDefs = {matCore}; [flux, k] = CSGROV(R, H, alphaR, alphaZ, materialDefs)

