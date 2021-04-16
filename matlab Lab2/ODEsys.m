%Lab 2, uppgift 4b
clear all
close all
clc

% Tidsintervall
t_start = 0;
t_end = 8; % V�ljer 8 f�r att f� tv� hela perioder

u0 = [pi/3; 0.5]; % Initialvillkor

[t,u] = ode45(@f, [t_start t_end], u0); % ode45 returnerar en vektor med 
% alla tidpunkter och en matris med l�sningen, d�r varje kolumn motsvarar
% en variabel och varje rad en tidpunkt

subplot(3,1,1) % Plottar ut u1(fi), allts� vinkeln
plot(t, u(:,1)) % Rita f�rsta variabeln, vinkeln
title('Vinkeln som funktion av tiden')
xlabel('Tid')
ylabel('Vinkel')
grid on

subplot(3,1,2) % Plottar andra variabeln u2(fi'), allts� vinkelhastigheten
plot(t, u(:,2))
title('Vinkelhastigheten som funktion av tiden')
xlabel('Tid')
ylabel('Vinkelhastighet')
grid on

subplot(3,1,3) % Plottar vinkelhastigheten som funktion av vinkeln (frivillig)
plot(u(:,1),u(:,2))
grid on
title('Vinkelhastigheten som funktion av vinkeln')
xlabel('Vinkel')
ylabel('Vinkelhastighet')
grid on

% Funktion f�r h�gerledet i diffekvationen y'=f(t,y)
function dudt = f(t, u)
  % Konstanter givna i uppgiften
  L = 2.4;
  g = 9.81;
  dudt = [u(2); -(g/L)*sin(u(1))];
end




