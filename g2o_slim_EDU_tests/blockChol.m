clc; clear;

dim = 1000;
dens = 0.1;
rc = 0.6;
kind = 1;

sparse_matrix = sprandsym(dim, dens, rc, kind);
full_sparse = full(sparse_matrix);

tic;
L = chol(full_sparse);
toc;

block_dimension = 10;

A_11 = full_sparse(1:block_dimension,1:block_dimension);
A_12 = full_sparse(1:block_dimension,block_dimension + 1:end);
A_22 = full_sparse(block_dimension + 1:end, block_dimension + 1:end);

