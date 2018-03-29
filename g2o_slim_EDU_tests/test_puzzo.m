% a = [  1    0    0    0    0    0
%     0    1    0    0    0    0
%     0    0    1    0    0    0
%     0    0    0 2000    0    0
%     0    0    0    0 2000    0
%      0    0    0    0    0 2000];
% a = rand(6,6);
% a = a' * a;
% b = -a;
% 
% A = zeros(18,18);
% A(1:6,1:6) = a;
% A(1:6,7:12) = b;
% A(7:12,1:6) = b';
% A(7:12,7:12) = a;
% A(7:12,13:end) = b;
% A(13:end,7:12) = b';
% A(13:end,13:end) = a;



load('container.mat');
dim = 6;
A = zeros(30,30);

A(1:dim,1:dim) = containers(1).data(1).data;
A(1:dim,7:7-1+dim) = containers(1).data(2).data;
A(7:7-1+dim,1:dim) = containers(1).data(3).data;

A(7:7-1+dim,7:7-1+dim) = containers(1).data(4).data;
A(1:dim,7:7-1+dim) = containers(1).data(5).data;
A(7:7-1+dim,1:dim) = containers(1).data(6).data;