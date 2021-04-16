clc
clear
% change in constant value 17
c = [ 17*(1 - 4/100) 17 17*(1 + 4/100) ];
    %       min     norm    max

% initial guess
xn=0.01;
xn = 2;
% vectors to store results in
xres = [ vpa(xn) vpa(xn) vpa(xn) ];
yres = [0 0 0];
for i = 1:3
    f = @(x) (52*x - ((x.^2 + x + 0.03)./(x+1)).^7 - c(i)*x.*exp(-x));
    df = @(x) (c(i)*x*exp(-x) - c(i)*exp(-x) + ((7*(x^2 + x + 0.03)^7)/(x+1)^8) - ((7*(2*x+1)*(x^2 + x + 0.03)^6)/(x+1)^7) + 52);
    maxvarv = 20;
    varv = 0;
    relfel = 1;
    while abs(relfel)>=1e-8 && varv < maxvarv;
        [xn, relfel] = newton7(f, df, xn);
        varv = varv+1;
    end
    xres(i) = vpa(xn);
    yres(i) = f(xn);
end
disp(varv)
display('xres = [xn_min xn_norm xn_max ]');
display([ xres ]);
display('yres = [yn_min yn_norm yn_max ]');
disp([ yres ]');

percentages = 100*[ (xres(1)/xres(2))-1 (xres(2)/xres(2))-1 (xres(3)/xres(2))-1 ];
display('percentage differences');
display('xn_min xn_norm xn_max');
display([ percentages ]);