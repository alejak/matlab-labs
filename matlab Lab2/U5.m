L = 3.5;
T0 = 300;
TL = 420;

k = @(x) 2+x/6;
Q = @(x) 250*exp(-(x-L/2).^2);

N = 1+7*4;
x_pos = 3*(N-1)/7;

resultat = 0; % Resultat
err = 1;      % Fel

re_resultat = 0; % Richardsonresultat
re_err = 1;      % Richardsonfel

cc = 1;

while re_err>1e-6
    x_pos = 3*(N-1)/7;
    n = N-1;
    h = L/n;
    x=h*(1:n)';  % Diskretiserar intervallet [0 L]
    
    a = -(1/12*h) - k(x)/(h^2);
    b = 2*k(x)/(h^2);
    c = (1/12*h)-k(x)/(h^2);

    
    A = [];
    A = sparse(A);
    
    for i=1:n
        A(i,i)=b(i); % b
    end
 
    for i=1:n-1
        A(i,i+1)=a(i); % a
        A(i+1,i)=c(i+1); % c
    end

    A(1,n)=0;
    A(n,1)=0;

    q = Q(x);
    
    q(1)=q(1)-c(1)*T0;
    q(n)=q(n)-a(n)*TL;

    y = A\q;
    
    resultat(cc) = y(x_pos);
    if cc~=1
        re_resultat(cc) = 2*resultat(cc)-resultat(cc-1); % Richardson
    else
        re_resultat(cc) = y(x_pos);
    end
    
    if cc~=1
        err = abs(resultat(cc-1)-resultat(cc));
        re_err = abs(re_resultat(cc-1)-re_resultat(cc));
    end
    cc = cc + 1;
    
    if re_err<=1e-6
        plot(x, y)
        hold on;
    end
        
    N=2*(N-1)+1; % Halverar stegl?ngd
end

%% 

plot(1.5, resultat(length(resultat)), '*');
 
prev_err = 1;
err = 1;
for i=2:length(re_resultat)
    err = abs(re_resultat(i)-re_resultat(i-1));
    disp([re_resultat(i) err (prev_err/err)]);
    prev_err = err;
end
