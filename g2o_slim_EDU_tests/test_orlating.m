clear; close; clc;
addpath('/home/istin/g2o_simulator_data/');
m = load('matrix_original.txt');
m_reduced = load('matrix_reduced.txt');
m_reduced_2 = load('matrix_reduced_2.txt');


m0 = m(2:end,2:end);
if (m0 == m_reduced)
    disp ('ok v0');
else
    disp ('frocio');
end

m10_11 = m0(1:10,1:10);
m10_12 = m0(1:10,12:end);
m10_21 = m0(12:end,1:10);
m10_22 = m0(12:end,12:end);

m1 = horzcat(m10_11, m10_12);
m1 = vertcat(m1, horzcat(m10_21, m10_22));
if (m1 == m_reduced_2)
    disp ('ok v1');
else
    disp ('frocio ma ok');
end

m10_11 = m(2:10,2:10);
m10_12 = m(2:10,12:end);
m10_21 = m(12:end,2:10);
m10_22 = m(12:end,12:end);

m3 = horzcat(m10_11, m10_12);
m3 = vertcat(m3, horzcat(m10_21, m10_22));
if (m3 == m_reduced_2)
    disp ('ok v1');
else
    disp ('frocio');
end
