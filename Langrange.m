clc 
clear
close all

f = @(x)(sin(x).^2 + sin(x) +1);
n = input("n=");
a = input("Xmin=");
b = input("Xmax=");

x = linspace(a, b, n);
y = f(x);

L = zeros(n, n);
for k = 0:(n-1)
    nodes = x;
    nodes(k+1) = [];
    num = poly(nodes);
    den = prod(x(k+1)-nodes);
    L(k+1, : ) = num/den;
    disp('_')
end
L = y'.*L;
P=sum(L);

figure
plot(x, y, 'o');
%ustawienie min i max wartosvi na osi ox i oy
axis([a-0.3*(b-a) b+0.3*(b-a) min(y) max(y)])
%proporcja okna jest stała
axis equal
%dorzucanie większej ilości wykresów do osi
hold on;
%100 punktów z przedziału
xin = linspace(min(x), max(x), 100);
%100 wartości z xin, P - wektor wspol̥czynnikōw wielomiana
yin = polyval(P, xin);
plot(xin, yin);

%%
err_mean_L =[1.4 1.3 4 2.9]
err_max_L =[1.6 1.9 4 4.9]

err_mean_N =[1.1 1.0 4.5 2.29]
err_max_N =[1.4 1.6 4.6 3.9]
figure
bar([err_mean_L; err_mean_N]')
hold on
plot((1:4)-0.15, err_max_L, 'ok');
hold on
plot((1:4)+0.15, err_max_N, 'ok');



