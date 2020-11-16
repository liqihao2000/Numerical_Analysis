clear;
clc;

G = diag([pi,pi/2,pi/2]);
G

F=[integral(@(t) (1.*sin(0.05+0.05*t)./sqrt(1-t.^2)),-1,1)
   integral(@(t) (t.*sin(0.05+0.05*t)./sqrt(1-t.^2)),-1,1)
   integral(@(t) ((2*t.^2-1).*sin(0.05+0.05*t)./sqrt(1-t.^2)),-1,1)
   ];
F

C = G\F

syms t
T = [1 t 2*t.^2-1 ]
S = T*C;
St=simplify(S);

% Fractions in symbolic expressions are represented by decimal numbers
d_pre=digits(7);
d_cur=digits;
St = vpa(St)

syms x t
t = 20*x-1;
T = [1 t 2*t.^2-1 ]
S = T*C;
Sx=simplify(S);
Sx = vpa(Sx)

error_2=(integral(@(t) (sin(0.05+0.05*t).^2./sqrt(1-t.^2)),-1,1)-F'*C)
error_2 = vpa(error_2,6)

