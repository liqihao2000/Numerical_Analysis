clear;
clc;

G = diag([pi,pi/2,pi/2,pi/2]);
G

F=[integral(@(x) (1.*exp(x)./sqrt(1-x.^2)),-1,1)
   integral(@(x) (x.*exp(x)./sqrt(1-x.^2)),-1,1)
   integral(@(x) ((2*x.^2-1).*exp(x)./sqrt(1-x.^2)),-1,1)
   integral(@(x) ((4*x.^3-3*x).*exp(x)./sqrt(1-x.^2)),-1,1)
   ];
F

C = G\F;
C

syms x
T = [1 x 2*x.^2-1 4*x.^3-3*x];
S = T*C; 

% Fractions in symbolic expressions are represented by decimal numbers
d_pre=digits(7);
d_cur=digits;
S = vpa(S)

% error
error_2=sqrt(integral(@(x) (exp(x).^2./sqrt(1-x.^2)),-1,1)-F'*C);
error_2 = vpa(error_2,4)

x = -1:0.001:1;
f = exp(x);
value = 0.1773474*x.^3 + 0.5429907*x.^2 + 0.9973077*x + 0.9945705;
error_inf=max(abs(f-value));
error_inf = vpa(error_inf,4)
