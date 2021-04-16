format long;
a = 1; %finish
b = 0; %start

for i = 1:15
    c = secantMethod(a, b);
    disp(['i=' num2str(i)]);
    disp(['    x = ' num2str(c)]);
    disp(['    y = ' num2str(polynom(c))]);
    b = a;
    a = c;
    t=c*(a-b)/(f1-f0);
    k=t/(g1*g0);
    disp([x1 f1 t k]);
    if isnan(c) == 1
        break
    end

end

% a
% rot nr 1: 7.541379310359536e-15
% rot nr 2: 1.896287813411384

% b
% do we have quick and "regelbunden" convergence?

% c
% The convergence of the Secant Method to simple roots is called superlinear
% meaning that it lies between linearly and quadratically convergent
% methods. It's convergence order is 1.6

% d
% Newtons method is faster but you have to derivate the function, which
% always isn't possible. Newtons method have the convergence-order a = 2
% (quadratic convergence) while the sekant-method has a = 1.62. So we
% prefer Newtons method, because it's quicker.