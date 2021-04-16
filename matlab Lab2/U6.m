A=[1/9 -10/49; -30 -15]
f=[-4/36-25/49+1; -15*(8-20+12-1)];

h = A\f

next_x = 2+h(1)
next_y = 0+h(2)

%%

f = @(x) [((x(1)-4)/6).^2 + ((x(2)-5)/7).^2-1; 15*(x(1).^3-5*x(1).^2+6*x(1)-1)-x(2)] % Kommer utav 
Df = @(x) [(x(1)-4)/18 2*(x(2)-5)/49
    
      15*(3*x(1).^2-10*x(1)+6) -1];
  
x = [2.0000; 0];        % Startgissning
kmax = 20; tol=1e-8;

for k=1:kmax
    h=-Df(x)\f(x);
    x=x+h;
    disp([x' norm(h)])
    if norm(h)<tol, break, end
end