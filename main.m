% Calculate T2 relaxation time for nanoparticles distributed randomly in
% space
%
% O. Rubel (June 2013)
% =========================================================================
%
% 22 Oct 2013: Added constant (time-independent) gradient
% 23 Oct 2013: Introduced dynamic gradient of the magn. field
% 22 Nov 2013: Add cluster distribution of NPs

function main( useinptfile , fnameout )

% INPUT:
%   useinptfile (true/false) - option for using either external input
%   parameters or those specified internaly
%
%   fnameout (text) - file name for writing results

% Format
%clear all; % no need for that inside a function
format short e;
pbcdepth = 1;


% Check input variables
if nargin ~= 2
    error( 'Two input arguments are required: useinptfile (true/false) and fnameout(output file name); you provided %i argument(s)', nargin );
elseif not( islogical(useinptfile) )
    fprintf( 1 , 'useinptfile type is %s\n' , class(useinptfile) );
    if ischar(useinptfile)
        fprintf( 1 , 'try to convert to logical\n' );
        useinptfile = logical( str2num(useinptfile) );
          % convert char -> num -> logical
    elseif not( islogical(useinptfile) ) % still not logical
        error( '1st input argument useinptfile is %s should be true/false' , ...
            useinptfile );
    end
elseif not( ischar(fnameout) );
    fprintf( 1 , 'fnameout type is %s\n' , class(fnameout) );
    error( '2nd input argument fnameout should be a file name' );
end


% Initial parameters
if useinptfile
    fprintf( 1 , 'Will use the initial parameters from a file\n' );
    inpt = readinptdt();
else
    fprintf( 1 , 'Will use built-in initial parameters\n' );
    inpt = assigninptdt();
end
prtinpt( inpt ); % print inpur parameters


% Check initial parameters
checkinpt( inpt );


% INITIALIZE
s = RandStream( 'mt19937ar' , 'seed' , inpt.seed );
if strcmp( version, '7.7.0.471 (R2008b)' ) % old version
    RandStream.setDefaultStream(s);
else % new version
    RandStream.setGlobalStream(s);
end

% Generate particles
POSPT = distribpt( inpt );
%figure(1);
%scatter3(POSPT(:,1),POSPT(:,2),POSPT(:,3),rpt); % plot them

% Distribute water molecules
POSH2O0 = distribh2o( inpt , POSPT );

% Diffusion
[POSH2O , TIME] = diffuse( inpt , POSH2O0 , POSPT );

% Determin magnetic field acting on the proton due to nanoparticles
B = mfield( inpt , POSPT , POSH2O , TIME , pbcdepth );

% Phase alternation due to variation of the magn. field
[PSI, TAU] = phase( B , TIME , inpt );

% Magnetization M(t)
MTOT = magnetization( PSI );

% Output data to a files
wrtoutfile( [TIME', MTOT'] , fnameout );

fprintf( 1 , 'Calculations compleated succesfully\n' );

end