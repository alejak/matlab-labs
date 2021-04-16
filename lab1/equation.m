function shooting_method
clc;
clear all;
clf;
guess_derivative = 150;
real_derivative = fzero(@solver, guess_derivative);

% find the wanted x
options = odeset('RelTol', 1e-15, 'AbsTol', [1e-16, 1e-16]);
[t,u]=ode45(@equation, [0:0.0001:3.5],[300 real_derivative], options);
plot(t,u(:,1),'g');

[I,K] = find(t==1.5); %gives index for wanted x
u(I)
end

function du = equation(t,u)
du = zeros(2,1);
du(1) = u(2);
du(2) = -((250*exp(-(t-3.5/2).^2) + u(2)/6)/(2+t/6));
end

function f = solver(x)
options = odeset('RelTol', 1e-15, 'AbsTol', [1e-16, 1e-16]);
[t,u]=ode45(@equation, [0 3.5],[300 x], options);
s = length(t);

f = u(s, 1)-420;

plot(t, u(:,1), 'r');
hold on
end