clear;
clc;
clf;
format long;

f = @(x) 90*exp(-((2*x-pi)./(0.001)).^2);
g = @(x) (9./200).*(exp(-(x.^2)));

% tolerance
tolerance = 1e-7;

% plot f
interval = 0:0.001:pi;
plot(interval,f(interval));
grid on;

% % quad f
% qf = quad(f,0,6, tolerance);
% disp(['quad f gives us: ' num2str(qf)]);
% disp(qf);

% quad g
tolerance = 1e-8;
qg = quad(g, -1e+10, 1e+10, tolerance); 
disp(['quad g gives us: ' num2str(qg)]);
disp(qg);

% "svansarna"
y = (((0.001.^2)*90*exp(-((12-pi).^2)))./(24-2*pi));

% % integral f
% integral_f = integral(f,0,6);
% disp(['integral f gives us: ' num2str(integral_f)]);
% disp(integral_f);

% integral g
integral_g = integral(g,-100, 100);
disp(['integral g gives us: ' num2str(integral_g)]);
disp(integral_g);

[inte, punkter] = quad(g, -5, 5, tolerance);
disp(['The integral shows us: ' num2str(inte)]);
disp(inte);
disp(['The function is called in: ' num2str(punkter) ' dots']);