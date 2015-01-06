function [ PSI, TAU ] = phase( B , TIME , inpt )
% calculate the phase evolution for each water nuclei

% INPUT
tau0 = inpt.tau0;

% CONSTANTS
gamma = 267.513e6; % Gyromagnetic ratio for H1 nucleus [rad s^-1 T^-1]


% evaluate the prefactor (-1)^n
TAU = tau0/2 : tau0 : TIME(end); % time at which 180 deg pulse is applied
m = length(TIME);
nh2o = size(B,1);
PSI = zeros(nh2o,m);
sign = 1;
ii = 1;
for i = 2 : m
    progrbar( i/m , 'Pase:       ' );
    a = i - 1;
    b = i;
    if ii <= length(TAU)
        if TIME(i)-10*eps > TAU(ii)
            ii = ii + 1;
            sign = sign*(-1); % 180deg pulse phase reversal
        end
    end
    for k = 1 : nh2o
        intgrl = gamma*trapz(TIME(a:b),B(k,3,a:b)); % accumulated phase
        PSI(k,i) = PSI(k,i-1) + sign*intgrl;
    end
end

end % END OF phase
%
%
function [a,b] = limits(fmin,fmax,F)
    a=0;
    b=0;
    for j = 1 : length(F)-1
        if F(j) == fmin
            a = j;
        elseif F(j) < fmin && F(j+1) >= fmin
            a = j+1;
        end
        if F(j) == fmax
            b = j;
        elseif F(j) < fmax && F(j+1) >= fmax
            b = j+1;
        end
    end
    if a == 0 || b == 0 || a >= b % error check
        sprintf('a=%e; b=%e',a,b);
        error('Wrong limits')
    end
end
