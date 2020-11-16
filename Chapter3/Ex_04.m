clear;
clc;

g00 = integral(@(x) 1*1*x.^0, 0, 0.1);
g01 = integral(@(x) 1*x, 0, 0.1);
g02 = integral(@(x) 1*x.^2, 0, 0.1);
g11 = integral(@(x) x.*x, 0, 0.1);
g12 = integral(@(x) x.*x.^2, 0, 0.1);
g22 = integral(@(x) x.^2.*x.^2, 0, 0.1);

% G is a symmetric matrix
G = [g00 g01 g02;
     g01 g11 g12;
     g02 g12 g22];
F=[integral(@(x) 1.*sin(x), 0, 0.1)
   integral(@(x) x.*sin(x), 0, 0.1)
   integral(@(x) x.^2.*sin(x), 0, 0.1)    
];
F

C = G\F

syms x

T = [1 x x.^2];
phi = T*C;

d_pre=digits(7);
d_cur=digits;
phi = vpa(phi)

error_2= integral(@(x) sin(x).^2, 0, 0.1)-F'*C;
error_2 = vpa(error_2,6)

