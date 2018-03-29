clc;
clear;
close all;

n_land = 6;
n_pose = 3;

load('Hb_Schur.mat')
disp('Solution of linear system H dx = b');
dx_solution = -H_full\b_full

% setting up data
A = H_full(1:n_pose, 1:n_pose);
B = H_full(1:n_pose, n_pose+1:end);
C = H_full(n_pose+1:end, 1:n_pose);
if ~isequal(C, B')
    disp('cazzo');
end

D = H_full(n_pose+1:end, n_pose+1:end);

bp = b_full(1:n_pose,1);
bl = b_full(n_pose+1:end,1);

disp('Schur thing');
% computing schur stuff
H_schur = A - B*inv(D)*C;

% permutation of H_schur
permutation = zeros(n_pose,1);
k = 1;
for i = n_pose:-1:1
    permutation(k) = i;
    k = k+1;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end
inverse_permutation = zeros(n_pose,1);
for i = 1:n_pose
    inverse_permutation(permutation(i)) = i;
end

% Linear system for dxp
H_schur_p = H_schur(permutation, permutation);
U_schur = chol(H_schur_p);
L_schur = U_schur';

bp_schur = -bp + B*inv(D)*bl;
bp_schur_p = bp_schur(permutation);

y = fwdSub(L_schur, bp_schur_p);
dx_p_p = bwdSub(U_schur, y);
dx_p = dx_p_p(inverse_permutation)

% Linear system for dxl
bl_schur = -bl - C*dx_p;
dx_l = inv(D)*bl_schur

