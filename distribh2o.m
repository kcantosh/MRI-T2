function [ POSH2O ] = distribh2o( inpt , POSPT )
% distribute H2O molecules randomply in space
% INPUT:
%   BOXSZ - size of the simulation box [nm]
%   nh2o - number of H2O molecules in the simulation box
%   POSPT - 3D positions of particles in the box [nm]
%   rpt - radius of particles [nm]
% OUTPUT:
%   POSPT - position coordinates of H2O molecules in 3D [nm]

BOXSZ = inpt.BOXSZ;
nh2o = inpt.nh2o;
rpt = inpt.rpt;

dim = length(BOXSZ);
POSH2O = zeros(nh2o,dim);
POSH2ORED = zeros(nh2o,dim);
POSH2ORED = rand( size(POSH2ORED) );

% Get initial positions
for i = 1 : dim
    POSH2O(:,i) = POSH2ORED(:,i)*BOXSZ(i);
end

% Check if H2O molecule is inside of the particles
for i = 1 : nh2o
    while insidept( POSH2O(i,:) , POSPT , rpt , BOXSZ )
        % redefine the position of H2O molecule if inside the nanoparticle
        POSH2O(i,:) = rand( size(POSH2O(i,:)) ).*BOXSZ;
    end
end

end

