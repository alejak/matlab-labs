clc;
clear;
global K dt  

% K = [k m g l c h] 
K = [1.26 21 9.81 2.4 0.16 2.7];
% Första parametern (k)  är en dämpande konstant beroende på luftmotstånd och trädgrensfriktion.
% Andra parametern (m) är Nalle-Majas vikt tillsammans med gungan
% Tredje parametern (g) är gravitationen
% Fjärde parametern (l) är repets längd
% Femte parametern (c) är luftmotståndet under hoppet
% Sjätte parametern (h) är trädgrenens höjd över marken
dt = 0.01; 
% dt längd av steget i hoppet och gungningen

XY = [0 0]; % koordinaternas startpunkter.
gtid = 20; % gungtiden 
rad=pi/180;
y =[-28*rad 0]; % initialvilkor till diff ekvationen. 0 är start hastigheten.
%y=[-28*rad -5/K(4)];

HL = []; % HL är en vektor som sparar hopplängderna
XC = []; % XC är en tom vektor som kommer spara alla x-koordinater
YC = []; % YC är en tom vektor som kommer spara alla x-koordinater

%Nedan följer vår beräkning m.h.a. Runge-Kuttas metod för att beräkna
%gungans pendel
Y=y;
t=0;

while t<gtid
    f1=gungansfunktion(y); 
    f2=gungansfunktion(y+dt*f1/2);
    f3=gungansfunktion(y+dt*f2/2);
    f4=gungansfunktion(y+dt*f3);
    y=y+dt*(f1+2*f2+2*f3+f4)/6; t=t+dt;

    Y=[Y; y]; %Y är vinkeln och y vinkhelhastigheten
end



Fx=Y;
[r k] = size(Fx); % skapar en vektor av storleken Fx 
U = []; 
index = 1;

for n=1:r
iv = Fx(n,1); % initialvinkel
ivprim = Fx(n,2); % Vinkeländring
SP =[K(4)*sin(iv) K(4)*cos(iv)*ivprim K(6)-K(4)*cos(iv) K(4)*sin(iv)*ivprim];

%ovan konverterar vi iv och ivprim till värdena Xh Yh och 
NP = SP;
%NP = Nuvarandepunkt i hoppet = [x dx/dt y dy/dt] 
% SP Hoppets startpunkt
Punktinfo=NP; % Punktinfo sparar alla koordintater i alla tid moment i hoppet
Tend = 5; % Tend en ej så nogrann estimering av tiden tills hoppet är slut
Tstart=0;
dt = 0.01; 

while Tstart<Tend && NP(3)>0 % Medan dessa villkor gäller körs loopen
    h1=hopp2019(NP); 
    h2=hopp2019(NP+dt*h1/2);
    h3=hopp2019(NP+dt*h2/2);
    h4=hopp2019(NP+dt*h3);
    NP=NP+dt*(h1+2*h2+2*h3+h4)/6; Tstart=Tstart+dt;
    Punktinfo=[Punktinfo; NP];

end



Xh = Punktinfo(:,1); 
Yh = Punktinfo(:,3); % Alla punkter som x,y passerar

%Vi använder oss av en polynomial funktion ock löser ekvationen p(x)=0  
b = length(Xh);
a = b-1;
lin = polyfit(Xh(a:b)',Yh(a:b)',1);
langd = roots(lin); 
if max(langd) > max(HL)
XC = Xh; % sparar det längsta hoppet i x-koordinat
YC = Yh; % sparar det längsta hoppet i y-koordinat
U = [iv ivprim] % Sparar vinkeln och vinkelhastigheten för det längsta hoppet
index = n % Sparar raden  av Fx där vinkeln och vinkelhastigheten ger det längsta hoppet
end
HL = [HL langd]
end




MaxHopp = max(HL)  % hoppets maxlängd
disp('chosen angle')
U(1)/rad % radianer->grader
disp('chosen anglevelocity')
U(2) % grader->radianer

% plotten börjar

axis([-1 2 -1 5]), axis equal, hold on
title('Gungning & hopp'), pause(0.01)
set(gcf,'Doublebuffer','on')

for i=1:index % plotten slutar  
    plot([0 XY(1)], [2.5 XY(2)+2.5], 'w', XY(1), XY(2)+2.5, 'wo') % den målar om med vitt så att funktionen endast syns i nutid. 
    XY(1) = K(4)*sin(Fx(i,1)); XY(2) = -K(4)*cos(Fx(i,1));
    plot([0 XY(1)], [2.5 XY(2)+2.5], XY(1), XY(2)+2.5, 'ro'), pause(0.01) 
    xlabel('x'),ylabel('y')
end

hold on

for i=1:length(XC)
    if i>1
    plot(XC(i-1),YC(i-1),'wo') % den målar om med vitt
    end
plot(XC(i),YC(i),'ro'),pause(0.01) 
end
hold on
plot(XC,YC) % plottar hoppet 
hold on
plot(MaxHopp,0,'*') % plottar landningspunkt