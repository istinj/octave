clc; clear; close all;

%% SIMPLE JACOBIAN
% Assuming to have Xrobot_world
syms alpha beta gamma tx ty tz px py pz real;

Rx = [1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)];
Ry = [cos(beta) 0 sin(beta); 0 1 0; -sin(beta) 0 cos(beta)];
Rz = [cos(gamma) -sin(gamma) 0; sin(gamma) cos(gamma) 0; 0 0 1];
p = [px py pz]';
t = [tx ty tz]';

R = Rx * Ry * Rz;
A = R * p + t;

J = jacobian(A, [tx ty tz alpha beta gamma]);

J_0 = J;
J_0 = subs(J_0, alpha, 0);
J_0 = subs(J_0, beta, 0);
J_0 = subs(J_0, gamma, 0);
J_0 = subs(J_0, tx, 0);
J_0 = subs(J_0, ty, 0);
J_0 = subs(J_0, tz, 0);
J_0



