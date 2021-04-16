%Inskjutningsmetod
clc
clear all
format long

L = 3.5;
a0 = fzero(@F, 140); %ger oss nollst?llet, med 140 som startgissning
F(a0); %D?r funktionen ?r 0
u0 = [a0, 300]; %Startv?rde
[xut, uut] = ode45(@fun, [0,L], u0); %L?ser med ODE
plot(xut, uut(:,2)) %Plottar upp f?r att se hur v?l det st?mmer med villkor
format long


z = @(x) pchip(xut, uut(:,2), x); %interpolerar
disp(['Svar = ', num2str(z(1.5))]) %Tar ut v?rdet f?r x=1.5
%Varf?r f?r vi inte massa decimaler fast det ?r format long?

%Funktion f?r h?gerled
function uprim = fun(x,u)
    L = 3.5;

    Q = @(x) 250*exp(-(x-L/2).^2);
    k = @(x) (2+x/6);
    kprim = 1/6;
    
    uprim = [-(kprim./k(x))*u(1) - Q(x)./k(x), u(1)]';
end

% Funktion som visar hur v??l slutv??rdet ??r uppfyllt.
function slutfel = F(a)
    u0 = [a, 300];
    [t,u] = ode45(@fun, [0 3.5], u0);
    y1 = u(end,2); 
    slutfel = y1 - 420;
end