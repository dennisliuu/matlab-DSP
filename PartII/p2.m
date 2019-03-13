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
