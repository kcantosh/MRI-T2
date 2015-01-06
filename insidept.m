function [ inside ] = insidept( R , POSPT , rpt , BOXSZ )
% check if the point R is inside of any of the particles

npt = size(POSPT,1);
inside = false;
for i = 1 : npt
    d = shortstpdc( R , POSPT(i,:) , BOXSZ );
    if d < rpt
        inside = true;
        return;
    end
end