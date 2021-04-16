clear;
clc;
format long;
x=0;

% original root
root_1a = 4.2058e-13; %for the smaller root
root_1b = 1.9039; %for the bigger root

% plus 0.3%
root_2a = NewtonRaphson((52.*1.03.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*x.*exp(-x)),17*x*exp(-x) - 17*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52.*1.03,0); %for the smaller root
root_2b = NewtonRaphson((52.*1.03.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*x.*exp(-x)),17*x*exp(-x) - 17*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52.*1.03,2); %for the bigger root
% minus 0.3%
root_3a = NewtonRaphson((52*0.97*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17*x.*exp(-x)),17*x*exp(-x) - 17*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52.*0.97,0) %for the smaller root
root_3b = NewtonRaphson((52*0.97*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17*x.*exp(-x)),17*x*exp(-x) - 17*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52.*0.97,2); %for the bigger root

disp('Display task A: ');
disp('These are the differences for the smaller positive root: ');
y_1 = difference(root_1a,root_2a);
disp(['The difference is: ' num2str(y_1) '%']);

y_2 = difference(root_1a, root_3a);
disp(['The difference is: ' num2str(y_2) '%']);
disp(' ');

disp('These are the differences for the bigger positive root: ');
y_1 = difference(root_1b,root_2b);
disp(['The difference is: ' num2str(y_1) '%']);

y_2 = difference(root_1b, root_3b);
disp(['The difference is: ' num2str(y_2) '%']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% original root
root_1a = 4.2058e-13; %for the smaller root
root_1b = 1.9039; %for the bigger root

% plus 0.4%
root_2a = NewtonRaphson((52.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*1.04.*x.*exp(-x)),17.*1.04*x*exp(-x) - 17.*1.04*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52,0); %for the smaller root
root_2b = NewtonRaphson((52.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*1.04.*x.*exp(-x)),17.*1.04*x*exp(-x) - 17.*1.04*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52,2); %for the bigger root

% minus 0.4%
root_3a = NewtonRaphson((52.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*0.96.*x.*exp(-x)),17.*0.96*x*exp(-x) - 17.*0.96*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52,0); %for the smaller root
root_3b = NewtonRaphson((52.*x - ((x.^(2) + x + 0.03)./(x + 1)).^(7) -17.*0.96.*x.*exp(-x)),17.*0.96*x*exp(-x) - 17.*0.96*exp(-x) + (7*(x^2 + x + 3/100)^7)/(x + 1)^8 - (7*(2*x + 1)*(x^2 + x + 3/100)^6)/(x + 1)^7 + 52,2); %for the bigger root

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
disp('Display task B: ');
disp('These are the differences for the smaller positive root: ');
y_1 = difference(root_1a,root_2a);
disp(['The difference is: ' num2str(y_1) '%']);

y_2 = difference(root_1a, root_3a);
disp(['The difference is: ' num2str(y_2) '%']);
disp(' ');

disp('These are the differences for the bigger positive root: ');
y_1 = difference(root_1b,root_2b);
disp(['The difference is: ' num2str(y_1) '%']);

y_2 = difference(root_1b, root_3b);
disp(['The difference is: ' num2str(y_2) '%']);
