%Lab 2, uppgift 5

clear all
close all
clc

T0 = 0; 
Trunkering = 1; % S� l�nge det �r st�rre �n toleransen
L = 3.5
n = 35; % Varje stegl�ngd kommer vara 0.1 (3.5/35)
c1 = L/n;
format long
tol = 1e-6; 
%differens= [ ]; 


while (Trunkering > tol)
    n = 2.*n; % Dubblar stegl�ngden
    [~,T1] = finitametoden(n); % Vi beh�ver ej f�rsta variabeln just nu 
                                % (en vektor med alla T, f�rutom T0 och Tl)
    Trunkering = abs(T1-T0); % trunkeringsfel
    T0 = T1; %Sista v�rdet
end
n, T1, Trunkering % Skriver ut v�rden 
[X,~] = finitametoden(n); % H�mtar ut vektorn
h = 3.5./n; 
x = h:h:3.5-h; 
plot(x,X,'m')
hold on 
%Kvot = Tl-T0

%Inskjutning
BV2 = fzero(@f,140); % Begynnelsevillkor 2, gissning p� 140. 
                     % Kollar p� plotten f�r att gissa p� 140

initialvarden = [300 BV2];
x = 0:0.1:3.5;
[x,T] = ode45(@sys,x,initialvarden); % Skapar systemet, f�r tv� kolumner
T = T(:,1); % x �r spannet, T �r f�rsta kolumnen av temperaturvektorn
plot(x,T,'g') %�ndra
T = T(16) %1.5 �r 16:e elementet i vektorn (�ndra)

% Regelbundenhet 
c2 = c1/2; c3 = c2/2;

%--------------------------------------------
% e) Sj�lva antalet delintervall kommer nog inte �kas n�r man vi n�rmar oss Tmax
% d� det �r ganska liten variation d�r. 


% Men vi vet ju inte var maximipunkten ligger. Detta g�r att vi 
% m�ste g�ra en unders�kning p� flera punkter. Och sedan estimera felet
% p� den punkten som vi anser �r maximipunkten. 

function dXdt = sys(x,y) 
L = 3.5;
dXdt = [y(2); -(1500.*exp(-(x-L./2).^2)+y(2))./(12+x)]; % Funktionen omskriven
end

function [X,T2] = finitametoden(n) %Funktionen f�r finita metoden
% Vi noterar att 1.5/3.5 = 3/7
h = 3.5./n; 
k = 3.*n./7; 
n = n-1;  
x = 0:h:3.5;
x= x(2:end-1); %Tog bort stegl�ngden

format long

A0 =(12 + x)./h.^2; %Diagonal 1
A0 = A0';
A = 2.*A0; % Diagonalvektorn
A = spdiags(A,0,n,n); %Glesare matriser f�r att slippa nollorna

% Notera att A(m,n) = A(n,m)
% Vid d = 1 s� tar man fr�n andra element. 
A1 = A0 - 0.5./h; % motsvarar vektorn 
A1 = spdiags(A1,1,n,n);
% Vid d = -1 s� tar man fr�n f�rsta element
A2 = A0 + 0.5./h; % motsvarar vektorn
A2 = spdiags(A2,-1,n,n); % n �r dimensionerna

A = A1 + A2 - A; %�ndrar tecknen
clear A0 A1 A2

%B = Lab205calc2(x); %Kalkylera B f�r x1,....,xn-1 
b = - 1500.* exp(-(x-1.75).^2);
b(1) = b(1) - (0.5 + 12./h)./h.*300; % R�kna ut b, T0 = 300
b(n) = b(n) - (15.5./h - 0.5)./h.*420; % Tl = 420
b = b'; % R�knar b �nda hit
X = A\b; % X �r vektorn med temperatur
clear x A B h n
T2 = X(k);
end

function error = f(gissning) %Koden f�r funktionen l�ngre upp 
x = 0:0.01:3.5; %Gissning f�r att r�kna ut BV2
initialvarden = [300 gissning]; TL = 420; 

[~,T] = ode45(@sys,x,initialvarden);
T = T(:,1); 
TL = T(length(T));
error = TL-420; % fel m�ste anta + - v�rde
end





