%%
clear;
x=[1 1 1 1 1 1 1 1 1 1];
n=0:length(x)-1;
K=500;
k=-K:K;
w=pi*k/K;

X_R = x*cos(n'*w);
X_I = - x*sin(n'*w);

Amp = sqrt(X_R.^2 + X_I.^2);
phase = atan2(X_I, X_R);

title('DTFT of x[n]');
subplot(2,1,1); plot(w/pi,Amp);
xlabel('frequency \omega/\pi'); ylabel('|X(e^j^\omega)|');
subplot(2,1,2); plot(w/pi,phase);
xlabel('frequency \omega/\pi'); ylabel('arg(X(e^j^\omega))');
%% Pratice 3-2
% Generating a discrete-time signal x
clear;
f0=10; % 10 Hz sine wave
Length=0.4; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
% figure;stem(n,x);
% xlabel('time n'); ylabel('x[n]');
% title('discrete signal x[n]=xa(nT), where T = 0.01 sec');

% n=0:length(x)-1;
% N=10;
k=0:N-1;
X=x*exp(-j*2*pi/N*n'*k);
magX=abs(X);
angX=angle(X);
figure;
subplot(2,1,1); stem(k,magX); xlabel('frequency index k');
ylabel('|X[k]|');
title('5-pt DFT of x[n]');
subplot(2,1,2); stem(k,angX); xlabel('frequency index k');
ylabel('arg(X[k])');
N=100;
k=0:N-1;
X=x*exp(-j*2*pi/N*n'*k);
magX=abs(X);
angX=angle(X);
figure;
subplot(2,1,1); stem(k,magX); xlabel('frequency index k');
ylabel('|X[k]|');
title('5-pt DFT of x[n]');
subplot(2,1,2); stem(k,angX); xlabel('frequency index k');
ylabel('arg(X[k])');
%%
% Pratice 3-3
clear;
f0=10; % 10 Hz sine wave
Length=0.4; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
% figure;stem(n,x);
Y = fft(x,10);
figure;stem(Y);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
Y = fft(x,100);
figure;stem(Y);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
%%
% Pratice 3-4
clear;

f0=10; % 10 Hz sine wave
f1=30;
Length=0.4; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(pi*f0*n*T);
x1=sin(pi*f1*n*T);
x2=x+x1;
figure;stem(n,x2);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
Y = fft(x2,10);
figure;stem(Y);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
%%
% Pratice 3-5
clear;
f0=10; % 10 Hz sine wave
f1=30;
Length=0.4; % Total length =0.4 sec
T=0.02; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(pi*f0*n*T);
x1=sin(pi*f1*n*T);
x2=x+x1;
figure;stem(n,x2);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
Y = fft(x2,10);
figure;stem(Y);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');