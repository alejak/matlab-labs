% It calculates ODE using Runge-Kutta 4th order method
% Author Ido Schwartz
%indata är ekvationen i fråga
%utdata är diff-ekvationens värden äver ett givet intervall 
function y = Rungekutta(f,Y)
global dt gtid 
    x = 0:dt:gtid;                                         % Calculates upto y(3)
    y = zeros(1,length(x)); 
    y(1)=Y(1);                                    % initial condition
    F_xy = f;                    % change the function as you desire
    for i=1:(length(x)-1)                              % calculation loop
        k_1 = F_xy(x(i),y(i));
        k_2 = F_xy(x(i)+0.5*dt,y(i)+0.5*dt*k_1);
        k_3 = F_xy((x(i)+0.5*dt),(y(i)+0.5*dt*k_2));
        k_4 = F_xy((x(i)+dt),(y(i)+k_3*dt));
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*dt;  % main equation
    end
end