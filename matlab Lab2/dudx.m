function uprim=dudx(x,u)
    uprim=[u(2); -250*exp(-(x-3.5/2).^2)-(1/6)*u(2)];
end