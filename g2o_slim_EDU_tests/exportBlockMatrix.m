function [  ] = exportBlockMatrix( src_matrix, block_rows, block_cols, filename )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(filename ,'wt');
% % fprintf(fid,'# num_block_rows num_block_cols\n');

rows = size(src_matrix,1);
cols = size(src_matrix,2);

block_matrix_dim = [rows/block_rows, cols/block_cols];
fprintf(fid, '%d\t%d\n', block_matrix_dim(1), block_matrix_dim(2));

if (mod(rows, block_rows) ~= 0 || mod(cols, block_cols) ~= 0)
    disp('wrong block size');
    return
end

block_size = [block_rows, block_cols];
init_row_idx = 0;
end_row_idx = 0;
init_col_idx = 0;
end_col_idx = 0;
% fprintf(fid,'# block_row block_col block_size.rows block_size.cols row_major_matrix_data\n');
for row_idx=1:block_matrix_dim(1)
    init_row_idx = (row_idx-1) * block_size(1) + 1;
    end_row_idx = init_row_idx + block_size(1) - 1;
    for col_idx=1:block_matrix_dim(2)
        init_col_idx = (col_idx-1) * block_size(2) + 1;
        end_col_idx = init_col_idx + block_size(2) - 1;
        m = 0;
        for rr = init_row_idx:end_row_idx
            for cc = init_col_idx:end_col_idx
                m = m + src_matrix(rr,cc);
            end
        end
        if (m ~= 0)
            fprintf(fid,'%d\t%d\t%d\t%d\t',row_idx-1, col_idx-1,block_size(1),block_size(2));
            for rr = init_row_idx:end_row_idx
                for cc = init_col_idx:end_col_idx
                    fprintf(fid, '%f\t', src_matrix(rr,cc));
                end
            end
            fprintf(fid,'\n');
        end
    end
end
fclose(fid);
end

