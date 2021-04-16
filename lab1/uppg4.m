
% Timmar sommarhalvåret:
hs = [15.6 17.9 18.3 16.5 14.1 11.4];
%Datumen uttryckt i dag på året:
nrday = @(s,t) day(datetime(2017,s,t),'dayofyear');
ms = [nrday(5,1) nrday(6,1) nrday(7,1) nrday(8,1) nrday(9,1) nrday(10,1)]; 
hst = [hs]';

% MODELL 1

% Matrisen A har 6 rader och 3 kolumner
A = [1 1 1 1 1 1; ms; ms.^2]'
k = cond(A) %konditionstalet

% Specifika dagar som används 
startdag = nrday(3,20)
slutdag = nrday(9,22)
dagjuni = nrday(6,6)
dagdec = nrday(12,24)
tplot = startdag:slutdag;

% Detta är normalekvationen: A'*A*x = A'*b
% x = [((A')*A)\((A')*d)]
x = A\hst;
res1 = hst - A*x;
res1norm = norm(A*x - hst)

% Detta är våra konstanter i polynomet:
x1 = x(1);
x2 = x(2); 
x3 = x(3);
f = @(t) x1 + x2.*t + x3.*t.^2;

% Plottar kurva och resiudalkurva:
subplot(3,2,1);plot (ms,hst, 'X', tplot, f(tplot))
title('Data och anpassad kurva för sommar (f)')
hold on

subplot(3,2,2);plot(ms, res1);
title('Resiudalkurva 1');
hold on

% Så här länge skulle solen vara uppe dessa dagar enligt denna modell:
nationaldag_f = f(dagjuni)
julafton_f = f(dagdec)

% Man bör endast använda modellen mellan de satum man har mätdagar för

% Timmar vinterhalvåret:
hv = [6.3 7.9 10.3 13.2 8.7 6.5];
mv = [1 32 60 91 305 335];
h = [6.3 7.9 10.3 13.2 15.6 17.9 18.3 16.5 14.1 11.4 8.7 6.5];
m = [1 32 60 91 121 152 182 213 244 274 305 335];

% MODELL 2

%Skapar B-systemmatris
B = [ones(size(m)); m; m.^2]';

%y = [((B')*B)\((B')*v)]
ht = [h]';
y = B \ ht;
y1 = y(1);
y2 = y(2);
y3 = y(3);
splot = 0:365;
g = @(s) y1 + y2.*s + y3.*s.^2;
res2 = ht - B*y;
res2norm = norm(B*y - ht)
% Så här länge skulle solen vara uppe dessa dagar enligt denna modell:
nationaldag_g = g(dagjuni)
julafton_g = g(dagdec)

subplot(3,2,3); plot (m,ht, 'X', splot, g(splot));
title('Data och anpassad kurva för sommar och vinter (g)');
hold on

subplot(3,2,4); plot (m, res2); 
title('Resiudalkurva 2');
hold on

% Normvärdet för första modellen är bättre
% Dock är vädrdet för vinter dagen självklart bättre för den andra modellen
% Man kan dra antagandet att den första modellen är bättre för sommardagen
% då sommardagarna själva utgör en bättre modell för dagar i närheten av
% dem.

% MODELL 3:
T = 365;
w = (2.*pi./T);
C = [ones(size(m)); cos(w.*m); sin(w.*m); tan(w.*m)]';
z = C \ ht;
z1 = z(1);
z2 = z(2);
z3 = z(3);
z4 = z(4);
u = @(r) z1 + z2.*cos(w.*r) + z3.*sin(w.*r) + z4.*tan(w.*r);

res3 = ht - C*z;
res3norm = norm(C*z - ht)

nationaldag_u = u(dagjuni)
julafton_u = u(dagdec)

subplot(3,2,5); plot (m,ht, 'X', splot, u(splot));
title('Data och anpassad kurva för sommar och vinter (u)');
hold on

subplot(3,2,6); plot (m, res3);
title('Resiudalkurva 3');
hold on

% Jag har lagt till + tan(w*r) i uttrycket vilket gjorde normen mindre.