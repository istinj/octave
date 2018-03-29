clc; close all; clear;
addpath('/home/istin/datasets/g2o_data/paper');

% v = readG2OStats('garage_initial_guess_stats_GN.txt');
% v = readG2OStats('sim-5000p_spanning_stats_GN.txt');
v = readG2OStats('sphere_noise_stats_GN_K.txt');
iterations = 0:size(v,2)-1;
datafile = [iterations',v'];
% save_path = '/home/istin/datasets/g2o_data/paper/garage_initial_guess_stats_GN_gnuplot_data.dat';
% save_path = '/home/istin/datasets/g2o_data/paper/sim-5000p_spanning_stats_GN_gnuplot_data.dat';
save_path = '/home/istin/datasets/g2o_data/paper/sphere_noise_stats_GN_K_gnuplot_data.dat';
save(save_path,'datafile','-ASCII');