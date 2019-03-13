% Pratice 1-1
clear;
f0=10; % 10 Hz sine wave
dt=0.001; % resolution
Length=3; % Total length =0.4 sec
t=-3:dt:Length;
xa=sin(pi*f0*t)./(pi*f0*t);
xa(t==0) = 1;
xb=xa.^2;
figure;plot(t,xa);
xlabel('time t (sec)'); ylabel('xa(t)');
title('signal xa(t)');
figure;plot(t,xb);
xlabel('time t (sec)'); ylabel('xa(t)');
title('signal xb(t)');
