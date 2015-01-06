function checkinpt( inpt )
% CHECKINPT Performs a check of input parameters for consestency

if size(inpt.GPS,1) ~= length(inpt.TGPS)
    warning('CHECKINPT: inconsistency found');
    fprintf( 1 , 'Number of gradient pulse sequences: %i\n' , ...
        size(inpt.GPS,1) );
    fprintf( 1 , 'Number of timings for the pulse sequence: %i\n' , ...
        length(inpt.TGPS) );
    error( 'Each pulse should have a corresponding time length' );
end

if sum(inpt.TGPS) > 1 + eps || sum(inpt.TGPS) < 1 - eps
    warning('CHECKINPT: inconsistency found');
    fprintf( 1 , 'Total timing for the pulse sequence is: %e\n' , ...
        sum(inpt.TGPS) );
    error( 'Timing should total 1' );
end