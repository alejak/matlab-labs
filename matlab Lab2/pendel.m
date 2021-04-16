function dydt = pendel(~,y)
dydt = [y(2); (-9.81/2.4).*sin(y(1))];
end