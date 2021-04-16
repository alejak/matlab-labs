clear;
clc;
clf;

% constants
T = 365;
k = (2*pi)/T;
days = [1 32 60 91 121 152 182 213 244 274 305 335]';
sun_up = [6.3 7.9 10.3 15.6 17.9 18.3 16.5 14.1 11.4 13.2 8.7 6.5]';

% interpolation
a = [days.^0 cos(k*days) sin(k*days)];

% coefficiants
c = a\sun_up;
c1 = c(1);
c2 = c(2);
c3 = c(3);

% calculations
% how long does the sun shine on 6th of juli?
juli_6th = function_1(k,c1,c2,c3,187);
disp(['On the 6th of juli the sun shines: ' num2str(juli_6th) ' hours']);
disp(' ');
% how long does the sun shine on 24th of december?
december_24th = function_1(k,c1,c2,c3,358);
disp(['On the 24th of december the sun shines: ' num2str(december_24th) ' hours']);
disp(' ');

% the residual-curve
residualvector = sun_up - a*c;

% the norm of the residualvector
n = norm(residualvector);
disp(['The norm of the residualvector is: ' num2str(n) ]);

% plot
x = 1:0.05:365;
subplot(2,2,1), plot(days,sun_up,'r  o',x,function_1(k,c1,c2,c3,x),'b--');
% 'linewidth',2);
xlabel('days');
ylabel('hours of sun');
grid on;
lg_1 = legend('data points','F(t)=c1+c2*cos(kt)+c3*sin(kt), where k=2pi/T.');
set(lg_1, 'fontsize', 14);

subplot(2,2,2), plot(days,sun_up,'r  o',days, residualvector, 'k--x');
xlabel('days');
ylabel('hours of sun');
grid on;
lg_2 = legend('data points','the residualvector');
set(lg_2, 'fontsize', 14);

% d
% if you would suggest a better modell, which one would you choose?
he = pchip(days,sun_up,x);
subplot(2,2,3), plot(days,sun_up,'r  o',x,he,'b--');
xlabel('days');
ylabel('hours of sun');
grid on;
lg_2 = legend('data points','hermite');
set(lg_2, 'fontsize', 14);