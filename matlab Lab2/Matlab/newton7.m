function [x1, relfel] = newton7(f, df, x0)
    y = vpa(f(x0));
    yprim = vpa(df(x0));
    diff = y/yprim;
    x1 = x0 - diff;
    relfel = (x1 - x0)/x1;
end