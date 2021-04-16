function shooting_method
clc
clear all
x=1.5
x1=fzero(@solver, x)

end

% 0.015006794813450   4.683464566982176

function F = solver(x)
    options=odeset('RelTol', 10e-14, 'AbsTol', [1e-16, 1e-16]);
    [t, u]=ode45(@equation, [0 3.5], [300 x], options);
    s=length(t);
    F=u(s, 1)-420;
    
    u(s, 1);
    figure(1)
    plot(t, u(:,1))
    
    disp([t u(:,1)])
    hold on;
end


function du = equation(t, u)
    du=zeros(2,1);
    du(1)=u(2);
    du(2)=-250*exp(-(t-3.5/2).^2)/(2+t/6)-(1/6)*u(2)/(2+t/6);
end