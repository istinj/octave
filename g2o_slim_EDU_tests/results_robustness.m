% Results robustness 10 & 100 iterations
clc; clear; close all;
% load data
load('results_robustness_MATLAB.mat');
iter100 = 1:101;
iter10 = 1:11;


%% SYNTETHIC 500p (SIMPLE)
% Only rotational noise from N(0,1)
% 100 iterations with g2o and g2o_slim (error re-evaluated in g2o)
figure('Name','500 poses with only rotational noise N(0,1)');
semilogy(iter10, sequence_simple_awgnR_g2o_chi, 'LineWidth', 1);
hold on;
semilogy(iter10, sequence_simple_awgnR_slim_chi, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('chi2');
grid on;
axis tight;


% Translational noise + rotational noise from N(0,1000)
% 100 iterations with g2o and g2o_slim (error re-evaluated in g2o) 
figure('Name','500 poses with only rotational noise N(0,1e3)');
semilogy(iter10, sequence_simple_gnR_g2o_chi, 'LineWidth', 1);
hold on;
semilogy(iter10, sequence_simple_gnR_slim_chi, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('chi2');
grid on;
axis tight;




%% SPHERE
% Translational noise + rotational noise from N(0,1)
% 100 iterations with g2o and g2o_slim (error re-evaluated in g2o)
figure('Name','sphere with translational noise + rotational noise N(0,1)');
% subplot(2,1,1);
semilogy(iter100, sequence_sph_awgnR_g2o_chi, 'LineWidth', 1);
hold on;
semilogy(iter100, sequence_sph_awgnR_slim_chi, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('chi2');
grid on;
axis tight;

% subplot(2,1,2);
% closeup = 50:101;
% plot(iter100(closeup), sequence_sph_awgnR_g2o_chi(closeup), 'LineWidth', 1);
% hold on;
% plot(iter100(closeup), sequence_sph_awgnR_slim_chi(closeup), 'LineWidth', 1);
% hold off;
% legend('g2o','our');
% xlabel('iteration');
% ylabel('chi2');
% axis tight
% grid on;


% Translational noise + rotational noise from N(0,1000)
% 100 iterations with g2o and g2o_slim (error re-evaluated in g2o) 
figure('Name','sphere with translational noise + rotational noise N(0,1e3)');
semilogy(iter100, sequence_sph_gnR_g2o_chi, 'LineWidth', 1);
hold on;
semilogy(iter100, sequence_sph_gnR_slim_chi, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('chi2');
grid on;
axis tight;





