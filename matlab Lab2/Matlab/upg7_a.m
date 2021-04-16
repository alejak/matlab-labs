clc
clear
% change in constant value 52 either -3% normal or +3%
c = [ 52*(1 - 3/100) 52 52*(1 + 3/100) ];
    %       min     norm    max

% initial guess
xn = 0.01;
xn = 2;
% vectors to store results in
xres = [ vpa(xn) vpa(xn) vpa(xn) ];
yres = [0 0 0];
for i = 1:3 %here we cycle through 3 versions of the constant c
    f = @(x) (c(i)*x - ((x.^2 + x + 0.03)./(x+1)).^7 - 17*x.*exp(-x));
    df = @(x) (17*x*exp(-x) - 17*exp(-x) + ((7*(x^2 + x + 0.03)^7)/(x+1)^8) - ((7*(2*x+1)*(x^2 + x + 0.03)^6)/(x+1)^7) + c(i));
    maxvarv = 20;
    varv = 0;
    relfel = 1;
    while abs(relfel)>=1e-8 && varv < maxvarv;
        [xn, relfel] = newton7(f, df, xn);
        varv = varv+1;
    end
    % for each we apply the newton raphson method until the relative error
    % is below e-8
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