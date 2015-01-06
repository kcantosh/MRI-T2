function [ B ] = mfield( inpt , POSPT , POSH2O , TIME , pbcdepth )
% calculate magnetic field due to nanoparticles

% INPUT
%   pbcdepth - depth for the periodical boundary conditions
BOXSZ = inpt.BOXSZ;
M = inpt.M;
GM = inpt.GM;
GPS = inpt.GPS;
TGPS = inpt.TGPS;
tau0 = inpt.tau0;
dt = inpt.dt;



% Constants
m0 = 4*pi*1e-7; % magnetic permitivity [N A^2]

% Aray allocation
npt = size(POSPT,1);
nh2o = size(POSH2O,1);
ntime = size(POSH2O,3);
B = zeros(size(POSH2O));
Bg = zeros(size(POSH2O));

% Contribution from magn. moment of individual NPs
for i = 1 : nh2o % for all water molecules
    progrbar( i/nh2o , 'Magn. field:' );
    for j = 1 : ntime % for all times
        Rh2o = POSH2O(i,:,j);
        Rh2o = return2box( Rh2o , BOXSZ ); % Bring H2O molecule to the box
        for k = 1 : npt % for all nanoparticles
            for lx = -pbcdepth : pbcdepth
                for ly = -pbcdepth : pbcdepth
                    for lz = -pbcdepth : pbcdepth
                        % period. bound conditions (PBC)
                        Rnp = POSPT(k,:) + BOXSZ.*[lx ly lz];
                        R = Rnp - Rh2o;
                        r = sqrt(sum(R.*R));
                        B(i,:,j) = B(i,:,j) + m0/(4*pi*r^3)*...
                            ( 3*R*sum(M.*R)/r^2 - M );
                    end
                end
            end
        end
    end
end

% Contribution from the gradient
ntau0 = round( tau0/dt ); % number of *dt* time intervals per cycle
nTGPS = round(TGPS*ntau0); % number of *dt* intervals per gradient pulse
fprintf( 1 , 'number of *dt* intervals per gradient pulse: %i\n' , nTGPS );
jg = 1; % begin with the 1st gradient pulse
jcount = 1;
for j = 1 : ntime % for all times
    G = GM.*GPS(jg,:); % determine appropriate gradient
    for i = 1 : nh2o % for all water molecules
        Bg(i,:,j) = G.*POSH2O(i,:,j); % apply gradient
    end
    jcount = jcount + 1; % move to the next *dt* time interval
    if jcount > nTGPS(jg) - eps % the current pulse is over?
        if jg + 1 <= length(nTGPS)
            jg = jg + 1; % move to the next pulse
        else % *tau0* time is over. Start the pulse sequence again.
            jg = 1;
        end
        jcount = 1;
    end
end

% Sum all contributions
B = B + Bg;

end

