clc;clear;
dim = 1000;
A = rand(dim,dim);
A = A' * A;

tic;
L_standard = choleskyDec(A);
toc;

tic;
L_block = blockCholesky(A, 10);
toc;

disp('Sparse case');


dens = 0.2;
rc = 0.1;
A_sparse = sprandsym(dim, dens, rc, 1);
A_sp_full = full(A_sparse);


tic;
L_standard = choleskyDec(A_sp_full);
toc;

tic;
L_block = blockCholesky(A_sp_full, 10);
toc;