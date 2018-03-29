source "./geometry_helpers.m"
source "./total_least_squares_indices.m"

# error and jacobian of a measured pose
# input:
#   Xi: the observing robot pose (4x4 homogeneous matrix)
#   Xj: the observed robot pose (4x4 homogeneous matrix)
#   Z:   the relative transform measured between Xr1 and Xr2
#   e: 12x1 is the difference between prediction, and measurement, vectorized
#   Ji : 12x6 derivative w.r.t a the error and a perturbation of the
#       first pose
#   Jj : 12x6 derivative w.r.t a the error and a perturbation of the
#       second pose
function [e]=computeError(Xi,Xj,Z)
  Ri=Xi(1:3,1:3);
  Rj=Xj(1:3,1:3);
  ti=Xi(1:3,4);
  tj=Xj(1:3,4);
  tij=tj-ti;
  Ri_transpose=Ri';
  
  Z_hat=eye(4);
  Z_hat(1:3,1:3)=Ri_transpose*Rj;
  Z_hat(1:3,4)=Ri_transpose*tij;
  
  inv_Z_hat = eye(4,4);
  inv_Z_hat(1:3,1:3) = transpose(Z_hat(1:3,1:3));
  inv_Z_hat(1:3,4) = transpose(Z_hat(1:3,1:3)) * Z_hat(1:3,4);
  e = t2v(inv_Z_hat * Z);
endfunction

function [e,Ji,Jj]=poseErrorAndJacobian(Xi,Xj,Z)
%  global Rx0;
%  global Ry0;
%  global Rz0;
%  Ri=Xi(1:3,1:3);
%  Rj=Xj(1:3,1:3);
%  ti=Xi(1:3,4);
%  tj=Xj(1:3,4);
%  tij=tj-ti;
%  Ri_transpose=Ri';
%  Ji=zeros(12,6);
%  Jj=zeros(12,6);
%  
%  dR_dax=Ri_transpose*Rx0*Rj;
%  dR_day=Ri_transpose*Ry0*Rj;
%  dR_daz=Ri_transpose*Rz0*Rj;
%  
%  Jj(1:9,4)=reshape(dR_dax, 9, 1);
%  Jj(1:9,5)=reshape(dR_day, 9, 1);
%  Jj(1:9,6)=reshape(dR_daz, 9, 1);
%  Jj(10:12,1:3)=Ri_transpose;
%  
%  Jj(10:12,4:6)=-Ri_transpose*skew(tj);
%  Ji=-Jj;
%
%  Z_hat=eye(4);
%  Z_hat(1:3,1:3)=Ri_transpose*Rj;
%  Z_hat(1:3,4)=Ri_transpose*tij;
%  e=flattenIsometryByColumns(Z_hat-Z);
%  
  % normal error and jacobian
  e = computeError(Xi,Xj,Z);
  
  Ji = zeros(6,6);
  Jj = zeros(6,6);
  epsilon = 1e-5;
  for i = 1:6
    deltaX_plus = zeros(6,1);
    deltaX_minus = zeros(6,1);
    deltaX_plus(i,1) = epsilon;
    deltaX_minus(i,1) = -epsilon;
    Xi_plus = v2t(deltaX_plus) * Xi;
    Xi_minus = v2t(deltaX_minus) * Xi;
    
    e_temp_plus = computeError(Xi_plus, Xj, Z);
    e_temp_minus = computeError(Xi_minus, Xj, Z);
    Ji(:,i) = e_temp_plus - e_temp_minus;
  endfor
 
  for i = 1:6
    deltaX_plus = zeros(6,1);
    deltaX_minus = zeros(6,1);
    deltaX_plus(i,1) = epsilon;
    deltaX_minus(i,1) = -epsilon;
    Xj_plus = v2t(deltaX_plus) * Xj;
    Xj_minus = v2t(deltaX_minus) * Xj;
    
    e_temp_plus = computeError(Xi, Xj_plus, Z);
    e_temp_minus = computeError(Xi, Xj_minus, Z);
    Jj(:,i) = e_temp_plus - e_temp_minus;
  endfor
  Ji = Ji / 2*epsilon;
  Jj = Jj / 2*epsilon;

  e
  Ji
  Jj 
 endfunction;

