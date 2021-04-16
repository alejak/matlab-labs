clear;
clc;
clf;

% data
days = [1 32 60 91 121 152 182 213 244 274 305 335]';
h = [6.2 8.1 10.6 12.9 15.5 18.1 18.5 16.3 14.0 11.5 8.6 6.6]';

% quadratic interpolation
A = [days.^0 days.^1 days.^2]; 
% days.^3;
% Linj�r algebra o som i slidesen kr�ver tre givna punkter - andragrads. transponat efter matrisdiv. till skillnad fr f�rra ;
c = A\h;
c = flip(c); %Samma h�ll som x

% splineinterpolation
% spline �r mer korrekt om data �r v�rden av en s.k. smooth function
daysyear = 1:365;
yy = spline(days,h,daysyear);

% hermiteinterpolation
% pchip has no overshoots och mindre sv�ngningar om data inte �r smooth
% pchip is less expensive to set up
he = pchip(days,h,daysyear);

% % plot
% plot 1 ba punkterna beh�vs ty plotten fixar en linj�r interpolation
subplot(2,2,1), plot(days, h, 'r  o', days, h,'b--');
description = legend('data points','linear interpolation');
grid on
xlabel('days');
ylabel('hours of sun');
set(description, 'fontsize', 14);

% plot 2
x = 1:365;
y = polyval(c,x); %utforskar polynomet c f�r varje x, vi har 3 c v�rden o s�tter in x, polyval ger oss resultatet
subplot(2,2,2), plot(days, h, 'r  o', x, y,'b--');
description = legend('data points','2 degree polynomial');
grid on
xlabel('days');
ylabel('hours of sun');
set(description, 'fontsize', 14);

% plot 3
subplot(2,2,3), plot(days, h, 'r  o',daysyear,yy,'b--');
description = legend('data points','spline-interpolation');
grid on
xlabel('days');
ylabel('hours of sun');
set(description, 'fontsize', 14);

% plot 4
subplot(2,2,4), plot(days, h, 'r  o',daysyear,he,'b--');
description = legend('data points','cubic-hermite-interpolation');
grid on
xlabel('days');
ylabel('hours of sun');
set(description, 'fontsize', 14);