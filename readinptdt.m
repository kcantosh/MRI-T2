function inpt = readinptdt( )
% read input data in a query mode

inpt.seed = input('seed for random numbers = \n');
inpt.BOXSZ = input('3D size of the simulation box [m] = \n');
inpt.npt = input('Number of particles in the simulation box = \n');
inpt.rpt = input('Radius or particles [m] = \n');
inpt.nh2o = input('Number of protons = \n');
inpt.tend = input('Finite simulation time [s] = \n');
inpt.D = input('Diffusion coefficient [m^2/s] for water = \n');
inpt.M = input('Magnetic moment for nanoparticles [J/T] = \n');
inpt.tau0 = input('Time between 180deg pulses [s] = \n');
inpt.dt = input('Step time for simulation [s] = \n');
inpt.GM = input('Magnetic field gradient [T/m] = \n');
inpt.GPS = input('Gradient pulse sequence in % of GM = \n');
inpt.TGPS = input('Timing for the gradient pulse sequence t(i)/TE = \n');
inpt.NPdist = input('distribution of NPs (0 - random; 1 - cluster) = \n');

end

