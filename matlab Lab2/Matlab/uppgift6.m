%uppgift 6
clear all 
clc
%(x1-X)^2 + (y1-Y)^2 = R^2
%(x1-c2/2)^2 + (y1-c3/2)^2 = R^2
% x1^2 - x1*c2 + (c2^2)/4 + y1^2 - y1*c3 + (c3^2)/4 = R^2
% x1^2 + y1^2 = R^2 - (c2^2)/4 - (c3^2)/4
% skriver c1 som: c1 = R^2 - (c2^2)/4 - (c3^2)/4
% Vilket ger x1^2 + y1^2 = c1 + c2*x1 + c3*y1

xm = [4; 10; 8];
ym = [8; 2; 7];
A = [xm.^0 xm ym];
b = xm.^2 + ym.^2;
c= A\b;
Xp= c(2)/2;
Yp= c(3)/2;
Rp= (c(1) + (c(2)^2)/4 + (c(3)^2)/4)^(1/2);
t = [0:0.0001:2*pi] ;

xcirkel = Xp + Rp*cos(t);
ycirkel = Yp + Rp*sin(t);

plot(xcirkel, ycirkel, 'b', Xp, Yp, 'o', xm, ym, '*'), grid on, axis equal;
xlim([-1 11]);
ylim([-3 9]);
hold on


% A = bsxfun(@times, A, [1; 1; 3]);
% b = bsxfun(@times, b, [1; 1; 3]);
% c= A\b;
% Xp= c(2)/2;
% Yp= c(3)/2;
% Rp= (c(1) + (c(2)^2)/4 + (c(3)^2)/4)^(1/2);
% 
% plot(xcirkel, ycirkel, 'r',  Xp, Yp, 'o', xm, ym, '*'), grid on, axis equal;
% xlim([-1 11]);
% ylim([-3 9]);
% hold on

xm1 = [4; 10; 8; 2; 1];
ym1= [8; 2; 7; 9; 5];
A1 = [xm1.^0 xm1 ym1];
b1 = xm1.^2 + ym1.^2;
c1= A1\b1;
Xp1= c1(2)/2;
Yp1= c1(3)/2;
Rp1= (c1(1) + (c1(2)^2)/4 + (c1(3)^2)/4)^(1/2); 

x1cirkel = Xp1 + Rp1*cos(t);
y1cirkel = Yp1 + Rp1*sin(t);

plot(x1cirkel, y1cirkel, 'r', Xp1, Yp1, 'o', xm1, ym1, '*'), grid on, axis equal;
xlim([-1 11]);
ylim([-3 9]);
hold on


xm2 = [4; 10; 8; 2; 1];
ym2= [8; 2; 7; 9; 5];
A2 = [xm2.^0 xm2 ym2];
b2 = xm2.^2 + ym2.^2;
A2 = bsxfun(@times, A1, [1; 1; 3; 1; 1]);
b2 = bsxfun(@times, b1, [1; 1; 3; 1; 1]);
c2= A2\b2;
Xp2= c2(2)/2;
Yp2= c2(3)/2;
Rp2= (c2(1) + (c2(2)^2)/4 + (c2(3)^2)/4)^(1/2);

x2cirkel = Xp2 + Rp2*cos(t);
y2cirkel = Yp2 + Rp2*sin(t);

plot(x2cirkel, y2cirkel, 'g',  Xp2, Yp2, 'o', xm2, ym2, '*'), grid on, axis equal;
xlim([-1 11]);
ylim([-3 9]);
hold on

xm3 = [4; 10; 24; 2; 1];
ym3= [8; 2; 21; 9; 5];
A3 = [xm3.^0 xm3 ym3];
b3 = xm3.^2 + ym3.^2;
c3= A3\b3;
Xp3= c3(2)/2;
Yp3= c3(3)/2;
Rp3= (c3(1) + (c3(2)^2)/4 + (c3(3)^2)/4)^(1/2); 

x3cirkel = Xp3 + Rp3*cos(t);
y3cirkel = Yp3 + Rp3*sin(t);

plot(x3cirkel, y3cirkel, 'r', Xp3, Yp3, 'o', xm3, ym3, '*'), grid on, axis equal;
xlim([-1 11]);
ylim([-3 9]);
hold on
