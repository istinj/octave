clear; clc; close all;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');

hpp = load('A.txt');
hpp = hpp.*20;
hpl = load('B.txt');
inv_hll = load('invD.txt');
hpl_invhll = load('B_invD.txt');

h_schur = load('schur.txt');
h_schur_compute = load('pocodio.txt');

prod = hpl * inv_hll * hpl'
schur_sol = hpp - prod;

figure('Name', 'Matlab'); imagesc(schur_sol);
figure('Name', 'Cpp'); imagesc(h_schur);
figure('Name', 'Cpp - compute'); imagesc(h_schur_compute);

figure('Name', 'Hessian');
subplot(2,2,1);
imagesc(hpp);
subplot(2,2,2);
imagesc(hpl);
subplot(2,2,3);
imagesc(inv_hll);
subplot(2,2,4);
imagesc(hpl_invhll);