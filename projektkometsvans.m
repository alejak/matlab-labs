clear all, close all, clc
format long
 
%Konstanter från uppgift
E = 0.4;            	
R = 112;    	
a = 80;
fi = 0:pi/1000:2*pi;	%0<=fi>=2pi
 
%Radien är beroende av fi
r = R./(1+E*cos(fi));	
 
%x och y koordinater, elliptiska koordinater
x_center = 0;
y_center = 0;
 
x_cord = x_center + r.*cos(fi); 	
y_cord = y_center + r.*sin(fi);
 
%Startvärden
fi_0 = (2*pi)/3;    	
 
r_0 = R./(1+E*cos(fi_0));
x_0 = x_center + r_0.*cos(fi_0);
y_0 = y_center + r_0.*sin(fi_0);
 
plot(x_cord,y_cord)  %Ellipsen
hold on
plot(x_center, y_center, 'pentagram', 'markerfacecolor', 'y','markersize', 40) %Mittpunkten(solen)
hold on
plot(x_0, y_0, 'o','markerfacecolor', 'r', 'markersize', 15)
plot(x_0, y_0, '>', 'markerfacecolor', 'b', 'markersize', 8)	%Kometen
hold on
 
%%
%Kometens riktning i startpunkten. Riktningen i x och y-led fås genom att
%derivera uttrycket för x- och y-position
global C
C=1;
dr = (R*E.*sin(fi_0))./((1+E.*cos(fi_0))^2);   
x_P = dr.*cos(fi_0) - r_0.*sin(fi_0);
y_P = dr.*sin(fi_0) + r_0.*cos(fi_0);
 
 
k = [x_P,y_P];  %vektor för riktning
k_0 = -k./norm(k); %normerad riktning
 
%%
time_span = [0:1:2100];
v_guess = 0.080;	%Gissningar baserat på analytiska värdet v0.
v_guess2 = 0.084;
v_02 = v_guess2*k_0;
 
u_0=[x_0,v_02(1),y_0,v_02(2)] ; %begynnelsevärden
tolerance=odeset('RelTol',1e-13,'AbsTol',1e-13);
[t,u]=ode45(@ODEsys,time_span,u_0,tolerance);
 
%tar fram y-värdet i punkten innan passerar observationpunkten, dvs innan då y-värdet blir negativt. 
for i=1:length(u(:,3));
	y_1=u(i,3);
	if y_1>0;
    	Y_cord(1)=y_1;
    	pos=i;
	end
  
end
 
Y_cord(2)=u(pos+1,3);	%nästkommande två y-värden och dess x-värden
Y_cord(3)=u(pos+2,3);

X_cord(1)=u(pos,1);
X_cord(2)=u(pos+1,1);
X_cord(3)=u(pos+2,1);
 
 
c=polyfit(Y_cord,X_cord,2);
f=@(y) c*[y.^2;y;1];
f0=f(0)-80; %Erhåller det f0 vi senare behöver i sekantmetoden
%%
%Itererar gissningen med sekantmetoden
dx = 1;         	
v_0 = v_guess*k_0;
iter_1 = 0;
 
 
while abs(dx)>1e-13
	u_0 = [x_0, v_0(1), y_0, v_0(2)];
	tolerance = odeset('Reltol', 1e-13, 'Abstol', 1e-13);
	[t, u] = ode45(@ODEsys, time_span, u_0, tolerance);
	
	for i = 1:length(u(:,3))
        	
    	y_1=u(i,3);
    	
    	if y_1>0
        	Y_cord(1) = y_1;
        	pos = i;
    	end
    	
	end
 
	Y_cord(2) = u(pos+1,3);
	Y_cord(3) = u(pos+2,3);
  
	X_cord(1) = u(pos,1);
	X_cord(2) = u(pos+1,1);
	X_cord(3) = u(pos+2,1);
  
	
	
	c = polyfit(Y_cord, X_cord, 2);
	f = @(y)c*[y^2;y;1];
	
	zero_pls = f(0) - a;
	
	%Använder sekantmetoden för att anpassa gissningen tills dess att vi
	%hittar då zero_pls är så pass nära 0 att villkoret i slingan uppfylls.
	dx = -zero_pls*(v_guess - v_guess2)/(zero_pls-f0);
	v_guess2 = v_guess;
	f0 = zero_pls;
	v_guess = v_guess + dx;
	v_0 = v_guess * k_0;
      iter_1 = iter_1 +1;
