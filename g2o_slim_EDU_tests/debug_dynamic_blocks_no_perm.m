clc; clear; close all;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');

H = readSparseDBlockMatrix('H.txt');
% L = readSparseDBlockMatrix('L.txt');
b = load('b_pl.txt');
dx = load('dx_pl.txt');
% y = load('y.txt');

U_sol = chol(H);
L_sol = U_sol';

y_sol = fwdSub(L_sol,b);
dx_sol = bwdSub(U_sol,y_sol);

sol = H\b;
