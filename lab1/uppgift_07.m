clear;
clc;
format long;

%startvalue
x0 = 0; 
tolerance = 10e-8;

x1 = newtonRaphson(x0);

while abs((x1-x0)/x0) > tolerance
    x0 = x1;
    x1 = newtonRaphson(x0);
    disp('The x value is: ');
    disp(x1);
    disp('The y value is: ');
    disp(polynom(x1));
    disp('the error is: ');
    e = abs((x1-x0)/x1);
    disp(e);
end


% original root
root_1a = 7.541379310359536e-15; %for the smaller root
root_1b = 1.896287813415702; %for the bigger root

% plus 0.3%
root_2a = 7.307049782840400e-15; %for the smaller root
root_2b = 1.904494988667862; %for the bigger root

% minus 0.3%
root_3a = 7.791236195241921e-15; %for the smaller root
root_3b = 1.887863129101439; %for the bigger root

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
root_1a = 7.541379310359536e-15; %for the smaller root
root_1b = 1.896287813415702; %for the bigger root

% plus 0.4%
root_2a = 7.562240663915205e-15; %for the smaller root
root_2b = 1.896180418658755; %for the bigger root

% minus 0.4%
root_3a = 7.520632737291106e-15; %for the smaller root
root_3b = 1.896395148855026; %for the bigger root

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
