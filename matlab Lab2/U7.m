clc
clear
syms x1 x2 x3 y1 y2 y3 X Y R
x1 = 4; y1 = 8;
x2 = 10; y2 = 2;
x3 = 8; y3 = 7;
eqn1 = (x1-X).^2+(y1-Y).^2==R.^2;
eqn2 = (x2-X).^2+(y2-Y).^2==R.^2;
eqn3 = (x3-X).^2+(y3-Y).^2==R.^2;
sol = solve (eqn1,eqn2,eqn3);

Y = double(sol.Y);
X = double(sol.X);
R = abs(double(sol.R));
fprintf('Värdet för X är: %d\n', X);
fprintf('Värdet för Y är: %d\n', Y);
fprintf('Värdet för R är: %d\n', R);

syms c1 c2 c3  x1 x2 x3 y1 y2 y3
x1 = 4; y1 = 8;
x2 = 10; y2 = 2;
x3 = 8; y3 = 7;
eqn1 = c1+c2.*x1+c3.*y1 == x1.^2+y1.^2;
eqn2 = c1+c2.*x2+c3.*y2 == x1.^2+y1.^2;
eqn3 = c1+c2.*x3+c3.*y3 == x1.^2+y1.^2;
sol = solve (eqn1,eqn2,eqn3);

c1 = sol.c1;
c2 = sol.c2;
c3 = sol.c3;

xcenter = c2/2;
ycenter = c3/2;
Rlin = sqrt((4.*c1+(c2.^2)+(c3.^2))/4);

fprintf('Värdet för X i linjär form är: %d\n', xcenter)
fprintf('Värdet för Y i linjär form är: %d\n', ycenter)
fprintf('Värdet för R i linjär form är: %d\n', Rlin)

syms x1 x2 x3 y1 y2 y3 X Y R
x1 = 4; y1 = 8;
x2 = 10; y2 = 2;
x3 = 8; y3 = 7;
eqn1 = (x1-X).^2+(y1-Y).^2==R.^2;
eqn2 = (x2-X).^2+(y2-Y).^2==R.^2;
eqn33 = 3.*(x3-X).^2+3.*(y3-Y).^2==3.*R.^2;

sol = solve (eqn1,eqn2,eqn33);

Y = double(sol.Y);
X = double(sol.X);
R = double(sol.R);
fprintf('Värdet för X med eqn33 är: %d\n', X)
fprintf('Värdet för Y med eqn33 är: %d\n', Y)
fprintf('Värdet för R med eqn33 är: %d\n', R)
fprintf('Alltså samma som innan \n')

xm1 = [4; 10; 8; 2; 1];
ym1= [8; 2; 7; 9; 5];
A1 = [xm1.^0 xm1 ym1];
b1 = xm1.^2 + ym1.^2;
c1= A1\b1;
Xp1= c1(2)/2;
Yp1= c1(3)/2;
Rp1= (c1(1) + (c1(2)^2)/4 + (c1(3)^2)/4)^(1/2); 
t = [0:0.0001:2*pi] ;
x1cirkel = Xp1 + Rp1*cos(t);
y1cirkel = Yp1 + Rp1*sin(t);
%subplot(2,1,1)
plot(x1cirkel, y1cirkel, 'r', Xp1, Yp1, 'o', xm1, ym1, '*'), grid on, axis equal;
xlim([-1 11]);
ylim([-3 9]);
hold on

fprintf('Med MKV får vi cirkelns mittpunkt till x=%d y=% och dess radie till r = %d\n',x1cirkel,y1cirkel,Rp1);

xm2 = [4; 10; 24; 2; 1];
ym2= [8; 2; 21; 9; 5];
A2 = [xm1.^0 xm1 ym1];
b2 = xm1.^2 + ym1.^2;
c2= A1\b1;
Xp2= c1(2)/2;
Yp2= c1(3)/2;
Rp2= (c1(1) + (c1(2)^2)/4 + (c1(3)^2)/4)^(1/2); 
t = [0:0.0001:2*pi] ;
x2cirkel = Xp1 + Rp1*cos(t);
y2cirkel = Yp1 + Rp1*sin(t);
%subplot(2,1,2)
plot(x2cirkel, y2cirkel, 'r', Xp2, Yp2, 'o', xm2, ym2, '*'), grid on, axis equal;
xlim([-1 25]);
ylim([-3 22]);
hold on


fprintf('Med MKV får vi för den andra cirkelns mittpunkt till x=%d y=% och dess radie till r = %d\n',x2cirkel,y2cirkel,Rp2);

