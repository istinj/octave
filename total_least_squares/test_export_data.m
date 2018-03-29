clear; clc;
source "./total_least_squares.m"
global K; % camera matrix
global image_rows;
global image_cols;

damping=0.0;
kernel_threshold=500;
num_iterations=30;
num_poses = 10;
num_landmarks = 10;

[Xr_true, Xr, Xl_true, Xl, Zl, Zp, Zr, land_associations, proj_associations, pose_associations] = importWorld();
tic;
toc;
Zp=zeros(3,0);
[XR, XL,chi_stats_l, num_inliers_l, chi_stats_p, num_inliers_p, chi_stats_r, num_inliers_r]=doTotalLS(Xr, Xl, 
												      Zl, land_associations, 
												      Zp, proj_associations, 
												      Zr, pose_associations, 
												      num_poses, 
												      num_landmarks, 
												      num_iterations, 
												      damping, 
												      kernel_threshold);
toc;