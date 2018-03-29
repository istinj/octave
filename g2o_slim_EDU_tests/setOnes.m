function normalized_matrix = setOnes( matrix )
normalized_matrix = matrix;
[r,c] = size(matrix);
for i = 1:r
    for j =1:c
        if normalized_matrix(i,j)==0
            continue;
        else
            normalized_matrix(i,j) = 1;
        end
    end
end

end

