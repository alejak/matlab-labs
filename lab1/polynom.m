function y = polynom(x)
y = (93.*x) - ((((x.^2)+x+0.03)./(x+1)).^8)-6.*x.*(exp(-x));
end