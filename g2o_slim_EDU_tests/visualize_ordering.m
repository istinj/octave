clear; close all;
addpath('/home/istin/g2o_simulator_data/');
h_plain_full = load('h_PLAIN_full.txt');
h_plain_reduced = load('h_PLAIN_reduced.txt');
% h_plain_CS = load('h_PLAIN_CSFORMAT.txt');
h_amd = load('h_AMD.txt');
ch_l_amd = load('chol_lower_AMD.txt');
ch_u_amd = load('chol_upper_AMD.txt');

perm = amd(h_plain_full);
m_amd = h_plain_full(perm, perm);

figure('Name','PLAIN FULL')
imshow(h_plain_full)

figure('Name','PLAIN REDUCED')
imshow(h_plain_reduced)

% figure('Name','PLAIN CS')
% imshow(h_plain_CS)

figure('Name','AMD')
imshow(h_amd)
 
figure('Name','chol_AMD LOWER')
imshow(ch_l_amd)

figure('Name','chol_AMD UPPER')
imshow(ch_u_amd)

% figure('Name','Decomposition process');
% subplot(1,4,1), imshow(h_plain_full);
% subplot(1,4,2), imshow(h_plain_reduced);
% subplot(1,4,3), imshow(h_amd);
% subplot(1,4,4), imshow(ch_l_amd);

% figure('Name','Matlab AMD')
% imshow(m_amd);
