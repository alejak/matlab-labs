clc;
clear;
clf;
format long;

% plotting integralEtt
x = 0:1e-10:1e-7; 
% x = -10:10e-1:10;
y = function_00(x);
subplot(2,2,1), plot(x,y);
grid on
lg = legend('yA+yB = 1/(2x^2)-1/(2xexp(x^2)');
set(lg, 'fontsize', 14);

x = 0:0.1:10;
y = function_00(x);
subplot(2,2,2), plot(x,y);
grid on
lg = legend('yA+yB = 1/(2x^2)-1/(2xexp(x^2)');
set(lg, 'fontsize', 14);

x = 0:0.1:10;
y = function_02(x);
subplot(2,2,3), plot(x,y);
grid on
lg = legend('yA = 1/(2x^2)');
set(lg, 'fontsize', 14);

x = 0:0.1:10;
y = function_03(x);
subplot(2,2,4), plot(x,y);
grid on
lg = legend('yB = -1/(2xexp(x^2)');
set(lg, 'fontsize', 14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% trapezoid
% function
f = inline('exp(-x.^2)');

% start
a = 0;

% ending
b = 5;

% length of steps
h = 0.1;

% number of steps
n = (b-a)/h;

% T0
t_0 = (f(a)+f(b))/2;

for i=1:3
    x = a+[1:n-1]*h;
    t(i)=h*(t_0+sum(f(x)));
    n = 2*n;
    h = h/2;
end
disp(['trapezoid is: ' num2str(t)]);
disp(t);
disp(' ');

% svanskapning error
x = 5;
error_svans = error_01(x);
disp('error svans is: ');
disp(error_svans);

% practical error
delta = diff(t);
kvot = delta(1)/delta(2);
t_tak = t(2:3)+delta/3;
error_tak = diff(t_tak);
disp('error tak is: ');
disp(error_tak);

% total_error
tot_error = error_svans + error_tak;
disp('the total error is: ');
disp(tot_error);

% det beror p? cancelationsfelet
% avrundingen g?r n?got fel