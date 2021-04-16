clear;
clc;
clf;

opts = odeset('MaxStep',1/20,'InitialStep',1/20);
[t,y] = ode45(@pendel,[0 3*pi], [pi/3; 1/2],opts);
% [t,y] = ode45(@pendel,[0 3*pi], [pi/3; 1/2]);

% plot
% subplot(2,2,1),plot(t,y(:,1),'-o',t,y(:,2),'-o')
plot(t,y(:,1),'-o',t,y(:,2),'-o');
xlabel('Time t');
ylabel('Solution y');
legend('position','vinkelhastighet')
grid on

% animation
% subplot(2,2,2),anim(t,y,2.4);

% dots A
position = y(:,1);
yA0 = position(78);
xA0 = t(78);
yA1 = position(79);
xA1 = t(79);
yA2 = position(80);
xA2 = t(80);

% interpolation with A1 and A2
kA = (yA2-yA1)/(xA2-xA1);
gA = @(x) yA1+kA*(x-xA1);
zeroA = fzero(gA,1);

% interpolation with A0 and A2
kA2 = (yA1-yA0)/(xA1-xA0);
gA2 = @(x) yA0+kA2*(x-xA0);
zeroA2 = fzero(gA2,1);

% dots B
yB0 = position(346);
xB0 = t(346);
yB1 = position(347);
xB1 = t(347);
yB2 = position(348);
xB2 = t(348);

% interpolation with B0 and B2
kB2 = (yB1-yB0)/(xB1-xB0);
gB2 = @(x) yB0+kB2*(x-xB0);
zeroB2 = fzero(gB2,4);

% interpolation with B1 and B2
kB = (yB2-yB1)/(xB2-xB1);
gB = @(x) yB1+kB*(x-xB1);
zeroB = fzero(gB,4);

% period
period = zeroB-zeroA;
disp(['the period is: ' num2str(period) '... sekunder']);