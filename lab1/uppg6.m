clc;
format long
 xvector = [4 10 8]';
 yvector = [8 2 7]';

xvector = [4 10 8 2 1]';
yvector = [8 2 7 9 5]';
xvector(3) = xvector(3)*3;
yvector(3) = yvector(3)*3;

% the circle-equation -- d.^2 = x.^2 + y.^2;
A = [xvector.^0 xvector  yvector];
k = xvector.^2 + yvector.^2;

% multiply by 3
%k(3,:) = k(3,:)*3;
%A(3,:) = A(3,:)*3;

% coefficients, A*c=k
c = A\k;

%MKV för överbestämt ekvationssystem

disp('The coefficients are:');
disp(['c1 = ' num2str(c(1))]);
disp(['c2  = ' num2str(c(2))]);
disp(['c3 = ' num2str(c(3))]);

% center of the circle
c2 = c(2);
c3 = c(3);
xcenter = c2/2;
ycenter = c3/2;

% R
R = sqrt((4*c(1)+(c2.^2)+(c3.^2))/4);

% plot the dots
t = 0:0.01:2*pi;
x = xcenter + R*cos(t);
y = ycenter + R*sin(t);
plot(xvector,yvector,'r  o', xcenter,ycenter,'k  X',x,y,'b--');
grid on;
set(legend('data points','center of the circle','the circles equation'),'fontsize',14);
xlabel('x-axis');
ylabel('y-axis');

disp(' ');
disp('The center of the circle is: ');
disp(['(' num2str(xcenter) ',' num2str(ycenter) ')']);
disp(' ');
disp(['The radius of the circle is: ' num2str(R)]);