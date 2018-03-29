clc;
clear all;
close all;

radius = 1.0;
num_points = 1000;
max_angle=pi;
min_angle=0;
step = (pi)/num_points;

k = 1;
for i = min_angle:step:max_angle
  x = radius*cos(i);
  y = radius*sin(i);
  circle(k,:) = [x,y];
  
  range = sqrt(x*x+y*y);
  range_vector(k,:) = range;
  k = k+1;
end

figure(1);
scatter(circle(:,1), circle(:,2));
