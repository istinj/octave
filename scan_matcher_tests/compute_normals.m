clc;
clear all;
close all;

neighbours = 2;
radius = 5.0;

alpha_resolution = 100; % longitude
alpha_step = 2*pi/alpha_resolution;

beta_resolution = 100; % latitude
beta_step = pi/beta_resolution;

% generate points
S = zeros(alpha_resolution, beta_resolution,3);
k = 1;
for i = 0:alpha_resolution
  alpha = i*alpha_step;
  for j = 0:beta_resolution
    beta = j*beta_step;
    x = radius * cos(alpha) * sin(beta);
    y = radius * cos(beta);
    z = radius * sin(alpha) * sin(beta);
    points(k,:) = [x,y,z];
    S(i+1,j+1,1) = x;
    S(i+1,j+1,2) = y;
    S(i+1,j+1,3) = z;
    k = k+1;
  end
end

num_points = size(points,1);

figure(1);
axis equal
%scatter3(points(:,1), points(:,2), points(:,3), 2, 'filled');
surf(S(:,:,1), S(:,:,2), S(:,:,3));
hold on;

% compute the normals
normals = zeros(num_points,3);

for p_idx = 1:num_points
  p = points(p_idx,:);
  
  % collect points in a neighbouhood of the current points
  min_index = 1;
  max_index = num_points;
  if i-neighbours>=1
    min_index = i-neighbours;
  end
  
  if i+neighbours < num_points
    max_index = i+neighbours;
  end
  
  scale = 1./ (max_index - min_index);
  
  % mean and covariance
  mu = zeros(1,3);
  sigma = zeros(3,3);
  for acc_idx = min_index:max_index
    mu = mu + points(acc_idx,:);
    sigma = sigma + points(acc_idx,:)*points(acc_idx,:)';
  end
  
  mu = scale * mu;
  sigma = scale * sigma;
  
  % take the eigenvector corresponding to the lead eigenvalue
  [V,D] = eig(sigma);
  
  [~, max_eigenv_idx] = max(diag(D));
  normal = V(:, max_eigenv_idx);
  
  if (dot(p,normal))
    normal = -normal;
  end
  
  normals(p_idx,:) = normal;
  
end

quiver3(points(:,1), points(:,2), points(:,3), normals(:,1), normals(:,2), normals(:,3), 0.7, 'Color', [0.1,0.7,0.15]);
hold off;