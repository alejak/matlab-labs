% Mätdata:
h = [6.3 7.9 10.3 13.2 15.6 17.9 18.3 16.5 14.1 11.4 8.7 6.5];
m = [1 32 60 91 121 152 182 213 244 274 305 335];

% Interpolation av polynom med grad 4
% y = c1 + c2x + c3x^2 +  + c5x^3
% A = [ones(size(m)); m; m.^2; m.^3; m.^4]';
% c = A \ h;


c = polyfit(m, h, 4); 
c1 = c(1);
c2 = c(2);
c3 = c(3);
c4 = c(4);
c5 = c(5);

y = @(x) c5 + c4.*x + c3.*x.^2 + c2.*x.^3 + c1.*x.^4;
t = 0:365;
plot(m,h, 'X')
hold on
title ('Interpolation av grad 4')
plot (t, y(t))
hold on 
