clear; clc;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');

B_invD = zeros(30,15);
bd_1 = [12 12 12
        12 12 12
        12 12 12
        12 12 12
        12 12 12
        12 12 12];
bd_2 = [30 30 30
        30 30 30
        30 30 30
        30 30 30
        30 30 30
        30 30 30];
bd_3 = [45 45 45
        45 45 45
        45 45 45
        45 45 45
        45 45 45
        45 45 45];
B_invD(13:18,10:12) = bd_1;
B_invD(13:18,13:end) = bd_2;
B_invD(19:24,13:end) = bd_3;

C = zeros(15,30);
c_43 = [1 1 1 1 1 1;1 1 1 1 1 1;1 1 1 1 1 1];
c_53 = [2 2 2 2 2 2;2 2 2 2 2 2;2 2 2 2 2 2];
c_54 = [3 3 3 3 3 3;3 3 3 3 3 3;3 3 3 3 3 3];
C(10:12,13:18) = c_43;
C(13:15,13:18) = c_53;
C(13:15,19:24) = c_54;



bp = load('bp.txt');
bl = load('bl.txt');
bp_schur = bp - B_invD * bl


dxp = load('dxp.txt');
bl_schur = bl + C * dxp
