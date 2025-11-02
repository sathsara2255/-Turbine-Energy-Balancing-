% turbine_graph_with_func.m
% Single-file script to compute and plot turbine power vs h_out
clear; clc; close all;

% --- Parameters ---
h_in = 3200;                   % kJ/kg
mdot = 20;                     % kg/s
h_out_range = 2600:20:3100;    % kJ/kg

% Preallocate
power_kW = zeros(size(h_out_range));

% Compute using local function
for i = 1:length(h_out_range)
    try
        res = turbine_balance_simple(mdot, h_in, h_out_range(i));
    catch ME
        fprintf('Error calling turbine_balance_simple at i=%d (h_out=%.1f):\n', i, h_out_range(i));
        rethrow(ME);
    end
    power_kW(i) = res.W_dot_kW;
end

% Plot
figure('Name','Turbine Power vs Outlet Enthalpy','NumberTitle','off');
plot(h_out_range, power_kW, '-o', 'LineWidth', 1.5, 'MarkerFaceColor','auto');
xlabel('Outlet Enthalpy h_{out} (kJ/kg)');
ylabel('Shaft Power \dot{W} (kW)');
title(sprintf('m = %.1f kg/s, h_{in} = %.0f kJ/kg', mdot, h_in));
grid on;

% Optional: plot electrical power for eta_mech
eta_mech = 0.96;
W_elec = power_kW * eta_mech;
hold on;
plot(h_out_range, W_elec, '--', 'LineWidth', 1.2, 'DisplayName', sprintf('\\eta_{mech}=%.2f',eta_mech));
legend('Shaft Power','Electrical Power','Location','best');

% -------------------------
% Local function (must be after script code)
function results = turbine_balance_simple(mdot, h_in, h_out, V_in, V_out)
    % Inputs:
    % mdot  - mass flow [kg/s]
    % h_in  - inlet specific enthalpy [kJ/kg]
    % h_out - outlet specific enthalpy [kJ/kg]
    % V_in, V_out - velocities [m/s] (optional, set [] or 0 if negligible)
    if nargin < 4, V_in = 0; end
    if nargin < 5, V_out = 0; end

    % Convert kinetic energy (kJ/kg): (V^2 / 2) [m^2/s^2] = J/kg -> /1000 -> kJ/kg
    ke_in_kJperkg  = 0.5 * V_in^2 / 1000;
    ke_out_kJperkg = 0.5 * V_out^2 / 1000;

    % Total specific energy in/out (kJ/kg)
    e_in  = h_in  + ke_in_kJperkg;
    e_out = h_out + ke_out_kJperkg;

    % Shaft power (kW)
    W_dot_kW = mdot * (e_in - e_out); % kJ/s = kW

    results.mdot = mdot;
    results.h_in = h_in;
    results.h_out = h_out;
    results.ke_in_kJkg  = ke_in_kJperkg;
    results.ke_out_kJkg = ke_out_kJperkg;
    results.W_dot_kW = W_dot_kW;
    results.W_dot_MW = W_dot_kW / 1000;
    
    % (Optional) Display one-line summary
    % fprintf('m=%.2f kg/s, h_in=%.1f, h_out=%.1f, W=%.2f kW\n', mdot, h_in, h_out, W_dot_kW);
end
