function inpt = assigninptdt( )
% assign input parameters

inpt.seed = 3; % seed for random numbers
%inpt.seed = int64( (datenum(clock) - datenum('2000','yyyy'))*24*60*60 );
inpt.BOXSZ = [ 1 1 1 ]* (1e+17/10)^(-1/3); % 3D size of the simulation box [m]
inpt.npt = 10; % Number of particles in the simulation box
inpt.rpt = 15e-9; % Radius or particles [m]
inpt.nh2o = 100; % Number of protons
inpt.tend = 120e-3; % Finite simulation time [s]
inpt.D = 2.5e-9; % Diffusion coefficient [m^2/s] for water
inpt.M = [0 0 1]*2*2.5e-19; % Magnetic moment for nanoparticles [J/T]
inpt.tau0 = 4e-3; % Time between 180deg pulses [s]
inpt.dt = inpt.tau0/20; % Step time for simulation [s]
inpt.GM = [0  0  0.0]; % Magnetic field gradient magnitude [T/m]
inpt.GPS = [0 0  1;...
            0 0  1]; % Gradient pulse sequence
inpt.TGPS = [0.5 0.5]; % Timing for the gradient pulse sequence
inpt.NPdist = 0; % distribution of NPs: 0 - random; 1 - cluster
    
end