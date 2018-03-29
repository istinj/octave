% New version, works with permutations
function [M, M_cell] = loadSparseDBlockMatrix(filename_)

fid = fopen(filename_);
tline = fgetl(fid);

% first line: matrix general info
dimensions = strread(tline);
num_rows = dimensions(1);
num_cols = dimensions(2);
num_poses = dimensions(3);
num_points = dimensions(4);

% second line: matrix row pattern
tline = fgetl(fid);
row_pattern = strread(tline);
row_pattern = row_pattern(1:end-1);

% third line: matrix col pattern
tline = fgetl(fid);
col_pattern = strread(tline);
col_pattern = col_pattern(1:end-1);

M_cell = {};
for r = 1:num_rows
    for c = 1:num_cols
        M_cell{r,c} = zeros(row_pattern(r),col_pattern(c));
    end
end

tline = fgetl(fid);
while ischar(tline)
    
    line_cell = textscan(tline, '%f');
    line_array = line_cell{1,1};
    %     line_array = strread(tline);
    row = line_array(1);
    col = line_array(2);
    block_rows = line_array(3);
    block_cols = line_array(4);
    
    block = line_array(5:end);
    block = reshape(block,[block_cols block_rows]).';
    
    M_cell{row,col} = block;
    tline = fgetl(fid);
end

fclose(fid);


total_dim = num_poses * 6 + num_points *3;
M = zeros(total_dim, total_dim);

for r = 1:size(M_cell,1)
    for c = 1:size(M_cell,2)
        block_size = size(M_cell{r,c});
        
        if (r == 1)
            start_index_row = 1;
            end_index_row = 1 + block_size(1) - 1;
        else
            start_index_row = sum(row_pattern(1:r-1)) + 1;
            end_index_row = start_index_row + block_size(1) - 1;
        end
        
        if (c == 1)
            start_index_col = 1;
            end_index_col = 1 + block_size(2) - 1;
        else
            start_index_col = sum(col_pattern(1:c-1)) + 1;
            end_index_col = start_index_col + block_size(2) - 1;
        end
        
        M(start_index_row:end_index_row, start_index_col:end_index_col) = M_cell{r,c};
        
    end
end


end