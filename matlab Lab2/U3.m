%%
clc
clear
% Rotationssymetrisk lur

x = 0:0.01:4.1;
f = @(x) ((exp(-x./5))./(1.4-cos(pi*x)));

plot(x, f(x));

%%

% Trapetsregeln
a=0; b=4.1; n=5;
t=0;
r=0;
antal = 10;

for i=1:antal
    h=(b-a)/n;
    x = a+h*(0:n);
    y=pi*f(x).^2;
    t(i)=h*(sum(y)-(y(1)+y(n+1))/2);
    
    if i~=1
        E_trunk(i) = abs(t(i)-t(i-1));
        r(i) = t(i) + (t(i)-t(i-1))/3;
    end
    n=2*n;
end

% Visa trapetsresultat
i = 1;

trunk = 0;
trunk_old = 0;

r_trunk = 0;
r_trunk_old = 0;

ans = 0;

for a = r
    
    if i~=1
        trunk_old = trunk;
        r_trunk_old = r_trunk;
        trunk = abs(t(i)-t(i-1));
        r_trunk = abs(r(i)-r(i-1));
    end
    
    fprintf('---\nResultat: %d , Trunkeringsfel: %d , Kvot: %f\nRE:       %d , Trunkeringsfel: %d , Kvot: %f\n', a, trunk, trunk_old/trunk, r(i), r_trunk, r_trunk_old/r_trunk);
    ans = a;
    i = i + 1;
    
end



y=@(x)pi*f(x).^2;
ans                % Uppskattat värde
quad(y, 0, 4.1)    % Quads standardtolerans är 10e-6

% Visa mesh

y = f(x)';
fi = 0:2*pi/30:2*pi;
X=x'*ones(size(fi)); Y=y*cos(fi); Z=y*sin(fi);

mesh(X, Y, Z)
