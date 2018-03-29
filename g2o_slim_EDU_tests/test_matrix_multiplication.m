clc; clear;
A = rand(6,6);
C = rand(3,6);
D = diag([1,2,3]);
D = D'*D;

real_mult = C'*inv(D)*C
H_schur = A-real_mult

U = chol(inv(D));
L = U';
mult = C'*L
mult_total = mult*mult'
H_schur_mod = A-mult_total

for r = 1:size(mult,1)
    for c = 1:size(mult,1)
        result = dot(mult(r,:),mult(c,:))
    end
end



