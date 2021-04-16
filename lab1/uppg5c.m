% M�tdata:
h = [6.3 7.9 10.3 13.2 15.6 17.9 18.3 16.5 14.1 11.4 8.7 6.5];
m = [1 32 60 91 121 152 182 213 244 274 305 335];
I = 1:335;
p = pchip(m,h, I)
s = spline(m,h,I);
plot(m,h,'o',I,p,'-',I,s,'-.');

