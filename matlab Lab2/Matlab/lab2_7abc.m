clear all
clc
format long

x = [4 10 8];
y = [8 2 7];
%plot(x(:,1),y(:,1),'*'); grid on;
plot(x(1,1),y(1,1),'o',x(1,2),y(1,2),'o',x(1,3),y(1,3),'o'); grid on;  
axis([-11 11 -9 9])
%start och max värde på iterationer
iter=0;
fel=1;
maxiter=10;
k = 1;
% gissade startvärden på [x y r] baserat på plot
p=[4 2 6]';

%ekvationssystemet för radien
f = @(p) [(x(1)-p(1)).^2 + (y(1)-p(2)).^2 - p(3).^2 
    (x(2)-p(1)).^2 + (y(2)-p(2)).^2 - p(3).^2
    k*(x(3)-p(1)).^2 + k*(y(3)-p(2)).^2 - k*p(3).^2];

% jacobi
J = @(p) [-2*(x(1)-p(1)), -2*(y(1)-p(2)), -2*p(3)
    -2*1*(x(2)-p(1)), -2*1*(y(2)-p(2)), -2*1*p(3)
    k*-2*(x(3)-p(1)), k*-2*(y(3)-p(2)), k*-2*p(3)];
%start och max värde på iterationer

while norm(fel)>1e-9 & iter<maxiter;
    fel = J(p)\f(p);
    p= p-fel;
    iter = iter+1;
end;
 disp('Uppgift a')
 disp(['(X,Y) = ' '(' num2str(p(1)) ',' num2str(p(2)) ')'])
 disp(['R = ' num2str(abs(p(3)))])

%b-uppgift
 disp('Uppgift b')

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
%c-uppgift

k=3;
while norm(fel)>1e-9 & iter<maxiter;
    fel = J(p)\f(p);
    p= p-fel;
    iter = iter+1;
end;
 disp('Uppgift c')
 disp(['(X,Y) = ' '(' num2str(p(1)) ',' num2str(p(2)) ')'])
 disp(['R = ' num2str(abs(p(3)))])



    


      