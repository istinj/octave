clc; clear all;

%% REAL JACOBIAN
% Assuming to have direct T - X_world_robot
syms adx bdx gdx tdx tdy tdz px py pz real;

Rx = [1 0 0; 0 cos(adx) -sin(adx); 0 sin(adx) cos(adx)];
Ry = [cos(bdx) 0 sin(bdx); 0 1 0; -sin(bdx) 0 cos(bdx)];
Rz = [cos(gdx) -sin(gdx) 0; sin(gdx) cos(gdx) 0; 0 0 1];

pw = [px py pz]';
t = [tdx tdy tdz]';

Rdx = Rx *Ry * Rz;
Rdx_transposed = Rdx';

A = Rdx_transposed * pw + Rdx_transposed * t;
J = jacobian(A, [tdx tdy tdz adx bdx gdx]);

% In dx = 0;
J_0 = J;
J_0 = subs(J_0, adx, 0);
J_0 = subs(J_0, bdx, 0);
J_0 = subs(J_0, gdx, 0);
J_0 = subs(J_0, tdx, 0);
J_0 = subs(J_0, tdy, 0);
J_0 = subs(J_0, tdz, 0);
J_0