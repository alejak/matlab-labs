clear all
close all
clc

L = 3.3;
N = 14;
T0 = 310;
TL = 460;

fel = 1;
a = 4;
tempNuvarande = 0;
iteration = 1;

while abs(fel)>1e-7 
    
    h = L/(N+1);
    xyttre = [0:h:L]';
    x = (xyttre(2:end-1));
    
    k =@(x) 3+x./5;
    f1 =@(w) (k(w)/(h^2))+ 1/(10*h);
    f2 =@(r) (-2*k(r))./(h^2);
    f3 =@(u) (k(u)/(h^2))-1/(10*h);
    
    A = [f3(xyttre(3:end)) f2(x) f1(xyttre(1:end-2))];

    
    %r = @(u) -3/(h^2) - u./(5*(h^2)) + 1/(10*h);
    %s = @(v) 6/(h^2) + (2*v)./(5*(h^2));
    %p = @(w) -1/(10*h) -3/(h^2) - w./(5*(h^2));
    
    A = spdiags(A, -1:1, N, N);
    
    Q = @(x) 265*exp(-((x-(L/2))).^2);
    
    b = -Q(x);
    b(1) = -Q(x(1))-f3(x(1))*T0;
    b(N) = -Q(x(1))-f1(x(N))*TL;
    
    T = A\b;
 
    
    tempNy = T(4*(2^iteration));
    index = 4*(2^iteration);
    
    xt = x(4*(2^iteration));
    
    fel = tempNy - tempNuvarande; 
    tempNuvarande = tempNy;
    N = N*2+1;
    iteration = iteration+1;
end

y = [T0;T;TL];

plot(xyttre, y); grid on;


% c
% Vi delar in 3.3 i 10 lika stora delar vilket s�ledes delar in intervallet
% i steg om 0.33 steg.
% Detta innebär att den sökta temperaturen vid x=2.31 återfinns
% vid det 7:e steget.
% Genom detta undviker man onödigt många iterationer.

% d)
% Anledningen till att det kan vara svårt att med denna metod avgöra den 
% maximala temperaturen i staven är att feltermen som avgår när vi nått
% vårt sökta värde kan ge missvisande svar då det inte går att skapa
% rätlinje genom denna punkt, då den ligger som en topp.


