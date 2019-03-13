% Pratice 1-3
clear;
f0=10; % 10 Hz sine wave
f1=30;
Length=0.4; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
x1=sin(2*pi*f1*n*T);
figure;stem(n,x);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
figure;stem(n,x1);
xlabel('time n'); ylabel('x1[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
