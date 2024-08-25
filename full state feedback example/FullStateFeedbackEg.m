clear;
M1 = 1;     % kg
M2 = 2;     % kg
K = 1000;    % N/m
D = 50;      % N-s/m

Ka = 1*2000;   % N/m, adding a spring between M1 and wall

F = [0 1 0 0;
    (-K/M1-Ka/M1) (-D/M1) (K/M1) 0;
    0 0 0 1;
    (K/M2) 0 (-K/M2) 0];
G = transpose([0 0 0 (1/M2)]);

C1 = G;
C2 = F*G;
C3 = F*F*G;
C4 = F*F*F*G;
C = [C1 C2 C3 C4];

tn = [0 0 0 1]*inv(C);
T_inv = [tn*F^3;
    tn*F^2;
    tn*F;
    tn];
A = T_inv*F*inv(T_inv);
B = T_inv*G;

% Try repeated poles
p = 50;
alpha1 = 4*p;
alpha2 = 6*p^2;
alpha3 = 4*p^3;
alpha4 = p^4;
alphaC = F^4 + alpha1*F^3 + alpha2*F^2 + alpha3*F + alpha4*eye(4);

KC = [0 0 0 1]*inv(C)*alphaC
K1 = KC(1);
K2 = KC(2);
K3 = KC(3);
K4 = KC(4);

