clear;
clc;
clf;
format long;

%startvalue
x0 = 5; 
tolerance = 10e-6; 

x1 = newtonRaphson(x0);

while abs((x1-x0)/x0) > tolerance
    x0 = x1;
    x1 = newtonRaphson(x0);
    disp('The x value is: ');
    disp(x1);
    disp('The y value is: ');
    disp(polynom(x1));
    disp('the error is: ');
    e = abs((x1-x0)/x1);
    disp(e);
end

% intervalls
x1 = -0.001:0.001:2;
x2 = -0.001:0.000001:0.001;

% plot
subplot(2,1,1), plot(x1, polynom(x1),'b',1.896287813411384, polynom(1.896287813411384), 'ro');
grid on;
title('Root 1.896287813411384');
xlabel('x-axis');
ylabel('y-axis');
subplot(2,1,2), plot(x2, polynom(x2),'b',7.541379310359536e-15, polynom(7.541379310359536e-15), 'ro');
grid on;
title('Root 7.541379310359536e-15');
xlabel('x-axis');
ylabel('y-axis');

% a
% rot nr 1: 7.541379310359536e-15
% rot nr 2: 1.896287813411384
% rot nr 3: -18.713789056593374

% b
% if e is the error then the iteration is quadritically convergent if
% M =  lim (i -> infinity) (ei+1)/(ei^2) <  infinity
% page 53

% c
% check the while loop

% d
% yes, one negative root because the e^x dominates for x-> -infinity