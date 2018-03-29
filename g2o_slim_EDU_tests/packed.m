function [ m ] = packed( M )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n = size(M,1) + (size(M,1)*(size(M,1)-1)/2);
m = zeros(n,1);
for i = 1:size(M,1)
    for j = i:size(M,2)
        m(i+(j*(j-1)/2)) = M(i,j);
    end
end
end

