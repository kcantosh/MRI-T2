function  progrbar( f , fname )
% produces progress bar

persistent flogicold
persistent prvcallprogr
persistent fdiap

if isempty(prvcallprogr) % variable is not assigned
    fprintf( 1 , '%s [' , fname );
    prvcallprogr = true;
    fdiap = 0 : 0.1 : 1;
    flogicold = f >= fdiap;
elseif prvcallprogr == false % start a new progress bar
    fprintf( 1 , '%s [' , fname );
    prvcallprogr = true;
    flogicold = f >= fdiap;
elseif prvcallprogr == true
    flogic = f >= fdiap;
    if any( flogicold ~= flogic ) % any change in progress?
        fprintf( 1 , '=' ); % add to the progress bar
        flogicold = flogic; % update the logic array
        if flogic(end) % last done
            fprintf( 1 , ']\n' ); % new line
            prvcallprogr = false; % reset
        end
    end
end


end

