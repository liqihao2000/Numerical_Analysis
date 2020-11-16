clear;
clc;

G = diag([2,2/3,2/5]);
G

F=[integral(@(t) (1.*4./(t.^2+2*t+5)),-1,1)
   integral(@(t) (t.*4./(t.^2+2*t+5)),-1,1)
   integral(@(t) ((3*t.^2-1)/2.*4./(t.^2+2*t+5)),-1,1)
   ];
F

C = G\F

syms t
T = [1 t (3*t.^2-1)/2 ]
S = T*C;
St=simplify(S);

% Fractions in symbolic expressions are represented by decimal numbers
d_pre=digits(7);
d_cur=digits;
St = vpa(St)

syms x t
t = 2*x-1;
T = [1 t (3*t.^2-1)/2 ]
S = T*C;
Sx=simplify(S);
Sx = vpa(Sx)
