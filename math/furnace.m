clear all;
clc;

%% bricks

% brick IFB23
%isolation_coeff = (0.14 + 0.19) / 2; % brick coeff at 800*C
%width = 76 * 10^(-3); % brick width = 76mm

% brick JM26
isolation_coeff = 0.3; % brick coeff at 800*C
width = 64 * 10^(-3); % brick width = 64mm

%% temperature
temp_diff = 800; % [Celcius]

%% walls
inside_a = 0.25; % inside dimentions: length in [meters]
inside_b = 0.25; % inside dimentions: width in [meters]
inside_height = 0.25; % inside dimentions: heigth in [meters]

total_wall_area = 2*(inside_a*inside_b) + 2*(inside_a*inside_height) + 2*(inside_b*inside_height);
total_capacity = inside_a * inside_b * inside_height * 1000; % capacity in [Liters]

%% wire
power_wire = 1800 * 2; % in [Watts]

%% furnace calc

% isolation_coeff -> coefficient of the brick at the rated temperature in [W/(m*K)]
% width -> wall width in [meters]
% temp_diff_K -> difference in temperature betweenn outside and inside in [Kelvins]
% total_wall_area -> surface area of the walls in [meters^2]
% power_loss - in [Watts]

temp_diff_K = temp_diff + 273;
power_loss = (isolation_coeff/width) * temp_diff_K * total_wall_area;

%% aluminium
alu_cap = 1; % [Liters] of aluminium
% 903 J/(kg*K) * 2702 kg/m^3
alu_energy = 903 * 2702 * (alu_cap/1000) * temp_diff; % energy to get alu to temp_diff in [Joules]
alu_time = alu_energy/(power_wire - power_loss); % time to deliver that energy; in [seconds]
alu_time = alu_time/60; % time in [minutes]

%% Printfs

fprintf('Power wire = %.2f W\n', power_wire);
fprintf('Power loss = %.2f W\n', power_loss);
fprintf('Furnace heating power = %.2f W\n', power_wire - power_loss);
fprintf('Furnace capacity = %.2f L\n', total_capacity);
fprintf('Furnace heating power per capacity = %.2f W/L\n', (power_wire - power_loss)/total_capacity);
fprintf('Estimated time to heat %.2f L of alu to %.2f *C = %.2f mins\n', alu_cap, temp_diff, alu_time);

