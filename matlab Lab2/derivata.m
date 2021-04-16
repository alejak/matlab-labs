function f = derivata(x)
    h = 10e-6;
    f = (funktion(x+h)-funktion(x))/h;
end