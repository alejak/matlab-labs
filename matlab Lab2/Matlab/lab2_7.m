clear all
clc
format long

x = [4 10 8];
y = [8 2 7];
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
    -2*(x(3)-p(1)), -2*(y(3)-p(2)), -2*p(3)];
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



    


      