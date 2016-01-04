%% Oral Exam Adaptive -- Albin Remäng -- 2015/2016
clearvars;
clc;

% General parameters
s = tf('s');
Z_p = s+1;
R_p = s^2-5*s+6;
G = Z_p/R_p;
Aug = (s+0.5);
Z_m = 1*Aug;        % Augmenterad med cancellerande pooler
R_m = (s+1)*Aug;
M = Z_m/R_m;
k_p = 1;            % High frequency gain
n = 2;              % Order of the plant

%% Init values for the integrators
x_m_init = zeros(n,1);     % Init for the reference states
x_p_init = zeros(2,1);     % Init for the plant states
phi_1_init = zeros(n-1,1);
phi_2_init = zeros(n-1,1);
param_init = zeros(2*n,1);

%% Parameter inital conditions
Gamma = eye(2*n).*100;        % Kolla upp denna dimension och gör snyggare

%% Filters
lambda = Z_m;       % Choosing the char_pol of the filter to zeros of model
d = [1]';           % n-2 --> one less than lambda
F = 1/lambda*d;     % Filter contstructed --> Måste nog göra denna större då vi måste cancellera pooler osv.
sys_F = ss(F);      % Hur gör jag med y outputs?
Lambda = sys_F.A;
l = sys_F.B;

%% Creating Statespace of the transfer functions
sys_G = ss(G);
A_p = sys_G.A;
B_p = sys_G.B;
C_p = sys_G.C;
D_p = sys_G.D;

sys_M = ss(M);
A_m = sys_M.A;
B_m = sys_M.B;
C_m = sys_M.C;
D_m = sys_M.D;