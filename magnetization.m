function [ M ] = magnetization( PSI )
% calculate total magnetization

sumcos = sum( cos(PSI) , 1 );
sumsin = sum( sin(PSI) , 1 );
k = size(PSI,1);
M = sqrt(sumcos.^2 + sumsin.^2)/k;

end