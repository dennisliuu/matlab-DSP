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

