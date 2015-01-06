function prtinpt( inpt )
% print input parameters
% INPUT:
%   inpt - imput data (structure format)

fprintf( 1 , 'Seed for random numbers: %i\n' , inpt.seed );
fprintf( 1 , '3D size of the simulation box [m]: %e %e %e\n' , ...
    inpt.BOXSZ );
fprintf( 1 , 'Number of particles in the simulation box: %u\n' , ...
    inpt.npt );
fprintf( 1 , 'Radius or particles [m]: %e\n' , inpt.rpt );
fprintf( 1 , 'Number of water molecules: %u\n' , inpt.nh2o );
fprintf( 1 , 'Finite simulation time [s]: %e\n' , inpt.tend );
fprintf( 1 , 'Diffusion coefficient [m^2/s] for water: %e\n' , inpt.D );
fprintf( 1 , 'Magnetic moment for nanoparticles [J/T]: %e %e %e\n' , ...
    inpt.M );
fprintf( 1 , 'Time between 180deg pulses [s]: %e\n' , inpt.tau0 );
fprintf( 1 , 'Step time for simulation [s]: %e\n' , inpt.dt );
fprintf( 1 , 'Magnetic field gradient [T/m]: %e %e %e\n' , inpt.GM );
fprintf( 1 , 'Gradient pulse sequence in percent of GM = %e %e %e\n' , ...
    inpt.GPS' );
fprintf( 1 , 'Timing for the gradient pulse sequence t(i)/TE = %e\n' , ...
    inpt.TGPS );

if inpt.NPdist == 0
    string = 'random';
elseif inpt.NPdist == 1
    string = 'cluster';
else
    string = 'UNKNOWN';
end
fprintf( 1 , 'Distribution of NPs: %s\n' , ...
    string );

end

