function x = NewtonRaphsonmax2(f,df,x)
    t = 1;
    felg = 1;
%       abs(t)> 10.^(-8) ger ett relativfel på mindre än 10.^(-8)
        while abs(felg)> 10.^(-8)
            t = f(x)/df(x); % t är korrektionstermen
            % Kolumn 7 representerar kvadratisk konvergens
            x = x - t;
            felg = abs(t/x); % Uppskattning av relativfelet
        end
      disp(x);
end