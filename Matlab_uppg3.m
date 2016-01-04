% Exam AC - Question 3 -- Rohr's example
clearvars;
clc;
%% Parameters
kp = 2;
ap = -1;
km = 3;
am = -3;
s = tf('s');
P = kp/(s+ap);
M = km/(s+am);

Gamma = eye(2).*3;

%% Real plant
un_dyn = 229/(s^2+30*s+229);
P_rohr = P*un_dyn;

sys_r = ss(P_rohr);

%% True parameters
k_star = km/kp;
theta_star = (ap-am)/kp;

%% init values
xm_init = 0;
xp_init = 0;
theta_init = zeros(2,1);
