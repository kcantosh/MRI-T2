function wrtoutfile( ARRAY , fnameout )
% prints 'array' to a file 'fnameout'

fnameout = strtrim( fnameout ); % Remove white space if any
% fileID = fopen( fnameout , 'w' );
% if fileID == -1
%     fprintf( 1 , 'File = %s\n' , fnameout );
%     error( 'Cannot open the file' );
% else
%     fprintf( 1 , 'File %s is opened for writing output\n' , fnameout )
% end
% fprintf( fileID,'%e %e\n' , ARRAY );
% fclose( fileID );
% fprintf( 1 , 'File %s is closed\n' , fnameout )
fprintf( 1 , 'Writing results to the file %s ...' , fnameout )
dlmwrite( fnameout , ARRAY , 'delimiter', '\t', 'precision' , '%e' );
fprintf( 1 , ' done.\n' )

end