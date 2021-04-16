clear all, format long

%a0 är derivatan i (0,310) alltså i vår startpunkt, hur kan fzero ge oss
%detta? Den försöker hitta en funktion där slutfelet är noll: Kan se felet som
%en fuktion och vill hitta dess nollställen där felet är noll. 
%a0 är nollställe för slutfelet?
options = odeset('RelTol',1*10^(-10), 'AbsTol', 1*10^(-10));
L = 3.3;
a0 = fzero(@F, 120);                 %Startgissning är derivatan 120 i punkten (0,310)). 
                                     %Från fzero får vi a0 vilken är det
                                     %korrekta värdet på derivatan (123,837...)
                                     %a0 är derivatan i (0,310)
u0 = [a0, 310];                      %Startvärden, skrivsättet ger u0=[derivata, punkt]?)
[xut, uut] = ode45(@fun, [0,L], u0,options); %Löser med ODE
plot(xut, uut(:,2),'m')
ylabel("Temperaturen")
xlabel("Variabelvärde")
title("L2U6")
grid on
axis([0 3.3 310 500])


z = @(x) pchip(xut, uut(:,2), x);                       %Interpolerar
disp(['Funktionvärdet i 1.76 är = ', num2str(z(1.76))]) %Tar ut värdet för x=1.76


%Funktion för högerled
function uprim = fun(x,u)
    L = 3.3;

    Q = @(x) 265*exp(-(x-L/2).^2);
    k = @(x) (3+x/5);
    kprim = 1/5;
    
    uprim = [-(kprim./k(x))*u(1) - Q(x)./k(x), u(1)]';  %Detta skrivsätt ger u0=[derivata, punkt] 
                                                        %eftersom u1=T' och u2=T (se papper)
end

%Denna ger vår derivata i (0,310)
%Fattar inte hur vi får a0 av denna?
%Funktionen förbättrar gissningen av derivatan? (Ju felaktigare gissning desto fler
%"iterationer")?
function slutfel = F(a)
    options = odeset('RelTol',1*10^(-10), 'AbsTol', 1*10^(-10));
    u0 = [a, 310];
    [t,u] = ode45(@fun, [0 3.3], u0,options);
    y1 = u(end,2);
    slutfel = 460-y1;    %sista korrektionen tas som felgräns: 
                        %Kollar hur väl slutpunkten stämmer överrens med
end                  %den sista punkten utifrån vår gissning