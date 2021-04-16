clc
clear
g = 9.81;   % Konstant
L = 2.7;    % Konstant
L= 2.8;
f = @(t,u) [u(2), -(g./L).*sin(u(1))]'; % Det linjära systemet (resultat av omvandling)

opts = odeset('AbsTol',10e-5);  % Vilken tolerans ska ode45 ha? testa olika tol för att dubbelkolla
%opts = odeset('AbsTol',10e-10); 
[t,y0] = ode45(f,[0 8], [((2.*pi)./7) 0.7],opts); % Beräknar diffekvationen
%[t,y0] = ode45(f,[0 8], [((2.*pi)./7) 0.5],opts);

subplot(3,1,1);
plot(t,y0(:,1)) % Plotta vinkeln som funktion av tiden
hold on;

% Vi vill interpolera, men inte över hela. Väljer lämpligt intervall där
% vi (med hjälp av plot) ser att nollstället befinner sig.

index = (t >= 1.5) & (t <= 2);;
d = y0(:,1);

c = polyfit(t(index), d(index), 3); % Interpolerar av grad 3. OBS: Viktigt att "degree < number of data points"
y = polyval(c, t(index));

r1 = roots(c) % Vilka är funktionens rötter? (Krav: Inom vårt intervall)

% Upprepar exakt samma, men nästa intervall

index = (t >= 2.5) & (t <= 3);
d = y0(:,1);

c = polyfit(t(index), d(index), 3); % Interpolerar av grad 3. OBS: Viktigt att "degree < number of data points"
y = polyval(c, t(index));

r2 = roots(c) % Vilka är funktionens rötter? (Krav: Inom vårt intervall)

hold on;

% Nu kan vi beräkna perioden:
per = (r2(2)-r1(2))*2;
fprintf('Perioden är: %d\n', per);



title('Vinkeln');
xlabel('Tid (s)');
ylabel('Vinkel (rad)');
grid on;

subplot(3,1,2);
plot(t,y0(:,2))
title('Vinkelhastigheten');
xlabel('Tid (s)');
ylabel('Vinkelhastighet (rad/s)');
grid on;

subplot(3,1,3);
anim(t, y0(:,1), L)
fiut = [((2.*pi)./7) ((-2.*pi)./7)];

function anim(t,fiut,L)
    for i=1:length(t)-1
    x0=L*sin(fiut(i));y0=-L*cos(fiut(i));
    plot([0,x0],[0,y0],'-o')
    axis('equal')
    axis([-1 1 -1 0]*1.2*L)
    drawnow
    pause(t(i+1)-t(i))
    end;
end