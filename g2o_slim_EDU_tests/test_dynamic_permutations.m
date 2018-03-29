clc; clear; close all;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');

A = [1:5;6:10;11:15;16:20;21:25]
rows = [6,6,2,3,4];
cols = [6,6,2,3,4];

p = 5:-1:1;
A_p = A(p,p)
A_pp = zeros(5,5);

for i=1:size(A,1)
    for j=1:size(A,2)
        A_pp(i,j) = A(p(i),p(j));
    end
end
isequal(A_p, A_pp)

rows_p = rows(p)
cols_p = cols(p)

amd = [0 2 3 11 9 8 7 6 5 4 1 10];
amd = amd + 1;

[~,H_block] = readSparseDBlockMatrix('H_.txt');

for i=1:size(H_block,1)
    for j=1:size(H_block,2)
        H_amd{i,j} = H_block{amd(i),amd(j)};
    end
end
