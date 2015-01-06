function [ POSH2O , TIME ] = diffuse( inpt , POSH2O0 , POSPT )
% simulate diffusion as a random walk model


BOXSZ = inpt.BOXSZ;
D = inpt.D;
dt = inpt.dt;
tend = inpt.tend;
rpt = inpt.rpt;

dr = sqrt(6*D*dt); % increment in length (factor of 6 accounts for 3D)

dim = size(POSH2O0,2);
TIME = 0 : dt : tend;
nt = length(TIME);
nh2o = size(POSH2O0,1);
POSH2O = zeros( nh2o , dim , nt );
POSH2O(:,:,1) = POSH2O0;
for i = 2 : nt % TIME LOOP
    progrbar( i/nt , 'Diffusion:  ' );
    % displace water molecules
    THETAi = 2*pi*rand( [nh2o,1] ); % scattering angle (longitude)
    PHIi = acos(1 - 2*rand( [nh2o,1] )); % scattering angle (polar)
    DRi = dr*[ sin( PHIi ).*cos( THETAi ) ...
               sin( PHIi ).*sin( THETAi ) ...
               cos( PHIi ) ];
    for j = 1 : nh2o % check for whater inside nanoparticles
        while insidept( POSH2O(j,:,i) + DRi(j,:) , POSPT , rpt , BOXSZ )
            % redefine the position of H2O molecule if inside the nanoparticle
            theta = 2*pi*rand(); % scattering angle (longitude)
            phi = acos(1 - 2*rand()); % scattering angle (polar)
            DRi(j,:) = dr*[ sin( phi ).*cos( theta ) ...
                       sin( phi ).*sin( theta ) ...
                       cos( phi ) ];
        end
    end
    POSH2O(:,:,i) = POSH2O(:,:,i-1) + DRi; % H2O molecule CAN go outside
                                           % of the box
end

end

