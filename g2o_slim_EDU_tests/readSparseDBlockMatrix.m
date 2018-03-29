function [M, M_cell] = readSparseDBlockMatrix(filename_)

fid = fopen(filename_);
tline = fgetl(fid);

dimensions = strread(tline);
num_rows = dimensions(1);
num_cols = dimensions(2);
num_poses = dimensions(3);
num_points = dimensions(4);

M_cell = {};
for r = 1:num_rows
    for c = 1:num_cols
        if r > num_poses
            if c > num_poses
                a = 3;
                b = 3;
            else
                a = 3;
                b = 6;
            end
        else
            if c > num_poses
                a = 6;
                b = 3;
            else
                a = 6;
                b = 6;
            end
        end
        M_cell{r,c} = zeros(a,b);
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
        if r > num_poses
            if c > num_poses
                i = num_poses*6 + (r-num_poses-1)*block_size(1);
                j = num_poses*6 + (c-num_poses-1)*block_size(2);
            else
                i = num_poses*6 + (r-num_poses-1)*block_size(1);
                j = (c-1)*block_size(2);
            end
        else
            if c > num_poses
                i = (r-1)*block_size(1);
                j = num_poses*6 + (c-num_poses-1)*block_size(2);
                
            else
                i = (r-1)*block_size(1);
                j = (c-1)*block_size(2);
            end
        end
        

        M(i+1:i+1+block_size(1)-1,j+1:j+1+block_size(2) - 1) = M_cell{r,c};

    end
end


end