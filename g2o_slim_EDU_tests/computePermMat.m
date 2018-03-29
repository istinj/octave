function perm_mat = computePermMat( perm_vector )
perm_mat = zeros(length(perm_vector),length(perm_vector));
for i=1:length(perm_vector)
    perm_mat(i,perm_vector(i)) = 1;
end

end

