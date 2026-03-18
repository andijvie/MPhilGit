% Sum over the first dimension (groups)
total_flux   = squeeze(sum(flux(:,:,:), 1));     % → (radial, axial)
total_fluxNa = squeeze(sum(fluxNa(:,:,:), 1));   % → (radial, axial)

% Get dimensions
nr = size(total_flux, 1);
nz = size(total_flux, 2);

% Coordinate vectors
r = 1:nr;
z = 1:nz;

% Grid
[R, Z] = meshgrid(r, z);

% Create figure
figure

% Plot both surfaces
h1 = surf(R, Z, total_flux');
hold on
h2 = surf(R, Z, total_fluxNa');

% Transparency so both are visible
set(h1, 'FaceAlpha', 0.2)
set(h2, 'FaceAlpha', 0.7)

% Remove mesh lines for clarity
set(h1, 'EdgeColor', 'none')
set(h2, 'EdgeColor', 'none')

% Smooth shading
shading interp
colorbar

% Labels
xlabel('Radial position, $r$ [cm]', 'Interpreter', 'latex')
ylabel('Axial position, $z$ [cm]', 'Interpreter', 'latex')
zlabel('Total flux, $\phi$ [cm$^{-2}$s$^{-1}$]', 'Interpreter', 'latex')


legend('Lead', 'Sodium')

view(3)