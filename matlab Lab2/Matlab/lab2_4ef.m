clear all
clc
format long
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);

L = 2.8;

tspan = [0 8];
u0 = [2*pi/7 0.7];
f = @(t,u) fun(t,u,L);
[tt1 uu1] = ode45(f, tspan, u0);
u1 = uu1(:,1); %vinkel
u2 = uu1(:,2); %vinkelhastighet

index = find(u2<0); %ger oss 8-9 samt 38-39

[x01 m1 k1] = noll(8, 9, tt1, u2);

[x02 m2 k2] = noll(38, 39, tt1, u2);

period1 = abs(x01  - x02);


u01 = [2*pi/7 0.5];
f = @(t,u) fun(t,u,L);
[tt2 uu22] = ode45(f, tspan, u01);
u11 = uu22(:,1); %vinkel
u22 = uu22(:,2); %vinkelhastighet

index1 = find(u22<0); %ger oss 8-9 samt 39-40

[x011 m11 k11] = noll(8, 9, tt2, u2);

[x022 m22 k22] = noll(39, 40, tt2, u2);

period2 = abs(x011  - x022);