end
a=1:2100;
fprintf('V0: %s \nX-value at y=0: %d \nError term:', v_guess,zero_pls)
disp(dx)
 
 
 
%Plottar kometens bana inom det tidsintervall vi angivit.
plot(u(a,1),u(a,3), '-g')
 
%%
T = [t(pos), t(pos+1)];
c = polyfit(Y_cord(1:2), T,1);
Time = @(y) c*[y;1];
 
time_obs = Time(0); %Vad är tiden då kometen är vid obesrvationspunkten.
 
iter_2 = 0;
 
%Stoftsvans:
%Tidsintervallet förändras, utvidgning del 2
%Förändras inom loopen tills dess att intervallet bara har ett värde. Således %kan inte Ode45 användas vid den sista iterationen.
for n = 0:21
	time = Time(0);
	time_0 = time/21*n;
	
	%Samma uppdelning som innan dvs 2100-delar.
	time_span = time_0:time/2100:time;
	
	C_iter = 1;
	for C = -1:0.2:1;
    	if n~=21
        	if iter_2 == 0
            	[t,u] = ode45(@ODEsys, time_span, u_0, tolerance); %punkt = p
            	plot(u(end,1), u(end,3), 'x', 'markersize', 10); %stoftkorn från p i slutpunkten
            	hold on
            	u_ref = u;
            	
        	else
            	%Utvidgning del 2
            	u_0 = [u_ref(100*n+1,1),u_ref(100*n+1,2),u_ref(100*n+1,3),u_ref(100*n+1,4)];
            	[t,u] = ode45(@ODEsys, time_span, u_0, tolerance);
            	color = [n/21 0 1-n/21];
            	plot(u(end,1), u(end,3), 'x', 'color', color);
            	hold on
            	
        	end
    	end
	end
C1_Lastpos(n+1,:)=[u(end,1) u(end,3)];  	
iter_2=iter_2+1;
end
grid on
title('Kometens färd kring solen och dess stoftmoln observerat i (80,0)')
xlabel('X (au)');
ylabel('Y (au)');
 
 
 
%%
%Analytiska värdet på V0
r = @(fi) R./(1+E*cos(fi)); 
xp = 80;
xa = abs(r(pi)*cos(pi)); %räknar med längden på den, visar ändå hur vektorn ska ligga
E_t = xp*(xa-xp)/(xa*(xa^2 - xp^2)) - 1/xa;
v0 = sqrt(2*(E_t + 1/sqrt((x_0)^2 + (y_0)^2)));
 
fprintf('Analytical V0: %s\n',v0)
 
%%
%Felskattning
abserror=abs(v0-v_guess);
relerror=abserror/v0;
 
fprintf('Comparison between analytical V0 and numerical V0\nAbsolute error V0: %s\nRelative error V0: %d\n', abserror,relerror)
 
 
%%avstånd från närmsta stoftpartiklar med C=1 som "ska" ligga på (80,0)
C1_cordserror(:,1)=C1_Lastpos(:,1)-80;
C1_cordserror(:,2)=C1_Lastpos(:,2)-0;
C1_distance=sqrt(C1_cordserror(:,1).^2 + C1_cordserror(:,2).^2); %pyth-sats
 
%maximalt avstånd från (80,0) till någon stoftpartikel kring (80,0)
C1_maxdistance=max(C1_distance);
 
fprintf('Max distance from (80,0) to dust particle: %s\n', C1_maxdistance);