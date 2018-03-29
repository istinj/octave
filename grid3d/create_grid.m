clc;
clear all;
close all;

width = 3;
height = 3;
depth = 3;
step = 0.5;

% vertex container
vertex = zeros(1,3);
vertices = zeros(1,3);

disp('create vertices');
for x = 1:step:width
  for y = 1:step:height
    for z = 1:step:depth
      vertex = [x,y,z];
      vertices = vertcat(vertices, vertex);
%      v_idx = v_idx + 1;
    end
  end
end
vertices = vertices(2:end,:);
disp('done');
figure('Name','GRID3D');
scatter3(vertices(:,1), vertices(:,2), vertices(:,3));

num_vertices = size(vertices,1);

