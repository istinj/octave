clear;
block_dim = 6;
a = randi(10,[block_dim,block_dim]);
a = a'*a;
b = a+a;

A = zeros(block_dim*11,block_dim*11);
for i = 0:10
    if(i == 0)
        A(1:block_dim,1:block_dim) = a;
        continue;
    end
    A(1+(i*6):1+(i*6)+5, 1+(i*6):1+(i*6)+5) = b;
    if(i>0)
        A(1+(i*6):1+(i*6)+5, 1+(i*6)-6:1+(i*6)-1) = -a;
        A(1+(i*6)-6:1+(i*6)-1, 1+(i*6):1+(i*6)+5) = -a';
    end
end

% B = randi(10,[block_dim*11,1]);

U = chol(A);
L = U';
% 
y = inv(L) * B;
x = inv(U) * y;


for i = 0:10
    if(i == 0)
        continue;
    end
    if(i>0)
        A(1+(i*6)-6:1+(i*6)-1, 1+(i*6):1+(i*6)+5) = -a';
    end
end