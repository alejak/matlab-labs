clear all, format long

%a0 �r derivatan i (0,310) allts� i v�r startpunkt, hur kan fzero ge oss
%detta? Den f�rs�ker hitta en funktion d�r slutfelet �r noll: Kan se felet som
%en fuktion och vill hitta dess nollst�llen d�r felet �r noll. 
%a0 �r nollst�lle f�r slutfelet?
options = odeset('RelTol',1*10^(-10), 'AbsTol', 1*10^(-10));
L = 3.3;
a0 = fzero(@F, 120);                 %Startgissning �r derivatan 120 i punkten (0,310)). 
                                     %Fr�n fzero f�r vi a0 vilken �r det
                                     %korrekta v�rdet p� derivatan (123,837...)
                                     %a0 �r derivatan i (0,310)
u0 = [a0, 310];                      %Startv�rden, skrivs�ttet ger u0=[derivata, punkt]?)
[xut, uut] = ode45(@fun, [0,L], u0,options); %L�ser med ODE
plot(xut, uut(:,2),'m')
ylabel("Temperaturen")
xlabel("Variabelv�rde")
title("L2U6")
grid on
axis([0 3.3 310 500])


z = @(x) pchip(xut, uut(:,2), x);                       %Interpolerar
disp(['Funktionv�rdet i 1.76 �r = ', num2str(z(1.76))]) %Tar ut v�rdet f�r x=1.76


%Funktion f�r h�gerled
function uprim = fun(x,u)
    L = 3.3;

    Q = @(x) 265*exp(-(x-L/2).^2);
    k = @(x) (3+x/5);
    kprim = 1/5;
    
    uprim = [-(kprim./k(x))*u(1) - Q(x)./k(x), u(1)]';  %Detta skrivs�tt ger u0=[derivata, punkt] 
                                                        %eftersom u1=T' och u2=T (se papper)
end

%Denna ger v�r derivata i (0,310)
%Fattar inte hur vi f�r a0 av denna?
%Funktionen f�rb�ttrar gissningen av derivatan? (Ju felaktigare gissning desto fler
%"iterationer")?
function slutfel = F(a)
    options = odeset('RelTol',1*10^(-10), 'AbsTol', 1*10^(-10));
    u0 = [a, 310];
    [t,u] = ode45(@fun, [0 3.3], u0,options);
    y1 = u(end,2);
    slutfel = 460-y1;    %sista korrektionen tas som felgr�ns: 
                        %Kollar hur v�l slutpunkten st�mmer �verrens med
end                  %den sista punkten utifr�n v�r gissning