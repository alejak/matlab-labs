clear;
clc;
clf;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
days = [121 152 182 213 244 274]';
sun_up = [15.6 17.9 18.3 16.5 14.1 11.4]';

% least square method of polynom of grade 2
a = [days.^0 days days.^2];

% the coefficiants c are given by a*c=sun_up => c = a\sun_up
% disp('The coefficiants are: ');
c = a\sun_up;

% how long does the sun shine on 6th of juli?
juli_6th = hoursOfSun_1(187);
disp(['On the 6th of juli the sun shines: ' num2str(juli_6th) ' hours']);
disp(' ');

% how long does the sun shine on 24th of december?
december_24th = hoursOfSun_1(358);
disp(['On the 24th of december the sun shines: ' num2str(december_24th) ' hours']);
disp(' ');

% between which intervall should one use this curve?
% the sun can never appear negative hours of day, so maybe that should be the interval limits
polynomial = [c(3) c(2) c(1)];
r = roots(polynomial);
% the roots are 335.3039401201611 and 13.8936119936924
disp(['The modell should be used between the days: ' num2str(r(2)) ' and ' num2str(r(1))]);
disp(' ');

% the residual-curve
residualvector = sun_up - a*c;

% interval
date = 79:0.05:265;
hours = hoursOfSun_1(date);

% plot
% % first
subplot(2,2,1), plot(date, hours, 'b --', days, sun_up, 'r o');
grid on;
xlabel('Days');
ylabel('Hours of sun per day');
% % second
subplot(2,2,2), plot(days, residualvector, 'k--x');
grid on;
lg_a = legend('The residualvector. a)');
set(lg_a, 'fontsize', 14);
xlabel('Days');
ylabel('Hours of sun per day');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b
days_2 = [1 32 60 91 121 152 182 213 244 274 305 335]';
sun_up_2 = [6.3 7.9 10.3 15.6 17.9 18.3 16.5 14.1 11.4 13.2 8.7 6.5]';
a_2 = [days_2.^0 days_2 days_2.^2];

% coefficiants
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
% disp('The coefficiants are: ');
c_2 = a_2\sun_up_2;

% how long does the sun shine on 6th of juli?
juli_6th_2 = hoursOfSun_2(187);
disp(['On the 6th of juli the sun shines: ' num2str(juli_6th_2) ' hours']);
disp(' ');

% how long does the sun shine on 24th of december?
december_24th_2 = hoursOfSun_2(358);
disp(['On the 24th of december the sun shines: ' num2str(december_24th_2) ' hours']);
disp(' ');

% the residual-curve
residualvector_2 = sun_up_2 - a_2*c_2;
normen = norm(residualvector_2);
disp(['The norm of the residualvector is: ' num2str(normen)]);

% interval
oneYear_2 = 1:0.05:365;
hours_2 = hoursOfSun_2(oneYear_2);

% plot
% % first
subplot(2,2,3), plot(oneYear_2, hours_2, 'b--', days_2, sun_up_2, 'r o');
grid on;
xlabel('Days');
ylabel('Hours of sun per day');
% % second
subplot(2,2,4), plot(days_2, residualvector_2, 'k--x');
grid on;
lg_b = legend('The residualvector. b)');
set(lg_b, 'fontsize', 14);
xlabel('Days');
ylabel('Hours of sun per day');