function [Xh,Yh,l] = FHopp( iv, ivprim )
global K dt

%   Input: vinkeln samt vinkelhastigheten
%   Output: Vektorer som innehåller alla x samt y koordinater som hoppet
%   går igenom.


SP =[K(4)*sin(iv) K(4)*cos(iv)*ivprim K(6)-K(4)*cos(iv) K(4)*sin(iv)*ivprim];
%ovan konverterar vi iv och ivprim till värdena Xh Yh och 
NP = SP;
%NP = Nuvarandepunkt i hoppet = [x dx/dt y dy/dt] 
% SP Hoppets startpunkt
Punktinfo=NP; % Punktinfo sparar alla koordintater i alla tid moment i hoppet
Tend = 5; % Tend en ej så nogrann estimering av tiden tills hoppet är slut
Tstart=0;
F=Tend/dt
F*2
F*2
dt = 0.1; 
for i=1:3
    Tstart=0;
    NP = SP;
    Punktinfo=NP;
    while Tstart<Tend % Medan dessa villkor gäller körs loopen
        h1=hopp2019(NP); 
        h2=hopp2019(NP+dt*h1/2);
        h3=hopp2019(NP+dt*h2/2);
        h4=hopp2019(NP+dt*h3);
        NP=NP+dt*(h1+2*h2+2*h3+h4)/6; Tstart=Tstart+dt;
        Punktinfo=[Punktinfo; NP];

    end
    dt=dt/2
    if i == 1
        hoppfel1 = Punktinfo
    end
    if i ==2
        hoppfel2=Punktinfo(1:3:end,:)
    end
    if i == 3
        hoppfel3 = Punktinfo(1:7:end,:)
    end
end
hopptrunk1 = hoppfel2-hoppfel1;
hopptrunk2 = hoppfel3-hoppfel2;

hoppkvot = hopptrunk1/hopptrunk2;


Xh = Punktinfo(:,1); 
Yh = Punktinfo(:,3); % Alla punkter som x,y passerar

%Vi använder oss av en polynomial funktion ock löser ekvationen p(x)=0  
b = length(Xh);
a = 1;
lin = polyfit(Xh(a:b)',Yh(a:b)',2);
l = roots(lin); 

end
