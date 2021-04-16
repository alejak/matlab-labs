clear all
clc
format long
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
%a se papper

L = 2.7;

tspan = [0 8];
u0 = [2*pi/7 0.7];

f = @(t,u) fun(t,u,L);
[tt uu] = ode45(f, tspan, u0, options);
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
%animering(tt, u1, L) %TA INTE BORT DE H�R PLS!!!!!!!!!!

index = find(u2<0); 

[x01 m1 k1] = noll(13, 14, tt, u2);

[x02 m2 k2] = noll(127, 128, tt, u2);

f = @(w) spline(tt, u2, w);

fel1 = abs(f(x01));
fel2 = abs(f(x02));
feltot = fel1 + fel2; 

period = abs(x01  - x02)
