%Lab 2, uppgift 4d,e,f
%Interpolation
clear all
close all
clc

% Tidsintervall
t_start = 0;
t_end = 8;

u0 = [pi/3; 0.5]; 
[t,u] = ode45(@f, [t_start t_end], u0, odeset('RelTol',1e-6)); % F�r ett mer
                                      % exakt v�rde �ndrar vi toleransen till
                                      % 6 korrekta siffror

index = find(u(:,1)<0) % Hittar alla index d�r u �r negativ 

% St�ller upp matrissystemet
x0 = t(36:40); % Punkterna som vi anpassar kurvan till (f�rsta nollst�llet)
A = [x0.^0 x0.^1]; % Engradspolynom eftersom vi endast vill interpolera vid nollst�llet
u = u(:,1);
c = A\u(36:40); % Interpolationen
fun = @(x0) c(1)+c(2)*x0; % Datapunkterna
x1 = fzero(fun,3) % Hittar punkt d�r fun(x) = 0

x0 = t(93:97); % Punkterna som vi anpassar kurvan till (andra nollst�llet)
A = [x0.^0 x0.^1]; % L�gre polynom ger mer exakt v�rde
u = u(:,1);
c = A\u(93:97); % Interpolationen
fun = @(x0) c(1)+c(2)*x0; % Datapunkterna
x2 = fzero(fun,4)

Periodtid = (x2-x1)*2

subplot(2,1,1)
plot(t,u,'g',x0,fun(x0),'m') % Plottar den vanliga kurvan samt interpolationen
title('Interpolation 1')
grid on

% Felbed�mning
% testar med dubbla stegl�ngden
% g�r interpolationen igen, kolla skillnaden
x02 = t(36:2:40);
A2 = [x02.^0 x02.^1];
u = u(:,1);
c2 = A2\u(36:2:40);
fun2 = @(x02) c2(1)+c2(2)*x02;
x3 = fzero(fun2,3);

x02 = t(93:2:97);
A2 = [x02.^0 x02.^1];
u = u(:,1);
c2 = A2\u(93:2:97);
fun2 = @(x02) c2(1)+c2(2)*x02;
x4 = fzero(fun2,4);

Periodtid2 = (x4-x3)*2

subplot(2,1,2) % Plottar kurvan med dubbla stegl�ngden
plot(t,u,x02,fun2(x02))
title('Interpolation 2')
grid on

Felskattning = Periodtid-Periodtid2

% e) Vi k�r samma kod men s�tter L = 2.6

% f) Samma kod men byter ut 0.5 till 0.2

% Funktion f�r h�gerledet i diffekvationen y'=f(t,y)
function dudt = f(t, u)
  % Konstanter givna i uppgiften
  L = 2.4;
  g = 9.81;
  dudt = [u(2); -(g/L)*sin(u(1))];
end


