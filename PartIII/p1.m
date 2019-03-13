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

