function f = ODEsys(t,u)
global C
s=sqrt(u(1)^2+u(3)^2);
f=[u(2); -C*u(1)./(s.^3);u(4);-C*u(3)./(s.^3)];
end