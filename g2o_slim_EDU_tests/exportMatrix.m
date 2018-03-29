function [] = exportMatrix( data, out_filename )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(out_filename ,'wt');

rows = size(data,1);
cols = size(data,2);
for i=1:rows
    for j=1:cols
        fprintf(fid, '%f\t', data(i,j));
        if mod(j,cols) == 0
            fprintf(fid, '\n');
        end
    end
end
end

