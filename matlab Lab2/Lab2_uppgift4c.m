%Lab 2, uppgift 4c
%Animering
clear all
close all
clc

% Tidsintervall
t_start = 0;
t_end = 8;
L = 3.5;

u0 = [pi/3; 0.5];

[t,u] = ode45(@f, [t_start t_end], u0);

anim (t,u(:,1),L) % Anropar animeringskoden

% Funktion för högerledet i diffekvationen y'=f(t,y)
function dudt = f(t, u)
  % Konstanter givna i uppgiften
  L = 2.4;
  g = 9.81;
  dudt = [u(2); -(g/L)*sin(u(1))];
end

% Funktion för animeringen 
% Sätter tut som t och fiut som u
function anim(t,u,L); 
    for i=1:length(t)-1
    x0=L*sin(u(i));y0=-L*cos(u(i));
    plot([0,x0],[0,y0],'-o')
    axis('equal')
    axis([-1 1 -1 0]*1.2*L)
    drawnow
    pause(t(i+1)-t(i))

 
    end;
end
