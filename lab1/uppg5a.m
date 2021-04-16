% Mätdata:
h = [6.3 7.9 10.3 13.2 15.6 17.9 18.3 16.5 14.1 11.4 8.7 6.5];
m = [1 32 60 91 121 152 182 213 244 274 305 335];

% Linjär interpolation:
% y = c2*x + c1

% Skapar en for-slinga som g�r en linj�r interpolation om och om igen f�r
% tv� punkter i m�tdatat tills det att alla m�tdatan �r anv�nda.
for i = 1 : length(m)-1
    mi = [m(i) m(i+1)]; % Detta skapar en 2x1-matris med de tv� aktuella dagarna
    hi = [h(i) h(i+1)]' % Detta skapar en 1x2-matris med de tv� m�tv�rderna f�r timmarna
    A = [ones(size(mi)); mi]' % Detta skapar en systemmatris
    c = A \ hi                % Detta ber�knar konstanterna
    c1 = c(1);
    c2 = c(2);
    I = m(i) : m(i+1);        % H�r skapar jag det intervall som ska plottas f�r 
                              % kurvan i loopen, dvs bara mellan de
                              % aktuella punkterna. 
                              
    y = @(x) c1 + c2*x;       % Detta �r funktionen i sig
    plot(I,y(I))              
    hold on
    
end
plot(m,h, 'X')
hold on

