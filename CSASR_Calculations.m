% Common Source Amplifier
% with Source Resistance
clear all;
clc;
% Constants
V_t = 2;
k_n = 333e-6;
V_DD = 18;
lambda = 0.01;

% Parameters
V_D = 5.2;
Q = linspace(2, 5, 100);
V_S = 0.1;
R_b = 25e3;

V_ov = Q - V_S - V_t;
V_DS = V_D - V_S;
I_D = 0.5 * k_n * V_ov.^2 ...
    * (1 + lambda * V_DS);
R_D = (V_DD - V_D)./I_D;
R_S = V_S./I_D;
gm = 2 * I_D ./ V_ov;
r_o = ((1/lambda) + V_DS)./I_D;
gain = (-gm .* R_D .* r_o) ...
    ./(R_D + R_S + r_o + gm.*R_S.*r_o);
R_a = V_DD*R_b./(Q) - R_b;

solutions  = find(gain < -32 ... 
    & gain > -38);
Gains = gain(solutions)
output_resistances = r_o(solutions)
bias_points = Q(solutions)
drain_resistances = R_D(solutions)
source_resistances = R_S(solutions)
biasing_resistors = R_a(solutions)
