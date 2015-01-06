function [ dist ] = shortstpdc( R1 , R2 , BOXSZ )
% evaluate shortest distance between 2 points with periodical boundary conditions

R1 = return2box( R1 , BOXSZ ); % Reduce R1 back to the main simulation box
R2 = return2box( R2 , BOXSZ ); % Reduce R2 back to the main simulation box
D = R1-R2;
dist = sqrt( dot(D,D) );
for j1 = -1 : 1
    for j2 = -1 : 1
        for j3 = -1 : 1
            PBC = BOXSZ.*[j1 j2 j3];
            R2PBC = R2 + PBC;
            D = R1-R2PBC;
            distpbc = sqrt( sum(D.*D) );
            dist = min( dist , distpbc );
        end
    end
end

end

