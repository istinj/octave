clc; clear;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');

num_poses = 10;
num_points = 2;

b = load('b_pl.txt');
dx = load('dx_pl.txt');
y = load('y.txt');
H = readSparseDBlockMatrix('H.txt');

U = chol(H);
L = U';

y_sol = fwdSub(L,b);
dx_sol = bwdSub(U,y_sol);

sol = H\b;
