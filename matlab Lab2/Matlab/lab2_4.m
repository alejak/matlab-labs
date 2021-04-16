clear all
clc
format long
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
%a se papper

L = 2.7;

tspan = [0 8];
u0 = [2*pi/7 0.7];

f = @(t,u) fun(t,u,L);
[tt uu] = ode45(f, tspan, u0);
u1 = uu(:,1); %vinkel
u2 = uu(:,2); %vinkelhastighet

subplot(3,1,1)
plot(tt, u1); grid on;
xlabel('tiden');
ylabel('vinkel');

subplot(3,1,2)
plot(tt, u2); grid on;
xlabel('tiden');
ylabel('vinkelhastighet');

subplot(3,1,3)
animering(tt, u1, L) %TA INTE BORT DE H�R PLS!!!!!!!!!!

index = find(u2<0); %Detta ger oss att tecken skiftar vid element 8-9 ~(0.26) 
%samt vid element 38-39 ~(3.7)

[x01 m1 k1] = noll(8, 9, tt, u2);

[x02 m2 k2] = noll(38, 39, tt, u2);

period = abs(x01  - x02);
