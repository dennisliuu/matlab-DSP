% Butterworth lowpass filter
[b,a] = butter(9,0.4,'low'); % cut-off freq. = 0.4 pi = 20 Hz
freqz(b,a,200,100);
pause;
% signal x
f1=10; % 10 Hz sine wave
f2=30; % 30 Hz sine wave
T=0.01; % sampling freq. = 100 Hz
N=10;
n=0:1:N-1;
x=sin(2*pi*f1*n*T)+sin(2*pi*f2*n*T);
subplot(2,2,1); stem(n,x);
xlabel('time index'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.01 sec');
% DFT of x
f=n/T/N;
subplot(2,2,2); stem(f,abs(fft(x)));
xlabel('frequency in Hz'); ylabel('|X(f)|');
% lowpass filtering
y=filter(b,a,x);
subplot(2,2,3); stem(n,y);
xlabel('time index'); ylabel('y[n]');
title('lowpass filtered at fc=20Hz');
% DFT of y
f=n/T/N;
subplot(2,2,4); stem(f,abs(fft(y)));
xlabel('frequency in Hz'); ylabel('|Y(f)|');
%%
% Chebyshev lowpass filter
[b,a] = cheby1(9,0.05,0.4); % cut-off freq. = 0.8 pi = 400 Hz
% signal x
f1=10; % 10 Hz sine wave
f2=300; % 300 Hz sine wave
T=0.001; % sampling freq. = 1000 Hz
N=100;
n=0:1:N-1;
x=sin(2*pi*f1*n*T)+sin(2*pi*f2*n*T);
subplot(2,2,1); stem(n,x);
xlabel('time index'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.001 sec');
% DFT of x
f=n/T/N;
subplot(2,2,2); stem(f,abs(fft(x)));
xlabel('frequency in Hz'); ylabel('|X(f)|');
% lowpass filtering & Decimation & DFT
y=filter(b,a,x);
z=downsample(y,2);
n2=0:1:N/2-1;
f=n2/(2*T)/(N/2);
subplot(2,2,3); stem(f,z);
xlabel('time index'); ylabel('x1[n]');
title('downsampled signal x1[n]');
subplot(2,2,4); stem(f,abs(fft(z)));
xlabel('frequency in Hz'); ylabel('|X1(f)|');
%%
% downsampling & DFT
z=decimate(x,2);
n2=0:1:N/2-1;
f=n2/(2*T)/(N/2);
subplot(2,2,3); stem(f,z);
xlabel('time index'); ylabel('x1[n]');
title('downsampled signal x1[n]');
subplot(2,2,4); stem(f,abs(fft(z)));
xlabel('frequency in Hz'); ylabel('|X1(f)|');
%%
% 6-1
% Chebyshev lowpass filter
[b,a] = cheby1(8,0.88,0.8); % cut-off freq. = 0.8 pi = 400 Hz
% signal x
f1=10; % 10 Hz sine wave
f2=300; % 300 Hz sine wave
T=0.001; % sampling freq. = 1000 Hz
N=100;
n=0:1:N-1;
x=sin(2*pi*f1*n*T)+sin(2*pi*f2*n*T);
subplot(2,2,1); stem(n,x);
xlabel('time index'); ylabel('x[n]');
title('discrete signal x[n]=xa(nT), where T = 0.001 sec');
% DFT of x
f=n/T/N;
subplot(2,2,2); stem(f,abs(fft(x)));
xlabel('frequency in Hz'); ylabel('|X(f)|');
% lowpass filtering & Decimation & DFT
y=filter(b,a,x);
z=upsample(y,2);
n2=0:1:N/2-1;
f=n2/(2*T)/(N/2);
subplot(2,2,3); stem(z);
xlabel('time index'); ylabel('x1[n]');
title('downsampled signal x1[n]');
subplot(2,2,4); stem(abs(fft(z)));
xlabel('frequency in Hz'); ylabel('|X1(f)|');