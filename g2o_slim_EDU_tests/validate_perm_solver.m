clc; close all; clear;

file = load('spm10.mat');
m = file.a;
b = rand(10,1);

% file = load('sparse1000by1000.mat');
% m = file.A_sp_full;
% b = rand(1000,1);


% PLAIN
disp('Plain');
u = chol(m);
l = u';

y = fwdSub(l,b)
x = bwdSub(u,y)


% PERMUTATION
disp('Permutation');

p = amd(m);
% p = zeros(size(b,1),1);
% for i=1:size(b,1)
%     p(i) = i;
% end
% p(1) = size(p,1);
% p(end) = 1;

P = computePermMat(p);

m_perm = m(p,p);
b_perm = b(p);

u_perm = chol(m_perm);
l_perm = u_perm';

y_perm = fwdSub(l_perm, b_perm);
x_perm = bwdSub(u_perm, y_perm);

inv_p = computeInversePerm(p);
y_1 = y_perm(inv_p)
x_1 = x_perm(inv_p)


% Test
% disp('Test');
l_prime = P*l;
u_prime = u*P';
y_prime = inv(l_prime) * b_perm;
x_prime = inv(u_prime) * y_prime;
x_2 = x_prime(inv_p);

