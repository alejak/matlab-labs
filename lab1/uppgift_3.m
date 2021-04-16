clear;
clc;
clf;
format long

% function
f = @(x) (exp(-x/2))./(3-cos(pi.*x));
g = @(x) pi.*(((exp(-x/2))./(3-cos(pi.*x))).^2);

% plot
x = [0:0.001:3.5];
plot(x, f(x));
grid on;

% trapezoid
% start
a = 0;
% ending
b = 3.5;
% length of steps
h = 0.0001;
% h = 0.01;
% number of steps
n = (b-a)/h;

% T0
t_0 = (g(a)+g(b))/2;

for i=1:5
    x = a+[1:n-1]*h;
    t(i)=h*(t_0+sum(g(x)));
    n = 2*n;
    h = h/2;
end
disp('trapezoid is: ');
disp(t');

% trapezoid error
d = diff(t);
kvot = [d(1)/d(2) d(2)/d(3) d(3)/d(4)];
disp('quote trapets is: ');
disp(kvot');
trapezoid_error = abs(d(end)/3);
disp('trapezoid error is: ');
disp(trapezoid_error);

% richardson-extrapolation
r = t(2:end)-abs(d)/3; %choosing the last one
disp('richardson extrapolation is: ');
disp(r');

d_r = diff(r);
richardson_error = abs(d_r(end)/3);
disp('richardson error is: ');
disp(richardson_error);

% volume
volume = r(end);
disp(['the volume is: ' num2str(volume) ' +- ' num2str(richardson_error)]);
disp(' ');


% interval
x = 0:0.001:3.5;

h = f(x);

% rowvector
fi = [0:(2*pi)/30:2*pi]';

qG = quad(g, 0, 3.5);
disp('quad is: ');
disp(qG);
disp('Etrunk for quad is:');
disp(1e-6);

% plot
X = x.*ones(size(fi));
Y = h.*cos(fi);
Z = h.*sin(fi);
mesh(X,Y,Z);