clc 
%Funktionerna y(x) och dx/dy:
f = @(x) (52.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*x.*exp(-x));
df = @(x) 17*x*exp(-x) - 17*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52;


%Funktionerna y(x) och dx/dy med 52+3%
%f =(52.*1.03.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*x.*exp(-x));
%df = 7.*(x.^(2)+x-0.03).^(7)/(x+1).^(8)-(7.*(2.*x+1).*(x.^(2)+x+0.03).^6)/(x+1).^7-17.*x.*exp(-x)+17.*exp(-x).*x+52*1.03;

%Funktionerna y(x) och dx/dy med 52-3%
%f =(52*0.97*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17*x.*exp(-x));
%df = 7*(x.^(2)+x-0.03).^(7)/(x+1).^(8)-(7*(2*x+1)*(x.^(2)+x+0.03).^6)/(x+1).^7-17*x*exp(-x)+17*exp(-x)*x+52*0.97:

%Intervall variabler:
a = 10.^-12;
da = 10.^-20;
A = 2.5;
dA = 10.^-5;

%Plot-funktioner:
subplot(2,1,1)
x = 0:da:a;
f = (52*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17*x.*exp(-x));
plot(x,f)
title('Lilla roten')
grid on
hold on

subplot(2,1,2)
x = 0:dA:A;
f = (52*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17*x.*exp(-x));
plot(x,f)
title('Stora roten')
grid on
hold on

%TEST NEWTON RAPHSON
format short
i=1;
for x = [0 2];
    t = 1;
    root = zeros(0,5);
%       abs(t)> 10.^(-8) ger ett relativfel på mindre än 10.^(-8)
        while abs(t)> 10.^(-15);
            f =  (52*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17*x.*exp(-x));
            df= 17*x*exp(-x) - 17*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52;
            g = t;
            t = f/df; % t är korrektionstermen
            % Kolumn 7 representerar kvadratisk konvergens
            disp ([x f df t g t/g t/g^2]);
            disp(f)
            x = x - t;
        end;
     root(i) = x
     i = i+1
     felg = abs(t/x) % Uppskattning av relativfelet
end

   