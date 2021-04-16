% Vi använder oss av Runge-kuttametoden som 
% approximerar lösningen till differential ekvationen
% input=
function hopp = hopp2019(NP)
global K


 hopp = [NP(2) -K(5)/K(2)*abs(NP(2))*sqrt((NP(2))^2+(NP(4))^2) NP(4) -K(3)-K(5)/K(2)*abs(NP(4))*sqrt((NP(2))^2+(NP(4))^2)];