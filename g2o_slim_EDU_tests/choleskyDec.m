function L_Upper  = choleskyDec( A )
%choleskyDec Evaluate the Cholesky decomposition of a dense matrix
if size(A,1) ~= size(A,2)
    disp('Error, matrix must be a square');
    return
end
dim = size(A,1); % must be square
L = zeros(dim, dim);
for j = 1:dim % cols
    for i = j:dim % rows
        sum_1 = 0;
        sum_2 = 0;
        for k = 1:j-1
            sum_1 = sum_1 + L(j,k).^2;
            sum_2 = sum_2 + (L(i,k).*L(j,k));
        end
        L(j,j) = sqrt(A(j,j) - sum_1);
        L(i,j) = (1./L(j,j)) .* (A(i,j) - sum_2);
    end
end

L_Upper = L';
end

