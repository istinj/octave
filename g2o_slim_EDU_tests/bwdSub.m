function result = bwdSub( matrix, rhs_vector )

problem_dim = size(matrix,1);
result = zeros(problem_dim, 1);

for r = problem_dim:-1:1
    res_element = rhs_vector(r);
    for c = r+1:problem_dim
        res_element = res_element - matrix(r,c) * result(c);
    end
    res_element = (1./matrix(r,r)) * res_element;
    result(r) = res_element;
end


end

