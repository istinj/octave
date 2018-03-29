clear; close;

load('spm10.mat');
p = amd(a);

perm_mat = zeros(length(p),length(p));
for i=1:length(p)
    perm_mat(i,p(i)) = 1;
end

sol = a(p,p);
test = perm_mat * a * perm_mat';
if(isequal(sol,test))
    disp('Done');
else
    disp('Porco dio');
end


pt_sol(p) = 1:length(p);
pt = zeros(1,length(p));
for i = 1:length(p)
    pt(p(i)) = i;
end

if(isequal(pt_sol, pt))
    disp('Done');
else
    disp('Porco dio');
end


