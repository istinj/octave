clc;
close all;
clear;


iterations_normal = -1;
iterations_chordal = -1;

base_path = '/home/istin/Documents/octave/2018_paper_iros_extended';
addpath(base_path);
% relative_path = '/home/istin/datasets/g2o_data/gauss_newton/initial_guess';
% relative_path = '/home/istin/datasets/g2o_data/gauss_newton/initial_guess_spanning';
% relative_path = '/home/istin/datasets/g2o_data/gauss_newton/zero_guess';
% relative_path = '/home/istin/datasets/g2o_data/gauss_newton_kernel/initial_guess';
% relative_path = '/home/istin/datasets/g2o_data/gauss_newton_kernel/initial_guess_spanning';
% relative_path = '/home/istin/datasets/g2o_data/gauss_newton_kernel/zero_guess';
% relative_path = '/home/istin/datasets/g2o_data/levenberg_marquardt_kernel/initial_guess';
% relative_path = '/home/istin/datasets/g2o_data/levenberg_marquardt_kernel/initial_guess_spanning';
relative_path = '/home/istin/datasets/g2o_data/levenberg_marquardt_kernel/zero_guess';

S = {};

main_dir = dir(relative_path);
main_dir = main_dir(3:end);
num_folders = size(main_dir,1);

for dir_idx=1:num_folders
    current_dir = main_dir(dir_idx);
    current_dir_path = fullfile(current_dir.folder, current_dir.name);
    
    cd(current_dir_path);
    files = dir('*.txt');
    
    num_files = size(files,1);
    for file_idx=1:num_files
        current_file = files(file_idx);
        current_file_path = fullfile(current_file.folder,current_file.name);
        vector = readG2OStats(current_file_path);
        S{dir_idx,file_idx} = vector;
    end
    
    figure_names{dir_idx} = current_dir.name;
    chi2_normal = S{dir_idx,1};
    chi2_chordal = S{dir_idx,2};
    fig = figure('Name',current_dir.name);
    size_normal = size(chi2_normal,2);
    size_chordal = size(chi2_chordal,2);
    
    % better plots
    iterations = -1;
    min_value = -1;
    max_value = -1;
    
    if size_normal == size_chordal
        iterations = 1:size(chi2_normal,2);
    end
    
    if size_normal < size_chordal
        disp("warning, normal_it < chordal_it");
        min_value = size_normal;
        max_value = size_chordal;
        
        iterations = 1:max_value;
        chi2_normal(size_normal+1:max_value) = chi2_normal(size_normal);
    elseif size_normal > size_chordal
        disp("warning, normal_it > chordal_it");
        min_value = size_chordal;
        max_value = size_normal;
        
        iterations = 1:max_value;
        chi2_chordal(size_chordal+1:max_value) = chi2_chordal(size_chordal);
    end
    
    semilogy(iterations, chi2_normal, 'LineWidth', 1);
    hold on;
    semilogy(iterations, chi2_chordal, 'LineWidth', 1);
    legend('standard','chordal');
    xlabel('iteration');
    ylabel('chi2');
    grid on;
    axis tight;
    
    % saving matlab plot figure
    save_path = fullfile(current_dir.folder, current_dir.name, 'fig');
    print(fig,save_path,'-dpng');
    
    % export data on gnuplot friendly datafile
    datafile = [iterations',chi2_normal', chi2_chordal'];
    save_path = fullfile(current_dir.folder, current_dir.name, 'gnuplot_data.dat');
    save(save_path,'datafile','-ASCII');
end

cd(base_path);

% ------------------------------------------------------------------------%
% ------------------------------ SOME SHIT -------------------------------%
% ------------------------------------------------------------------------%

% relative_path = '/home/istin/source/libraries/g2o/bin/outputs/normal';
% relative_path = '/home/istin/source/libraries/g2o/bin/outputs/normal_lm_kernel';
% relative_path = '/home/istin/source/libraries/g2o/bin/outputs/zero_ig';
% relative_path = '/home/istin/source/libraries/g2o/bin/outputs/zero_ig_lm';
% relative_path = '/home/istin/source/libraries/g2o/bin/outputs/zero_ig_lm_kernel';
% relative_path = '/home/istin/source/libraries/g2o/bin/test_info_remap';

% figure('Name',figure_names{1});
% semilogy(l, normal_sphere_chi2, 'LineWidth', 1);
% hold on;
% semilogy(l, chordal_sphere_chi2_MOD, 'LineWidth', 1);
% hold off;
% legend('normal','chordal');
% xlabel('iteration');
% ylabel('chi2');
% grid on;
% axis tight;