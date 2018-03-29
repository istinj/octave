clc;clear; close all;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');
show = false;

pose_matrix_block = [  0.972024  -0.485804  -0.355208 -0.0598536  -0.390456  -0.121717
-0.485804    2.45084     0.8055  -0.716673   0.369144    1.43067
-0.355208     0.8055    2.21987  -0.983378   0.168461   0.313276
-0.0598536  -0.716673  -0.983378    2.43675    1.11378  -0.247122
-0.390456   0.369144   0.168461    1.11378    1.31088    0.74236
-0.121717    1.43067   0.313276  -0.247122    0.74236    1.42962];

mixed_matrix_block = [  0.780465  -0.959954   -0.52344    0.70184  -0.249586   0.335448
 -0.302214 -0.0845965   0.941268  -0.466669   0.520497  0.0632129
 -0.871657  -0.873808   0.804416  0.0795207  0.0250707  -0.921439];
mixed_zero_block = zeros(3,6);

point_matrix_block = [ 1.16818 0.850563 0.139028
0.850563  1.55072 0.176175
0.139028 0.176175   1.1709];

A = [pose_matrix_block.*2.0, pose_matrix_block, pose_matrix_block;
    pose_matrix_block,pose_matrix_block.*2.0,pose_matrix_block;
    pose_matrix_block,pose_matrix_block,pose_matrix_block.*2.0];

C = [mixed_matrix_block, mixed_zero_block, mixed_zero_block;
    mixed_zero_block, mixed_matrix_block, mixed_zero_block;
    mixed_zero_block, mixed_zero_block, mixed_matrix_block;
    mixed_zero_block, mixed_zero_block, mixed_matrix_block;
    mixed_zero_block, mixed_zero_block, mixed_matrix_block;
    mixed_zero_block, mixed_zero_block, mixed_matrix_block];

B = C';

invD = [point_matrix_block, zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,3);
    zeros(3,3), point_matrix_block, zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,3);
    zeros(3,3), zeros(3,3), point_matrix_block, zeros(3,3), zeros(3,3), zeros(3,3);
    zeros(3,3), zeros(3,3), zeros(3,3), point_matrix_block, zeros(3,3), zeros(3,3);
    zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,3), point_matrix_block, zeros(3,3);
    zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,3), point_matrix_block];

% A, B, C, invD, bp, bl are the same of the cpp

bp = load('bp_test_geometry.txt');
bl = load('bl_test_geometry.txt');

disp('real solution')
x = A\bp % the same of the pose only solution


disp('schur solution')
H_schur = A - B*invD*C;
bp_schur = -bp + B*invD*bl;
x_schur = H_schur\bp_schur


if show
    figure('Name','Hessian');
    subplot(2,2,1);
    imagesc(A);
    title('A');
    
    subplot(2,2,2);
    imagesc(B);
    title('B');
    
    subplot(2,2,3);
    imagesc(C);
    title('C');
    
    subplot(2,2,4);
    imagesc(invD);
    title('invD');
    
    figure('Name', 'H_schur');
    imagesc(H_schur);
end




