function [ out ] = exportMatrixAndSize( matrix, filename )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(filename,'wt');
rows = size(matrix,1);
cols = size(matrix,2);
fprintf(fid, '%d\t', rows);
fprintf(fid, '%d\t', cols);
fprintf(fid, '\n');
for i=1:rows
    for j=1:cols
        fprintf(fid, '%f\t', matrix(i,j));
        if mod(j,cols) == 0
            fprintf(fid, '\n');
        end
    end
end
end


