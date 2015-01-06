function [ POSPT ] = distribpt( inpt )
% distribute particles randomply in space
% INPUT:
%   BOXSZ - size of the simulation box [nm]
%   npt - number of particles in the simulation box
% OUTPUT:
%   POSPT - positions coordinates of particles in 3D [nm]
BOXSZ = inpt.BOXSZ;
npt = inpt.npt;

dim = length(BOXSZ);
POSPT = zeros(npt,dim);
POSPTRED = zeros(npt,dim);

if inpt.NPdist == 0 % random distribution of NP
    
    POSPTRED = rand( size(POSPTRED) ); % random positions
    for i = 1 : dim
        POSPT(:,i) = POSPTRED(:,i)*BOXSZ(i);
    end
    return
    
elseif inpt.NPdist == 1 % cluster agregate of NPs
    
    count = 0;
    for ix = 1 : ceil(npt^(1/3))
        for iy = 1 : ceil(npt^(1/3))
            for iz = 1 : ceil(npt^(1/3))
                count = count + 1;
                POSPT(count,:) = [ix iy iz]*2*inpt.rpt;
                if count == npt
                    return
                end
            end
        end
    end
    % if reached this point, something is wrong
    fprintf( 1 , 'Not all nanoparticles were distributed: %i from %i\n' , ...
        [count npt] );
    error( 'Not all nanoparticles were distributed' );

else % none of above? ERROR
    fprintf( 1 , 'inpt.NPdist = %i\n' , inpt.NPdist );
    error( 'Unsupported value of inpt.NPdist. It should be 0 or 1' );
end