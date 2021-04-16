function x = NewtonRaphson(f,df,x)
    t = 1;
    root = zeros(0,5);
    felg = 1;
%       abs(t)> 10.^(-8) ger ett relativfel på mindre än 10.^(-8)
        while abs(felg)> 10.^(-8);
            g = t;
            t = f/df; % t är korrektionstermen
            % Kolumn 7 representerar kvadratisk konvergens
            disp ([x f df t g t/g t/g^2]);
            x = x - t;
            felg = abs(t/x); % Uppskattning av relativfelet
        end;
      disp(x);
end