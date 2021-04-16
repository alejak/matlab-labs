clear all
close all
clc

L = 3.3;
N = 14;
T0 = 310;
TL = 460;

Tol = 1;
a = 4;
nuvarandetemp = 0;
iteration = 1;

while abs(Tol)>1e-7 
    
    h = L/(N+1);
    vektorn = [0:h:L]'; %steg fr 0-)L med h steg
    x = (vektorn(2:end-1));
    
    k =@(x) 3+x./5;
    f1 =@(w) (k(w)/(h^2))+ 1/(10*h);
    f2 =@(r) (-2*k(r))./(h^2);
    f3 =@(u) (k(u)/(h^2))-1/(10*h);
    
    A = [f3(vektorn(3:end)) f2(x) f1(vektorn(1:end-2))];
    
    A = spdiags(A, -1:1, N, N);
    
    Q = @(x) 265*exp(-((x-(L/2))).^2);
    
    b = -Q(x);
    b(1) = -Q(x(1))-f3(x(1))*T0;
    b(N) = -Q(x(1))-f1(x(N))*TL;
    
    T = A\b;
 
 
    nyatemp = T(4*(2^iteration));
    index = 4*(2^iteration);
    
    xt = x(4*(2^iteration));
    
    Tol = nyatemp - nuvarandetemp; 
    nuvarandetemp = nyatemp
    N = N*2+1;
    iteration = iteration+1;
end

y = [T0;T;TL]; 

plot(vektorn, y); grid on;

% b


% c 
%2.31/L 
SGN=0.33;
Steg=L/SGN

% d)
% svårt att hitta max temp då vi inte vet vilken punkt den befinner sig i
% Bättre motiviering: Anledningen till att det kan vara svårt att med denna metod avgöra den 
% maximala temperaturen i staven Ãr att feltermen som avgör när vi nått
% vårt sökta värde kan ge missvisande svar där det inte går att skapa
% rätlinje genom denna punkt, där den ligger som en topp.

% e)
% För att hitta Tmax vill vi ha derivatan av T. Dvs T'=0 ger oss maxpunkt

