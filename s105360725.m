% Generating a single-tone sine signal xa
clear;
f0=10; % 10 Hz sine wave
dt=0.001; % resolution
Length=0.4; % Total length =0.4 sec
t=0:dt:Length;
xa=sin(2*pi*f0*t);
plot(t,xa);
xlabel('time t (sec)'); ylabel('xa(t)');
title('signal xa(t)');
%%
% Generating a discrete-time signal x
clear;
f0=10; % 10 Hz sine wave
Length=0.4 % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
stem(n,x);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
%%
% Pratice 1-1
clear;
f0=10; % 10 Hz sine wave
dt=0.001; % resolution
Length=3; % Total length =0.4 sec
t=-3:dt:Length;
xa=sin(pi*f0*t)./(pi*f0*t);
xb=xa.^2;
figure;plot(t,xa);
xlabel('time t (sec)'); ylabel('xa(t)');
title('signal xa(t)');
figure;plot(t,xb);
xlabel('time t (sec)'); ylabel('xa(t)');
title('signal xb(t)');
%%
% Generating a discrete-time signal x
clear;
f0=10; % 10 Hz sine wave
Length=0.4; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
stem(n,x);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
%%
% Pratice 1-2
% Generating a discrete-time signal x
clear;
f0=10; % 10 Hz sine wave
Length=0.31; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=-30:1:N-1;
x=sin(0.2*pi*f0*n*T)./(pi*n);
stem(n,x);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
%%
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
%%
% y[n]=x1[n] * x2[n]
clear;
x1=[6 5 4 3 2 1];
x2=[1 0 0 0 1];
y=conv(x1,x2);
n=1:length(y);
stem(n,y);
xlabel('time n'); ylabel('y[n]');
title('y[n]=x1[n] * x2[n]');
%%
% Pratice 2-1
x=[6 5 4 3 2 1];
h=[1 0 0 0 1];
m=length(x);
n=length(h);
X=[x,zeros(1,n)];
H=[h,zeros(1,m)];
for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end
    end
end
n=1:length(Y);
stem(n,Y);
xlabel('time n'); ylabel('y[n]');
title('y[n]=x1[n] * x2[n]');
%%
% Pratice 2-2
clear;
tic;
n=1:1:1000;
x1 = mod(n, 5);
x2 = mod(n, 4);
m=length(x1);
n=length(x2);
X=[x1,zeros(1,n)];
H=[x2,zeros(1,m)];
for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end
    end
end
n=1:length(Y);
toc;
stem(n,Y);
xlabel('time n'); ylabel('y[n]');
title('y[n]=x1[n] * x2[n]');

clear;
tic;
n=1:1000;
x1 = mod(n, 5);
x2 = mod(n, 4);
m = 1999;
x1 = fliplr(x1);
A = convmtx(x1,m);
M=A(1:m,1:m);
N = [zeros(1,999) x2];
ansMatrix = (M*N');
toc;
figure;stem(ansMatrix);

%%
% Computing the DTFT of signal x
clear;
x=[1 1 1 1 1 1 1 1 1 1];
n=0:length(x)-1;
K=500;
k=-K:K;
w=pi*k/K;
X=x*exp(-j*n'*w);
magX=abs(X);
angX=angle(X);
title('DTFT of x[n]');
subplot(2,1,1); plot(w/pi,magX);
xlabel('frequency \omega/\pi'); ylabel('|X(e^j^\omega)|');
subplot(2,1,2); plot(w/pi,angX);
xlabel('frequency \omega/\pi'); ylabel('arg(X(e^j^\omega))');
%%
% Pratice 3-1
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
%%
clear;
f = linspace(-0.5,0.5,200); % [-0.5pi, 0.5pi]
wc = 0.25*pi; % cutoff frequency
for M=1:5:2000
    n = (-M:M);
    for j=1:length(f)
        X(j) = sum(wc/pi*sinc(wc*n).*exp(-i*2*pi*n*abs(f(j))));
    end
    %     plot(f,abs(X));
    %     xlabel('\omega/\pi');
    %     ylabel('|X(e^j^\omega)|');
    %     title(M);
    %     pause;
end
%%
% Computing the DFT of signal x
clear;
x=[1 1 1 1 1 1 1 1 1 1];
n=0:length(x)-1;
N=5;
k=0:N-1;
X=x*exp(-j*2*pi/N*n'*k);
magX=abs(X);
angX=angle(X);
subplot(2,1,1); stem(k,magX); xlabel('frequency index k');
ylabel('|X[k]|');
title('5-pt DFT of x[n]');
subplot(2,1,2); stem(k,angX); xlabel('frequency index k');
ylabel('arg(X[k])');
%%
% Pratice 3-2
% Generating a discrete-time signal x
clear;
f0=10; % 10 Hz sine wave
Length=0.4; % Total length =0.4 sec
T=0.01; % sampling period = 0.01 sec
N=Length/T;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
figure;stem(n,x);
xlabel('time n'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
n=0:length(x)-1;
N=10;
k=0:N-1;
X=x*exp(-j*2*pi/N*n'*k);
magX=abs(X);
angX=angle(X);
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
%%
% Pratice 3-4
%%
% Pratice 3-5