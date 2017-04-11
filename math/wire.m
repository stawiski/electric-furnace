clear all;
clc;

% spec
wire_power = 2000; % in [Watts]

% specs of Kanthal A-1 1mm
wire_resm = 1.85; % resistance per meter [Ohm/m]
wire_dia = 1; % diameter in [mm]

% grid
grid_voltage = 230; % in [Volts]

% calculations
wire_resistance = (grid_voltage)^2/wire_power;
wire_current = grid_voltage/wire_resistance;
wire_length = wire_resistance/wire_resm;
wire_SA = (wire_dia/10)*pi*(wire_length*100); % surface area in [cm^2]
wire_SL = wire_power/wire_SA; % surface load in [W/cm^2]

% printfs
fprintf('Power = %d W\n', wire_power);
fprintf('grid voltage = %d V\n', grid_voltage);
fprintf('wire Ohm/m = %.2f Ohm/m\n', wire_resm);
fprintf('wire dia = %.2f mm\n', wire_dia);
fprintf('wire current = %.2f A\n', wire_current);
fprintf('wire length = %.2f m\n', wire_length);
fprintf('wire Surface Load = %.2f W/cm^2\n', wire_SL);
