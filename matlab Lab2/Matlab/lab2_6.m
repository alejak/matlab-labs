clear all 
clc
format long

L = 3.3;
a0 = fzero(@F, 120);
u0 = [a0 310];
uprim = @(x,u) fU6(x,u,L);
[xx, uu] = ode45(uprim, [0,L], u0);
plot(xx, uu(:,2)); grid on;
xlabel('punkt på staven');
ylabel('temperatur');
axis([0 3.30 310 490]);

[xx2, uu2] = ode45(uprim, [0, 1.76, L], u0);
svar = uu2(2,2);


function slutfel = F(a)
    L = 3.30;
    u0 = [a, 310];
    uprim = @(x,u) fU6(x,u,L);
    [x, u] = ode45(uprim, [0 L], u0);
    y1 = u(end,2);
    slutfel = 460-y1;
end

