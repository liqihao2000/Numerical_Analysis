clear;
clc;

syms x
eqn = 8*x^4-8*x^2+1 == 0;
solx = solve(eqn,x)

x=[  (1/2 - 2^(1/2)/4)^(1/2)
  (2^(1/2)/4 + 1/2)^(1/2)
 -(1/2 - 2^(1/2)/4)^(1/2)
 -(2^(1/2)/4 + 1/2)^(1/2) ];

x = sort(x,'descend');
x 

y =exp(x);
y

% divided difference table

table = [x, y];
cha1 = [0 
        (y(2)-y(1))/(x(2)-x(1))
        (y(3)-y(2))/(x(3)-x(2))
        (y(4)-y(3))/(x(4)-x(3))
        ]
cha2 = [0 
        0
        (cha1(3)-cha1(2))/(x(3)-x(1))
        (cha1(4)-cha1(3))/(x(4)-x(2))
        ]
    
cha3 = [0 
        0
        0
        (cha2(4)-cha2(3))/(x(4)-x(1))
        ]   
    
cha = [y cha1 cha2 cha3]

syms t
p3 = cha(1,1)+cha(2,2)*(t-x(1))...
    +cha(3,3)*(t-x(1))*(t-x(2))+cha(4,4)*(t-x(1))*(t-x(2))*(t-x(3));

p3 = simplify(p3)

% Fractions in symbolic expressions are represented by decimal numbers
d_pre=digits(9);
d_cur=digits;
p3 = vpa(p3)

t = -1:0.001:1;
f = exp(t);
value = 0.175175694*t.^3 + 0.542900723*t.^2 + 0.998933228*t + 0.994615317;
error_inf=vpa(max(abs(f-value)),3)
