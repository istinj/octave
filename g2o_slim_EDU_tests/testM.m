clc;
clear;
% 
% hessian_dim = 36;
% 
% H_11 = rand(6,6);
% H_12 = rand(6,6);
% H_22 = rand(6,6);
% 
% H_11 = H_11'*H_11;
% H_12 = H_12'*H_12;
% H_21 = H_12';
% H_22 = H_22'*H_22;
% 
% container(1).indices = [0,0];
% container(1).data = H_11;
% 
% container(2).indices = [0,30];
% container(2).data = H_12;
% 
% container(3).indices = [30,0];
% container(3).data = H_21;
% 
% container(4).indices = [30,30];
% container(4).data = H_22;
% 
% total = zeros(36,36);
% total(1:6,1:6) = H_11;
% total(1:6,31:36) = H_12;
% total(31:36,1:6) = H_21;
% total(31:36,31:36) = H_22;


load('H.mat')
load('container.mat')
index = 1;

for j=1:size(containers(1).data,2)
    hessian_cont(j) = containers(10).data(j);
end
