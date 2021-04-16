function y = minus_04(x)
y = (93.*x) - ((((x.^2)+x+0.03)./(x+1)).^8)-0.96*6.*x.*(exp(-x));
end