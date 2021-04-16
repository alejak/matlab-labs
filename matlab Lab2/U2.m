f = @(x) 90*exp(-((2*x-pi)/0.001).^2);

format long;

% Vi måste göra en uppdelning från 0 -> pi/2 samt pi/2 -> 6
% eftersom quad gör för grova steg. Om vi istället anger 
% "hoppet" vid pi/2 som ändpunkter, kommer dessa garanterat
% att tas med och vi behöver ej oroa oss över att detta "hopp"
% slätas över.

quad(f, 0, pi/2, 10e-10) + quad(f, pi/2, 6, 10e-10)

integral(f, 0, 6, 'Waypoints', 0:0.001:6)

[q1 no1] = quad(f, pi/2-0.1, pi/2, 10e-10);
[q2 no2] = quad(f, pi/2, pi/2+0.1, 10e-10);


no = no2+no1  % Totalt antal beräkningar, beror på toleransen
q = q1+q2



