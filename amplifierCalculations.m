clear all;
clc;

%% Setting up the workspace
global k_n;
global R_D;
global V_DD;
global V_t;
global input_signal_swing;
global min_Vgs;
global Vov_B;
global max_Vgs;
global bias_point;
global bias_gain;
global input_gain_variation;
global max_gain;

% Constants
input_signal_swing = 0.05; % volts
V_t = 2; % threshold voltage
k_n = 333e-6; % transconductance parameter = u_n * Cox * W/L
V_DD = 18; % Volts

% Tunable parameters
R_D = linspace(132000, 134000, 100); % Ohms
desired_gain = -40;

recalculate()

%% Plotting Gain against R_D
% We can now determine the best R_D for attain this amplification
hold on;
R_D = R_D/1000;
plot(R_D, bias_gain)
%plot(R_D, input_gain_variation)
plot(R_D, input_gain_variation + bias_gain)
plot(R_D, -input_gain_variation + bias_gain)
plot(R_D, 0*R_D + desired_gain)

title('Gain Variation with resistance')
xlabel('R_D / k\Omega ');
ylabel('Gain');
legend( 'Gain at Bias Point', 'Maximum Gain Experienced by Signal', 'Minimum Gain Experience by Signal','Desired Gain')

grid on;
yticks(-45:1:-25)
xticks(min(R_D):0.1:max(R_D))
figure();
hold off;

%% Selecting a good resistance
R_D = 132.7e3;
recalculate();

R_D
bias_gain
bias_point
input_gain_variation

Vgs = linspace(min_Vgs, max_Vgs, 10000);
Vds = V_DD - 0.5*(k_n * R_D)*(Vgs - V_t).^2;

plot(Vgs, Vds)
title('Voltage Transfer Chacteristic');
xlabel('Gate Source Voltage');
ylabel('Drain Source Voltage');
legend('\it v_{DS}(v_{GS})');
yticks(0:1:max(Vds));
xticks(V_t:round((max(Vgs) - V_t)/20, 1):max(Vgs));
grid on;

function recalculate()
global k_n;
global R_D;
global V_DD;
global V_t;
global input_signal_swing;
global min_Vgs;
global Vov_B;
global max_Vgs;
global bias_point;
global bias_gain;
global input_gain_variation;
global max_gain;

min_Vgs = V_t; % Cut off region when Vgs is below this
Vov_B = (sqrt(2 * k_n * R_D * V_DD + 1)-1)/(k_n * R_D);
max_Vgs = V_t + Vov_B; % triode region when Vgs exceeds this

bias_point = max_Vgs - (1.5 * input_signal_swing); % allow room for the signal's maximum value
bias_gain = -k_n * (bias_point - V_t) * R_D; % gain around bias point
input_gain_variation = -k_n * R_D * input_signal_swing * 2;
max_gain = (V_DD - Vov_B) / (Vov_B/2);
end