function L_upperT  = blockCholesky( A_, block_dim_ )
%blockCholesky Computes the Cholesky exploiting block-fashioned computation
L_upperT = zeros(size(A_));

% Decompose
A_11 = A_(1:block_dim_, 1:block_dim_);
A_12 = A_(1:block_dim_, block_dim_ + 1:end);
A_22 = A_( block_dim_ + 1:end,  block_dim_ + 1:end);
% U_11 = choleskyDec(A_11);
if (A_11 == zeros(block_dim_, block_dim_))
    U_11 = zeros(block_dim_, block_dim_);
    U_11_t = U_11';
    U_12 = zeros(size(U_11_t,1), size(A_12,2));
else
    U_11 = chol(A_11);
    U_11_t = U_11';
    U_12 = inv(U_11_t) * A_12;
end

A_22_prime = A_22 - (U_12' * U_12);

if size(A_22_prime,1) <= block_dim_
%     U_22 = choleskyDec(A_22_prime);
    U_22 = chol(A_22_prime);
    
    L_upperT(1:block_dim_, 1:block_dim_) = U_11;
    L_upperT(1: block_dim_,  block_dim_ + 1:end) = U_12;
    L_upperT( block_dim_ + 1:end,  block_dim_ + 1:end) = U_22;
else
    temp_U22 = blockCholesky(A_22_prime, block_dim_);
    L_upperT(1:block_dim_, 1:block_dim_) = U_11;
    L_upperT(1: block_dim_,  block_dim_ + 1:end) = U_12;
    L_upperT( block_dim_ + 1:end,  block_dim_ + 1:end) = temp_U22;
end


end

