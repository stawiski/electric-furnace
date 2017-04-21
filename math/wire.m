clear all;
clc;

% spec
wire_power = 2000; % in [Watts]

% specs of Kanthal A-1 1mm
wire_resm = 1.85; % resistance per meter [Ohm/m]
wire_dia = 1; % diameter in [mm]

% specs of Kanthal A-1 2mm
%wire_resm = 0.462; % resistance per meter [Ohm/m]
%wire_dia = 2; % diameter in [mm]

% wire coil
coil_dia = 15; % wire coil diameter [mm]

% grid
grid_voltage = 230; % in [Volts]

% calculations
wire_resistance = (grid_voltage)^2/wire_power;
wire_current = grid_voltage/wire_resistance;
wire_length = wire_resistance/wire_resm;
wire_SA = (wire_dia/10)*pi*(wire_length*100); % surface area in [cm^2]
wire_SL = wire_power/wire_SA; % surface load in [W/cm^2]
coil_length_min = (((wire_length*1000)/(coil_dia*pi))*(wire_dia*3))/1000; % calculate min. coil length, assuming spacing between the coils as 3x wire diameter [m]
coil_length_max = (((wire_length*1000)/(coil_dia*pi))*(wire_dia*6))/1000; % maximum recommended coil length (spacing = 6x wire diameter) [m]

% printfs
fprintf(' ### Main ### \n');
fprintf('Power = %d W\n', wire_power);
fprintf('grid voltage = %d V\n', grid_voltage);

fprintf(' ### Wire ### \n');
fprintf('wire Ohm/m = %.2f Ohm/m\n', wire_resm);
fprintf('wire dia = %.2f mm\n', wire_dia);
fprintf('wire current = %.2f A\n', wire_current);
fprintf('wire resistance (24*C) = %.2f Ohm\n', wire_resistance);
fprintf('wire length = %.2f m\n', wire_length);
fprintf('wire Surface Load = %.2f W/cm^2\n', wire_SL);

fprintf(' ### Coil ### \n');
fprintf('coil diameter = %.2f mm\n', coil_dia);
fprintf('min. coil length = %.2f m\n', coil_length_min);
fprintf('max. recommended coil length = %.2f m\n', coil_length_max);
