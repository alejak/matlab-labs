clear all 
clc

t = [6.2; 8.1; 10.6; 12.9; 15.5; 18.1; 18.5; 16.3; 14.0; 11.5; 8.6; 6.6];
dag = [1; 32; 60; 91; 121; 152; 182; 213; 244; 274; 305; 335];
x = 1:365;

%Styckvis  linjär interpolation
subplot(5,1,1);
plot(dag, t, '.', dag,t); title('Styckvis linjär interpolation'); grid on;
 
%Interpolation med ett polynom
%polyfit(x,y,n) ger ett polynom av grad n
a = polyfit(dag, t, 2);
p1 = polyval(a,x);
subplot(5,1,2);
plot(dag, t, '.', x, p1); title('Interpolation med polynom'); grid on;
 
%Splineinterpolation
%Spline ger styckvis kubisk hermiteinterpolation, precis som pchip och
%makima. Spline har problem med att hantera platta delar av ploten, dvs om
%flera punkter i rad har samma y-värde. Men är bättre på att hantera data
%som är vågformad
%yq = spline(x,y,xq) där xq specifierar vilka x-koordinater som den
%interpolerade funktionen yq använder
p2 = spline(dag,t,x); 
subplot(5,1,3);
plot(dag, t, '.', x, p2); title('Splineinterpolation'); grid on;

%Interpolation med pchip
%Pchip äör en annan typ av styckvis kubisk hermiteinterpolation. Pchip är
%väldigt aggresiv i att undvika så kallade overshoots vilket dock leder till att
%den ibland missar lokala maximum och minimum punkter när den egentliga
%kurvan till datan är vågformad
%yq = pchip(x,y,xq)
p3 = pchip(dag,t,x);
subplot(5,1,4);
plot(dag, t, '.', x, p3); title('PCHIP'); grid on;

%Interpolation med makima
%Makima är en inbyggd funktion i matlab, makima står för Modified Akima
%piecewise cubic Hermite interpolation och är ett mellanting till pchip och
%spline. Makima är inte lika aggresiv som pchip på att undvika overshoots
%och man har samtidigt lyckats elinimera problemen som uppstår i splice så
%väl som i vanlig akima när efterföljande x-värden har samma y-värde. Detta ger
%en bättre approximation än pchip och splice. 
p4 = interp1(dag,t,x,'makima');
subplot(5,1,5);
plot(dag, t, '.', x, p4); title('Makima'); grid on;
