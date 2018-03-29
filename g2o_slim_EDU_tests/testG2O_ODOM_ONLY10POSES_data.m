clear;
H = load('cppH.txt');
A = zeros(66,66);

A(1:6,1:end) = H(1:66,1:end)';
A(1+6:6+6,1:end) = H(1+(66*1):66+(66*1),1:end)';
A(1+6+6:6+6+6,1:end) = H(1+(66*2):66+(66*2),1:end)';
A(1+6+6+6:6+6+6+6,1:end) = H(1+(66*3):66+(66*3),1:end)';


for j = 0:11-1
    A(1+j*6:6*(j+1),1:end) = H(1+(66*j):66+(66*j),1:end)';
end

B = load('cppB.txt');
U = chol(A);
L = U';
y = inv(L) * B;
x = inv(U) * y;