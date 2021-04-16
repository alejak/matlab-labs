function [fel,xut,uut] = felfunk(giss)
    x0=0; y0=300; xslut=3.5; ratt=420;
    yprim0=giss;
    u0=[y0; yprim0];
    [xut, uut]=ode45('dudx',[x0,xslut],u0);
    n=length(xut);
    yprimslut=uut(n,2);
    fel=yprimslut-ratt;
end