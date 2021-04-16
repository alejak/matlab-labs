function [noll,k,m] = noll(value1, value2, tt, vinkel)
k = (vinkel(value1)-vinkel(value2))/(tt(value1)-tt(value2));
m = vinkel(value2) - tt(value2)*k;
noll = (0-m)/k;
end
