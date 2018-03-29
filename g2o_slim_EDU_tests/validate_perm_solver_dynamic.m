clc; clear all; 
load('Hb_Schur.mat')
load('v.txt');
u = chol(H_full);
l = u';

sol = H_full\v;

disp('plain')
y = fwdSub(l,v)
x = bwdSub(u,y)

disp('permutation')
p = zeros(size(H_full,1),1);
for i = 1:size(H_full,1)
    p(i) = i;
end
p = flipud(p);

inv_p = zeros(length(p),1);
for i = 1:length(p)
    inv_p(p(i)) = i;
end

H_p = H_full(p,p);
u_p = chol(H_p);
l_p = u_p';
v_p = v(p);
y_p = fwdSub(l_p,v_p);
x_p = bwdSub(u_p,y_p);
y_1 = y_p(inv_p)
x_1 = x_p(inv_p)