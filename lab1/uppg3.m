clc
%Sekantmetoden
disp('Sekantmetoden');
for i = 0:1;
    x0 = 0+i;
    x1 = 1+i;
    f0=(52*x0 - ((x0.^(2) + x0 + 0.03)./(x0 + 1)).^(7) -17*x0.*exp(-x0));
    disp('varv x f korr konv konv sekantkonvergens')
    disp([x0 f0])
    n = 0;
    h=1;
    h0 = 1; % Använder dessa värden för att kolla att det konvergerar regelbundet
    h1 = 1;

    while abs(x1-x0)>10.^(-8);

        f1=(52*x1 - ((x1.^(2) + x1 + 0.03)./(x1 + 1)).^(7) -17*x1.*exp(-x0));
        h0=h1;
        h1=h;
        h=f1*(x1-x0)/(f1-f0);

        %Kollar regelbundenhet:
        k = h/h0/h1;

        p=abs(h)/abs(h1).^1.62; %Subkvadratisk/superlinjär konvergens

        n = n + 1;

        disp([p])
        % Kolla om den konvergerar snabbt genom att titta på f1

        %Tilldelar föregånde varvs värden
        x0=x1; f0=f1; x1=x1-h;
    end;
    rot=x1
end
% Vilken metod jag föredrar beror på vilken funktions nollställen jag ska räkna
% ut. är det en funktion vars derivata är enkel att uttrycka fungerar
% NR-metoden bra. är det en svår derivata kan sekant-metoden  lämpa sig bättre. 
% Har funktionen dessutom låga värden på derivatorna
% fungerar sekantmetoden mindre bra. Vid sekantmetoden måste 2 värden på x
% även väljas där man vet att roten ligger emellan medans man i NR-metoden
% endast måste välja ett x-värde. Vilket som är smidigast skiljer sig från
% fall till fall. 
