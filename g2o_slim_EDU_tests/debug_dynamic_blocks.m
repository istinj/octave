clc; clear; close all;

r = 33;
c = 33;
H = zeros(r,c);

z33 = zeros(3,3);
z36 = zeros(3,6);
z63 = zeros(6,3);
z66 = zeros(6,6);

h00 = [   2    0    0    0    0   -1
    0    2    0    0    0    1
    0    0    2    1   -1    0
    0    0    1 2002   -1    0
    0    0   -1   -1 2002    0
    -1    1    0    0    0 2003];

h02 = [-1.2378e-06           0           0           0           0           1
    0 -1.2378e-06           0           0           0          -1
    0           0           0          -1           1           0
    0           0          -1       -2000           1           0
    0           0           1           1       -2000           0
    1          -1           0           0           0       -2001];

h11 = [86.9753       0       0
    0 86.9753       0
    0       0 1.85975];

h13 = [  86.9753         0         0         0   40.2102  -2.20429
    0   86.9753         0  -40.2102         0   313.725
    0         0   1.85975 0.0220429  -3.13725         0];

h20 = [-1.2378e-06           0           0           0           0           1
    0 -1.2378e-06           0           0           0          -1
    0           0           0          -1           1           0
    0           0          -1       -2000           1           0
    0           0           1           1       -2000           0
    1          -1           0           0           0       -2001];

h22 = [      3       0       0       0       0      -1
    0       3       0       0       0       2
    0       0       3       1      -2       0
    0       0       1    4002      -1       0
    0       0      -2      -1    4003       0
    -1       2       0       0       0 4004.01];

h23 = [    0     0     0     0     0     0
    0     0     0     0     0    -1
    0     0     0     0     1     0
    0     0     0 -1999     0     0
    0     0     1     0 -2000     0
    0    -1     0     0     0 -2000];

h31 = [1 0 0
    0 1 0
    0 0 1
    0 0 0
    0 0 0
    0 0 0];

h32 = [    0     0     0     0     0     0
    0     0     0     0     0    -1
    0     0     0     0     1     0
    0     0     0 -1999     0     0
    0     0     1     0 -2000     0
    0    -1     0     0     0 -2000];

h33 = [   88.9753          0          0          0    40.2102   -2.20429
    0    88.9753          0   -40.2102          0    315.725
    0          0    3.85975  0.0220429   -5.13725          0
    0   -40.2102  0.0220429    4019.81 -0.0804349   -146.727
    40.2102          0   -5.13725 -0.0804349    4033.26   -1.03094
    -2.20429    315.725          0   -146.727   -1.03094    5147.84];

h35 = [    0     0     0     0     0     0
    0     0     0     0     0    -1
    0     0     0     0     1     0
    0     0     0 -1999     0     0
    0     0     1     0 -2000     0
    0    -1     0     0     0 -2000];

h44 = [   3    0    0    0    0    0
    0    3    0    0    0    0
    0    0    3    0    0    0
    0    0    0 4001    0    0
    0    0    0    0 4001    0
    0    0    0    0    0 4001];

h45 = [-1.2378e-06           0           0           0           0           0
    0 -1.2378e-06           0           0           0           0
    0           0           0           0           0           0
    0           0           0       -1999           0           0
    0           0           0           0       -1999           0
    0           0           0           0           0       -1999];

h53 = [    0     0     0     0     0     0
    0     0     0     0     0    -1
    0     0     0     0     1     0
    0     0     0 -1999     0     0
    0     0     1     0 -2000     0
    0    -1     0     0     0 -2000];

h54 = [-1.2378e-06           0           0           0           0           0
    0 -1.2378e-06           0           0           0           0
    0           0           0           0           0           0
    0           0           0       -1999           0           0
    0           0           0           0       -1999           0
    0           0           0           0           0       -1999];

h55 = [   3    0    0    0    0    0
    0    3    0    0    0    1
    0    0    3    0   -1    0
    0    0    0 4001    0    0
    0    0   -1    0 4002    0
    0    1    0    0    0 4002];


h0 = [h00, z66, h02, z66, z66, z63];