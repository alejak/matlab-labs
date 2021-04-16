clear all
clc
format long

x = [4 10 8 2 1]';
y = [8 2 7 9 5]';
A = [x.^0 x y];
b = x.^2 + y.^2;
p=A\b; %minsta kvadrat metoden ger oss vårt startvärde
iter=0;
fel=1;
maxiter=10;


f = @(p) [(x(1)-p(1)).^2 + (y(1)-p(2)).^2 - p(3).^2 
    (x(2)-p(1)).^2 + (y(2)-p(2)).^2 - p(3).^2
    (x(3)-p(1)).^2 + (y(3)-p(2)).^2 - p(3).^2 
    (x(4)-p(1)).^2 + (y(4)-p(2)).^2 - p(3).^2 
    (x(5)-p(1)).^2 + (y(5)-p(2)).^2 - p(3).^2];
J = @(p) [-2*(x(1)-p(1)), -2*(y(1)-p(2)), -2*p(3)
    -2*1*(x(2)-p(1)), -2*1*(y(2)-p(2)), -2*1*p(3)
    -2*(x(3)-p(1)), -2*(y(3)-p(2)), -2*p(3) 
    -2*(x(4)-p(1)), -2*(y(4)-p(2)), -2*p(3) 
    -2*(x(5)-p(1)), -2*(y(5)-p(2)), -2*p(3)];

while norm(fel)>1e-9 & iter<maxiter;
    fel = J(p)\f(p);
    p= p-fel;
    iter = iter+1;
end;
disp('Uppgift d')
disp(['(X,Y) = ' '(' num2str(p(1)) ',' num2str(p(2)) ')'])
disp(['R = ' num2str(abs(p(3)))])

pt = [0:0.001:2*pi];
xplot = p(1) + p(3)*cos(pt);
yplot = p(2) + p(3)*sin(pt);
subplot(2,1,1);
plot(xplot,yplot,'-',p(1),p(2),'*',x,y,'o'); grid on;
xlabel('x');
ylabel('y');
axis equal;

%uppgift e

x = [4 10 24 2 1]';
y = [8 2 21 9 5]';
A = [x.^0 x y];
b = x.^2 + y.^2;
p=A\b; %minsta kvadrat metoden ger oss vårt startvärde
iter=0;
fel=1;
maxiter=10;


f = @(p) [(x(1)-p(1)).^2 + (y(1)-p(2)).^2 - p(3).^2 
    (x(2)-p(1)).^2 + (y(2)-p(2)).^2 - p(3).^2
    3*(x(3)-p(1)).^2 + 3*(y(3)-p(2)).^2 - 3*p(3).^2 
    (x(4)-p(1)).^2 + (y(4)-p(2)).^2 - p(3).^2 
    (x(5)-p(1)).^2 + (y(5)-p(2)).^2 - p(3).^2];
J = @(p) [-2*(x(1)-p(1)), -2*(y(1)-p(2)), -2*p(3)
    -2*1*(x(2)-p(1)), -2*1*(y(2)-p(2)), -2*1*p(3)
    3*-2*(x(3)-p(1)), 3*-2*(y(3)-p(2)), 3*-2*p(3) 
    -2*(x(4)-p(1)), -2*(y(4)-p(2)), -2*p(3) 
    -2*(x(5)-p(1)), -2*(y(5)-p(2)), -2*p(3)];

while norm(fel)>1e-9 & iter<maxiter;
    fel = J(p)\f(p);
    p= p-fel;
    iter = iter+1;
end;
disp('Uppgift e')
disp(['(X,Y) = ' '(' num2str(p(1)) ',' num2str(p(2)) ')'])
disp(['R = ' num2str(abs(p(3)))])

pt = [0:0.001:2*pi];
xplot = p(1) + p(3)*cos(pt);
yplot = p(2) + p(3)*sin(pt);
subplot(2,1,2);
plot(xplot,yplot,'-',p(1),p(2),'*',x,y,'o'); grid on;
xlabel('x');
ylabel('y');
axis equal;

