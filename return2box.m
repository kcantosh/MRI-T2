function [ R ] = return2box( R , BOXSZ )
% bring coordinate into the simulation box

nr = size(R,1);
dim = size(R,2);

for i = 1 : nr
    for j = 1 : dim
        ratio = R(i,j)/BOXSZ(j);
        R(i,j) = (ratio - floor(ratio))*BOXSZ(j);
    end
end