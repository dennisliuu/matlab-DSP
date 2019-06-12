clear all;close all;
fp=fopen('16kHZ.wav','r');
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
%%
clear all;close all;
fp=fopen('16kHZ.wav','r');
fseek(fp,44,-1)
x=fread(fp,'short');
Fs=16000;
subplot(3,1,1); plot(x);
xlabel('time in samples')
title('audio sampled at 16kHz');
sound(x./32766,Fs,16)
pause;
prompt='press any key'
% downsampling
y=decimate(x,2);
subplot(3,1,2); plot(y);
xlabel('time in samples')
title('audio downsampled from 16kHz to 8kHz');
sound(y./32766,Fs/2,16)
pause;
prompt='press any key'
% upsampling
z=interp(x,2);
subplot(3,1,3); plot(z);
xlabel('time in samples')
title('audio upsampled from 16kHz to 32kHz');
sound(z./32766,Fs*2,16)
pause;
prompt='press any key'
subplot(3,1,1); specgram(x,512,Fs,320);
title('audio sampled at 16kHz');
subplot(3,1,2); specgram(y,512,Fs/2,320);
title('downsampling to 8kHz');
subplot(3,1,3); specgram(z,512,Fs*2,320);
title('upsampling to 32kHz');
%% 
clear all;close all;
fp=fopen('16kHZ.wav','r');
fseek(fp,44,-1)
x=fread(fp,'short');
Fs=16000;
subplot(3,1,1); plot(x);
xlabel('time in samples')
title('audio sampled at 16kHz');
sound(x./32766,Fs,16)
pause;
prompt='press any key'

% downsampling - 2
z = fftshift(fft(x))/numel(x);
% half of total number of reduced samples
n = numel(z)*(2-1)/2/2; 
% drop n number of samples from beginning and end of spectrum 
z(1:n) = [];
z(end-n+1:end) = [];
% Compute inverse FFT by forcing conjugate symmetric
yp = ifft(ifftshift(z)*numel(z),'symmetric');

subplot(3,1,2); plot(yp);
xlabel('time in samples')
title('audio downsampled from 16kHz to 8kHz');

% up - 2
fp=fopen('16kHZ.wav','r');
fseek(fp,44,-1)
x=fread(fp,'short');
% determine the signal size
sz = size(x);
% represent x as column-vector
x = x(:);
% length of the signal
xlen = length(x);
% number of unique fft points
NUP = ceil((xlen+1)/2);
% FFT
X = fft(x(:));
% calculate the number of the padding zeros
zerolen = round(xlen*(2 - 1));
% form a new spectrum
Xhat = [X(1:NUP); zeros(zerolen, 1); X(NUP+1:end)];
% check for Nyquist point and make correction
if ~rem(xlen, 2)
    Xhat(NUP) = Xhat(NUP)/2;
    Xhat(NUP+zerolen) = Xhat(NUP);
end
% IFFT
xhat = real(ifft(Xhat));
% correction of the amplitude
xhat = xhat*2;
% represent the interpolated signal in the form of the original one
if sz(2) > 1
    xhat = xhat';
end
subplot(3,1,3); plot(xhat);
xlabel('time in samples')
title('audio upsampled from 16kHz to 32kHz');

% Spectrograms¡C
pause;
prompt='press any key'
subplot(3,1,1); specgram(x,512,Fs,320);
title('audio sampled at 16kHz');
subplot(3,1,2); specgram(yp,512,Fs/2,320);
title('downsampling to 8kHz');
subplot(3,1,3); specgram(xhat,512,Fs*2,320);
title('upsampling to 32kHz');
%% 5 - 2
clear all;close all;
A=[];

amp=1;
fs=8000; % sampling frequency
duration=1;
values=0:1/fs:duration;

freq=261.6;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=261.6;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=392;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=392;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=440;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=440;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=392;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=392;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=392;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=349;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=349;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=329;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=329;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=293;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=293;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=329;
a=amp*sin(2*pi*freq*values);
A=[A,a];

freq=261.6;
a=amp*sin(2*pi*freq*values);
A=[A,a];

sound(A,fs)

