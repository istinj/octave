clear; close; clc;
addpath('/home/istin/g2o_simulator_data/');
m = load('matrix_original.txt');
% m_reduced = load('matrix_reduced.txt');
% m_p_identity = load('matrix_identity_p.txt');
m_p_reversing = load('matrix_reversing_p.txt');
m_recon = load('matrix_reversing_reconstructed.txt');
% m_amd = load('matrix_amd_p.txt');
% m_recon = load('matrix_amd_reconstructed.txt');



% [r,c] = size(m);
% p_identity = zeros(r,1);
% 
% for i=1:r
%     p_identity(i) = i;
% end
% 
% p_reverse = flipud(p_identity);
% 
% if(isequal(m(p_identity,p_identity), m))
%     disp('Done identity');
% else
%     disp('Porco dio');
% end

% sol_m_p_reversing = m(p_reverse, p_reverse);
% if(isequal(sol_m_p_reversing, m_p_reversing))
%     disp('Done reverse');
% else
%     disp('Porco dio');
% end
% 
% if(isequal(m,m_reset))
%     disp('Done reset');
% else
%     disp('Porco dio');
% end

% if(isequal(m_recon, m))
%    disp('Done inverse amd');
% else
%     disp('Porco dio');
% end 

% 
% if(isequal(m_recon, m_reduced))
%    disp('Done inverse amd');
% else
%     disp('Porco dio');
% end 




