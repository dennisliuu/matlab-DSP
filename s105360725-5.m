% Backward difference system y[n] = x[n] - x[n-1]
clear;
a=[1];
b=[1 -1];
x=[2 3 4 5];
y=filter(b,a,x) % y = [2 1 1 1]
h=[1 -1];
x=[2 3 4 5];
w=conv(h,x) % w = [2 1 1 1 -5]
h1=[1 -1 0 0 0];
x1=[2 3 4 5 0];
H=fft(h1)
X=fft(x1)
Z=H.*X
W=fft(w) % Z = W
%%
% Backward difference system y[n] = 0.8y[n-1] + x[n] - x[n-1]
% y = 2 2*0.8+1 2.6*0.8+1 3.08*0.8+1 = 2 2.6 3.08 3.464
clear;
a=[1 -0.8];
b=[1 -1];
x=[2 3 4 5];
y2=filter(b,a,x);

h=[1 -1];
x=[2 3 4 5];
w=conv(h,x); % w = [2 1 1 1 -5]

N = length(x);
M = length(h);
Ny = N + M -1;
y3 = zeros(1,Ny+1);
for i = 1:N
      for k = 1:M
           y3(i+k) = h(k)*x(i) + 0.8*y3(i+k-1);
      end
end
for i = 2:Ny
    y4(i-1) = y3(i)-y3(i-1);
end
%%
% pole-zero plot of H(z)
% num = input('Type in the numerator coefficients (e.g., [1 -5 6]) = ');
num = [1 -5 6];
% den = input('Type in the denominator coefficients (e.g., [1 -4.5 2])= ');
den = [1 -4.5 2]
roots(num)
roots(den)
zplane(num,den)
%%
% a 10-Hz sine wave is input to an allpass system
num = [-0.5 1];
den = [1 -0.5];
freqz(num,den,200,100);
pause;
zplane(num,den);
pause;
f0=10; % 10 Hz sine wave
T=0.01; % sampling freq. = 100 Hz
N=100;
n=0:1:N-1;
x=sin(2*pi*f0*n*T);
subplot(4,1,1); stem(n,x);
xlabel('time index'); ylabel('x[n]');
f=n/T/N;
subplot(4,1,2); stem(f,abs(fft(x)));
xlabel('frequency in Hz'); ylabel('|X(f)|');

y=filter(num,den,x);
subplot(4,1,3); stem(n,y);
xlabel('time index'); ylabel('y[n]');
subplot(4,1,4); stem(f,abs(fft(y)));
xlabel('frequency in Hz'); ylabel('|Y(f)|');
roots(den)
zplane(num,den)
%% 4-2
clear;
num = [1 -6.9 13.4 -7.2];
n1 = roots(num);
den = [1 -1.3 0.47 -0.035];
d1 = roots(den);
num1 = [1 -1.65 0.8 -(0.25*0.5*0.9)].*8;
freqz(num, den, 200, 100);
pause;
zplane(num, den);
pause;
f0 = 10;
f3 = 30;
T = 0.01;
N = 100;
n = 0:1:N-1;
x = sin(2*pi*f0*n*T)+sin(2*pi*f3*n*T);
subplot(4, 1, 1); stem(n, x);
xlabel('time index'); ylabel('x[n]');
f = n/T/N;
subplot(4, 1, 2); stem(f, abs(fft(x)));
xlabel('frequemcy in Hz'); ylabel('|X(f)|');
y1 = filter(num, den, x);
y = filter(num, den, y1);
subplot(4, 1, 3); stem(n, y);
xlabel('time index'); ylabel('x[n]');
subplot(4, 1, 4); stem(f, abs(fft(y)));
xlabel('time index'); ylabel('x[n]');
%%
% Record and play back 5 seconds of 16-bit audio sampled at 16000 kHz.
clear;
Fs=16000;
x = wavrecord(5*Fs, Fs);
wavplay(x,Fs); % playback
wavwrite(x,Fs,'16kHz.wav');
%%
% Read, plot, and play a wav file.
fp=fopen('16kHz.wav','r');
fseek(fp,44,-1)
x=fread(fp,'short');
Fs=16000;
n=0:length(x)-1;
t=n/Fs;
plot(t,x);
xlabel('time in second')
title('audio sampled at 16kHz');
sound(x./32766,Fs,16)
specgram(x,512,Fs,320);