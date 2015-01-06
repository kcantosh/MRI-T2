clear all;

nstep = 24;
rndseed = 2;

s = RandStream( 'mt19937ar' , 'seed' , rndseed );
if strcmp( version, '7.7.0.471 (R2008b)' ) % old version
    RandStream.setDefaultStream(s);
else % new version
    RandStream.setGlobalStream(s);
end

RND = round(rand(nstep,1))*2 - 1;

B = zeros(nstep+1,1);

B(1) = 0;
for i = 2 : nstep+1
    B(i) = B(i-1) + RND(i-1);
end
TIME = 1:size(B,1);

figure(1);
subplot(2,2,1);
area(RND);
subplot(2,2,2);
plot(B,'-o');

% explicit integration
INT = trapz(B);

% integration as a series
summ = 0;
for i = 1:nstep
    summ = summ + RND(i)*(nstep - i + 1/2);
end


% create permutation matrix R
R = 0;
for i = 1 : nstep
    RR = zeros(length(R)*2,1);
    %step = nstep - i + 1/2;
    step = i;% - 1/2;
    for j = 1:length(R)
        RR(2*j)     = R(j) + step;
        RR(2*j - 1) = R(j) - step;
    end
    R = RR;
end