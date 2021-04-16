%Lab 2, uppgift 5

clear all
close all
clc

T0 = 0; 
Trunkering = 1; % Så länge det är större än toleransen
L = 3.5
n = 35; % Varje steglängd kommer vara 0.1 (3.5/35)
c1 = L/n;
format long
tol = 1e-6; 
%differens= [ ]; 


while (Trunkering > tol)
    n = 2.*n; % Dubblar steglängden
    [~,T1] = finitametoden(n); % Vi behöver ej första variabeln just nu 
                                % (en vektor med alla T, förutom T0 och Tl)
    Trunkering = abs(T1-T0); % trunkeringsfel
    T0 = T1; %Sista värdet
end
n, T1, Trunkering % Skriver ut värden 
[X,~] = finitametoden(n); % Hämtar ut vektorn
h = 3.5./n; 
x = h:h:3.5-h; 
plot(x,X,'m')
hold on 
%Kvot = Tl-T0

%Inskjutning
BV2 = fzero(@f,140); % Begynnelsevillkor 2, gissning på 140. 
                     % Kollar på plotten för att gissa på 140

initialvarden = [300 BV2];
x = 0:0.1:3.5;
[x,T] = ode45(@sys,x,initialvarden); % Skapar systemet, får två kolumner
T = T(:,1); % x är spannet, T är första kolumnen av temperaturvektorn
plot(x,T,'g') %ändra
T = T(16) %1.5 är 16:e elementet i vektorn (ändra)

% Regelbundenhet 
c2 = c1/2; c3 = c2/2;

%--------------------------------------------
% e) Själva antalet delintervall kommer nog inte ökas när man vi närmar oss Tmax
% då det är ganska liten variation där. 


% Men vi vet ju inte var maximipunkten ligger. Detta gör att vi 
% måste göra en undersökning på flera punkter. Och sedan estimera felet
% på den punkten som vi anser är maximipunkten. 

function dXdt = sys(x,y) 
L = 3.5;
dXdt = [y(2); -(1500.*exp(-(x-L./2).^2)+y(2))./(12+x)]; % Funktionen omskriven
end

function [X,T2] = finitametoden(n) %Funktionen för finita metoden
% Vi noterar att 1.5/3.5 = 3/7
h = 3.5./n; 
k = 3.*n./7; 
n = n-1;  
x = 0:h:3.5;
x= x(2:end-1); %Tog bort steglängden

format long

A0 =(12 + x)./h.^2; %Diagonal 1
A0 = A0';
A = 2.*A0; % Diagonalvektorn
A = spdiags(A,0,n,n); %Glesare matriser för att slippa nollorna

% Notera att A(m,n) = A(n,m)
% Vid d = 1 så tar man från andra element. 
A1 = A0 - 0.5./h; % motsvarar vektorn 
A1 = spdiags(A1,1,n,n);
% Vid d = -1 så tar man från första element
A2 = A0 + 0.5./h; % motsvarar vektorn
A2 = spdiags(A2,-1,n,n); % n är dimensionerna

A = A1 + A2 - A; %Ändrar tecknen
clear A0 A1 A2

%B = Lab205calc2(x); %Kalkylera B för x1,....,xn-1 
b = - 1500.* exp(-(x-1.75).^2);
b(1) = b(1) - (0.5 + 12./h)./h.*300; % Räkna ut b, T0 = 300
b(n) = b(n) - (15.5./h - 0.5)./h.*420; % Tl = 420
b = b'; % Räknar b ända hit
X = A\b; % X är vektorn med temperatur
clear x A B h n
T2 = X(k);
end

function error = f(gissning) %Koden för funktionen längre upp 
x = 0:0.01:3.5; %Gissning för att räkna ut BV2
initialvarden = [300 gissning]; TL = 420; 

[~,T] = ode45(@sys,x,initialvarden);
T = T(:,1); 
TL = T(length(T));
error = TL-420; % fel måste anta + - värde
end





