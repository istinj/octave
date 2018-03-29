clear;
addpath('/home/istin/workspaces/g2o_slim_edu/devel/lib/g2o_slim_edu');

Hpp = load('Hpp.txt');
Hll_inv = load('Hll_inv.txt');
Hlp = load('Hlp.txt');

Hlp_transp = load('Hlp_transposed.txt');
H_schur = load('H_schur.txt');

figure('Name', 'Hpp');
imshow(Hpp);

figure('Name', 'Hlp');
imshow(Hlp);

figure('Name', 'Hll^-1');
imshow(Hll_inv);

figure('Name', 'Hlp_tranp');
imshow(Hlp_transp);

figure('Name', 'H_schur');
imshow(H_schur);


% Matlab stuff
schur_mult_sol = Hlp_transp*Hll_inv*Hlp;
Hpp_mod = Hpp.*100;
H_schur_pattern_sol = Hpp_mod - schur_mult_sol;
H_schur_pattern_sol=setOnes(H_schur_pattern_sol);
schur_mult_sol=setOnes(schur_mult_sol);
figure('Name', 'SCHUR PATTERN');
imshow(H_schur_pattern_sol);



