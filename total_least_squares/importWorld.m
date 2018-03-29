function [Xr_true, Xr, Xl_true, Xl, Zl, Zp, Zr, land_association, proj_association, pose_association] = importWorld()
  A = load('data/XR_True.txt');
  for i=1:size(A,1)
    Xr_true(:,:,i) = reshape(A(i,:),4,4);
  endfor
  
  A = load('data/XR_Guess.txt');
  for i=1:size(A,1)
    Xr(:,:,i) = reshape(A(i,:),4,4);
  endfor
  
  A = load('data/XL_True.txt');
  for i=1:size(A,1)
    Xl_true(:,i) = reshape(A(i,:),3,1);
  endfor
  
  A = load('data/XL_Guess.txt');
  for i=1:size(A,1)
    Xl(:,i) = reshape(A(i,:),3,1);
  endfor
  
  A = load('data/zl.txt');
  for i=1:size(A,1)
    Zl(:,i) = reshape(A(i,:),3,1);
  endfor
  
  A = load('data/zp.txt');
  for i=1:size(A,1)
    Zp(:,i) = reshape(A(i,:),2,1);
  endfor
  
  A = load('data/zr.txt');
  for i=1:size(A,1)
    Zr(:,:,i) = reshape(A(i,:),4,4);
  endfor
  
  A = load('data/land_ass.txt');
  for i=1:size(A,1)
    land_association = A';
  endfor
  
  A = load('data/proj_ass.txt');
  for i=1:size(A,1)
    proj_association = A';
  endfor
  
  A = load('data/pose_ass.txt');
  for i=1:size(A,1)
    pose_association = A';
  endfor
  
  
  
endfunction