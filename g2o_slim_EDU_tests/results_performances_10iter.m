% performance results
clc;clear;close all;

iterations = 1:10;

%% closure000073
% 752 vertices 903 edges

sequence_closure_g2o = [0.00527817 0.00324565 0.00305018 0.0030253 0.00301487 0.00514935 0.00305784 0.00302843 0.00301621 0.00301133];
sequence_closure_slim = [0.009263 0.007537 0.005384 0.005312 0.005308 0.005501 0.005196 0.005052 0.005001 0.005200];
figure('Name','closure000073');
plot(iterations, sequence_closure_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_closure_slim, 'LineWidth', 1);
hold off;
xlabel('iteration');
ylabel('time [s]');
grid on;

sum_closure_g2o = sum(sequence_closure_g2o)
sum_closure_slim = sum(sequence_closure_slim)

%% sphere
% 2500 vertices 9799 edges

sequence_sphere_slim = [0.471595 0.469529 0.467295 0.468246 0.469706 0.468441 0.469919 0.470801 0.470077 0.474356];
sequence_sphere_g2o = [0.580804 0.560332 0.555043 0.562349 0.601703 0.618278 0.629956 0.642723 0.639549 0.641169];
figure('Name','sphere');
plot(iterations, sequence_sphere_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_sphere_slim, 'LineWidth', 1);
hold off;
xlabel('iteration');
ylabel('time [s]');
grid on;

sum_sphere_g2o = sum(sequence_sphere_g2o)
sum_sphere_slim = sum(sequence_sphere_slim)

%% syntetic_2000p
% 2001 vertices 24422 edges
sequence_2000p_slim = [1.572687 1.571662 1.576384 1.567167 1.572744 1.565941 1.561552 1.562350 1.570787 1.558256];
sequence_2000p_g2o = [2.46779 2.38348 2.4041 2.39395 2.39008 2.39621 2.39722 2.39215 2.40793 2.39132];
figure('Name','syntetic_2000p');
plot(iterations, sequence_2000p_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_2000p_slim, 'LineWidth', 1);
hold off;
xlabel('iteration');
ylabel('time [s]');
grid on;

sum_2000p_g2o = sum(sequence_2000p_g2o)
sum_2000p_slim = sum(sequence_2000p_slim)


%% All Pose
figure('Name','All');
subplot(1,3,1);
plot(iterations, sequence_closure_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_closure_slim, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('time [s]');
grid on;
xlim([1 10]);
title('752v + 903e');

subplot(1,3,2);
plot(iterations, sequence_sphere_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_sphere_slim, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('time [s]');
grid on;
xlim([1 10]);
title('2500v + 9799e');

subplot(1,3,3);
plot(iterations, sequence_2000p_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_2000p_slim, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('time [s]');
grid on;
xlim([1 10]);
title('2001v + 24422e');


%% Small BA
% 9472 vertices: 1001 SE3 and 8471 R3 | 25537 edges: 6013 SE3 and 19524 SE3_R3

sequence_ba_small_g2o = [ 0.158707
 0.149726
 0.159787
 0.168844
 0.182285
 0.187945
 0.212033
 0.200214
 0.201136
 0.203477];

sequence_ba_small_slim = [0.341519
0.363476
0.377136
0.387077
0.392275
0.395485
0.399488
0.401336
0.403970
0.402289];

figure('Name','BA small');
plot(iterations, sequence_ba_small_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_ba_small_slim, 'LineWidth', 1);
hold off;
xlabel('iteration');
ylabel('time [s]');
xlim([1 10]);
grid on;
title('(1001 SE3 & 8471 R3)v + (6013 SE3 & 19524 SE3\_R3)e');
legend('g2o','our');


sum_ba_big_g2o = sum(sequence_ba_small_g2o)
sum_ba_big_slim = sum(sequence_ba_small_slim)


%% Big BA
% 31796 vertices: 2001 SE3 and 29795 R3 | 117375 edges: 25327 SE3 and 92048 SE3_R3
sequence_ba_big_g2o = [ 0.913147
 0.847268
 0.888165
 0.952745
 1.00948
 0.913935
 0.937961
 0.938051
 0.943798
 0.947455];

sequence_ba_big_slim = [3.893155
3.936032
3.975537
3.961065
4.445926
4.625467
4.491072
4.235842
4.488388
4.302889];


figure('Name','BA big');
plot(iterations, sequence_ba_big_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_ba_big_slim, 'LineWidth', 1);
hold off;
xlabel('iteration');
ylabel('time [s]');
xlim([1 10]);
grid on;
title('(2001 SE3 & 29795 R3)v + (25327 SE3 & 92048 SE3\_R3)e');
legend('g2o','our');

sum_ba_big_g2o = sum(sequence_ba_big_g2o)
sum_ba_big_slim = sum(sequence_ba_big_slim)


%% All BA
figure('Name','All BA');
subplot(1,2,1);
plot(iterations, sequence_ba_small_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_ba_small_slim, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('time [s]');
grid on;
xlim([1 10]);
title('9472v + 25537e');

subplot(1,2,2);
plot(iterations, sequence_ba_big_g2o, 'LineWidth', 1);
hold on;
plot(iterations, sequence_ba_big_slim, 'LineWidth', 1);
hold off;
legend('g2o','our');
xlabel('iteration');
ylabel('time [s]');
grid on;
xlim([1 10]);
title('31796v + 117375e');



