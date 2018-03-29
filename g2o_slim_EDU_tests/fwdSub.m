function result = fwdSub( matrix, rhs_vector )

problem_dim = size(matrix,1);
result = zeros(problem_dim, 1);

for r = 1:size(matrix,1)
    res_element = rhs_vector(r);
    for c = 1:r
        res_element = res_element - matrix(r,c) * result(c);
    end
    res_element = (1./matrix(r,r)) * res_element;
    result(r) = res_element;
end

end