#linearizes the robot-robot measurements
# inputs:
#   XR: the initial robot poses (4x4xnum_poses: array of homogeneous matrices)
#   XL: the initial landmark estimates (3xnum_landmarks matrix of landmarks)
#   ZR: the robot_robot measuremenrs (4x4xnum_measurements: array of homogeneous matrices)
#   associations: 2xnum_measurements. 
#                 associations(:,k)=[i_idx, j_idx]' means the kth measurement
#                 refers to an observation made from pose i_idx, that
#                 observed the pose j_idx
#   num_poses: number of poses in XR (added for consistency)
#   num_landmarks: number of landmarks in XL (added for consistency)
#   kernel_threshod: robust kernel threshold
# outputs:
#   H: the H matrix, filled
#   b: the b vector, filled
#   chi_tot: the total chi2 of the current round
#   num_inliers: number of measurements whose error is below kernel_threshold

function [H,b, chi_tot, num_inliers, container]=linearizePoses(XR, XL, Zr, associations,num_poses, num_landmarks, kernel_threshold)
  global pose_dim;
  global landmark_dim;
  system_size=pose_dim*num_poses+landmark_dim*num_landmarks; 
  H=zeros(system_size, system_size);
  b=zeros(system_size,1);
  chi_tot=0;
  num_inliers=0;
  index = 1;
  for (measurement_num=1:size(Zr,3))
    Omega=eye(6);
    Omega(4:end,4:end)*=1e3; # we need to pimp the rotation  part a little
    pose_i_index=associations(1,measurement_num);
    pose_j_index=associations(2,measurement_num);
    Z=Zr(:,:,measurement_num);
    Xi=XR(:,:,pose_i_index);
    Xj=XR(:,:,pose_j_index);
%    disp('cazzo3');
    [e,Ji,Jj] = poseErrorAndJacobian(Xi, Xj, Z);
    chi=e'*Omega*e;
    if (chi>kernel_threshold)
      Omega*=sqrt(kernel_threshold/chi);
      chi=kernel_threshold;
    else
      num_inliers ++;
    endif;
    chi_tot+=chi;

    pose_i_matrix_index=poseMatrixIndex(pose_i_index, num_poses, num_landmarks);
    pose_j_matrix_index=poseMatrixIndex(pose_j_index, num_poses, num_landmarks);
    
    H(pose_i_matrix_index:pose_i_matrix_index+pose_dim-1,
      pose_i_matrix_index:pose_i_matrix_index+pose_dim-1)+=Ji'*Omega*Ji;

    H(pose_i_matrix_index:pose_i_matrix_index+pose_dim-1,
      pose_j_matrix_index:pose_j_matrix_index+pose_dim-1)+=Ji'*Omega*Jj;

    H(pose_j_matrix_index:pose_j_matrix_index+pose_dim-1,
      pose_i_matrix_index:pose_i_matrix_index+pose_dim-1)+=Jj'*Omega*Ji;

    H(pose_j_matrix_index:pose_j_matrix_index+pose_dim-1,
      pose_j_matrix_index:pose_j_matrix_index+pose_dim-1)+=Jj'*Omega*Jj;
      
    container(index).indices = [pose_i_matrix_index pose_i_matrix_index];
    container(index).data = Ji'*Omega*Ji;
    
    container(index+1).indices = [pose_i_matrix_index pose_j_matrix_index];
    container(index+1).data = Ji'*Omega*Jj;

    container(index+2).indices = [pose_j_matrix_index pose_i_matrix_index];
    container(index+2).data = Jj'*Omega*Ji;

    container(index+3).indices = [pose_j_matrix_index pose_j_matrix_index];
    container(index+3).data = Jj'*Omega*Jj;
    
    index = index + 4;

    b(pose_i_matrix_index:pose_i_matrix_index+pose_dim-1)+=Ji'*Omega*e;
    b(pose_j_matrix_index:pose_j_matrix_index+pose_dim-1)+=Jj'*Omega*e;
  endfor
endfunction
