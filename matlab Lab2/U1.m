clear 
clc
%% DELUPPGIFT (A)

syms t;
f = (1-(exp(-t.^3))./8)./(3.*t.^3);

fplot(f, [0 1e-4]);

%% DELUPPGIFT (B)

a=0; b=10000;
n=1000;
t=0;
antal = 10;


% Fel som uppstår av svanskapning:

svans_fel = 10.^(-9); % Svans-integralen kommer ligga inom den här gränsen

for i=1:antal
    ans = 0;
    
    h=(b-a)/n; %intrvall varje trapets bas
    x = a+h*(0:n);
    y=funktion(x);
    t(i)=h*(sum(y)-(y(1)+y(n+1))/2); %trapetsmetoden
    
    if i~=1
        E_trunk(i) = abs(t(i)-t(i-1));
        
        format long;
        fprintf('Fel: %d, Kvot: %d\n', (E_trunk(i)), E_trunk(i-1)/E_trunk(i));
            if  (svans_fel + E_trunk(i))<10e-9
                fprintf('Found sufficient solution: %d (+- %d)\n\n', t(i), (svans_fel + E_trunk(i)));
            ans = t(i);
         
             end
    end
    
    
    n=2*n; %vi loopar över igen med 2 ggr så många intervall
end

disp(ans);
