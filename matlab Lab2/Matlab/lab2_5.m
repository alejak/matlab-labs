clear all
clc

L = 3.3;
N = 4;
T0 = 310;
TL = 460;
x = 0:10^-3:L;
%k(x) = 3 + x/5;
%Q(x) = 265*exp(-((x-(L/2)))^2);

fel = 1;
it = 1;
tempNuvarande = 0;

%while abs(fel)>10^-7
    
    h = L/(N+1);
    xyttre = [0:h:L]';
    x = xyttre(2:end-1);
    
    r = @(u) -3/(h^2) - u./(5*(h^2)) + 1/(10*h);
    s = @(v) 6/(h^2) + (2*v)./(5*(h^2));
    p = @(w) -1/(10*h) -3/(h^2) - w./(5*(h^2));
    
    A = [r(xytrre(3:end)) s(x) p(xyttre(1:end-2))];
    A = spdiags(A, -1:1, N, N);
    
    Q = @(x) 265*exp(-((x-(L/2)))^2);
    
    b = Q(x);
    b(1) = Q(x(1))-r(x(1))*T0;
    b(N) = Q(x(1))-p(x(N))*TL;
    
    T = A\b;
    
    %TempNy = T(3*
    
    

