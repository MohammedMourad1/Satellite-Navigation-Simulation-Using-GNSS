% Satellite Navigation System
% Constants
speed_of_light = 299792458; % Speed of light in meters per
second
gps_freq = 1575.42e6; % GPS carrier frequency in Hz
lambda = speed_of_light / gps_freq; % GPS wavelength
% Satellite Positions (X, Y, Z) in ECEF coordinates (meters)
satellite_positions = [
15607355.848 -2687314.157 20004397.334;
-12030326.245 21445586.367 963920.312;
11173512.102 2205324.732 21354220.839;
-7611272.887 -19562964.666 17841415.891;
20971223.889 -6626496.439 13231198.915;
-14794689.089 17732038.508 12470253.402;
-14493862.349 6478914.824 20074621.056;
23672635.995 2388558.316 9832282.409;
18803955.527 -10259941.002 17209321.985;
-19490211.168 23352311.152 1968018.682
];
% User Position (X, Y, Z) in ECEF coordinates (meters)
user_position_true = [0, 0, 0];
% Generate Pseudorange Measurements
num_satellites = size(satellite_positions, 1);
pseudoranges = zeros(num_satellites, 1);
for i = 1:num_satellites
% Calculate distance between user and satellite
delta_pos = satellite_positions(i, :) - user_position_true;
distance = norm(delta_pos);
% Introduce random noise to simulate measurement error
measurement_error = randn() * 10; % Standard deviation of 10
meters
% Calculate pseudorange
pseudoranges(i) = distance + measurement_error;
end
% Solve for User Position using Pseudorange Measurements
% Formulate the system of equations for least squares solution
A = zeros(num_satellites, 4);
b = zeros(num_satellites, 1);
for i = 1:num_satellites
A(i, 1) = -(satellite_positions(i, 1) -
user_position_true(1)) / pseudoranges(i);
A(i, 2) = -(satellite_positions(i, 2) -
user_position_true(2)) / pseudoranges(i);
A(i, 3) = -(satellite_positions(i, 3) -
user_position_true(3)) / pseudoranges(i);
A(i, 4) = 1;
b(i) = -pseudoranges(i) + norm(satellite_positions(i, :) -
user_position_true);
end
% Solve the linear system using least squares
user_position_estimate = (A' * A) \ (A' * b);
% Extract user's estimated position
x_estimate = user_position_estimate(1);
y_estimate = user_position_estimate(2);
z_estimate = user_position_estimate(3);
clock_bias = user_position_estimate(4);
% Output Results
disp('Estimated User Position (ECEF Coordinates):');
disp(['X: ', num2str(x_estimate), ' meters']);
disp(['Y: ', num2str(y_estimate), ' meters']);
disp(['Z: ', num2str(z_estimate), ' meters']);
disp(['Clock Bias: ', num2str(clock_bias), ' meters']);
% Plotting Satellite Navigation System Simulation Results
% Plotting Satellite Navigation System Simulation Results
% Plot satellite positions
figure;
scatter3(satellite_positions(:,1), satellite_positions(:,2),
satellite_positions(:,3), 'filled');
hold on;
% Plot true user position
scatter3(user_position_true(1), user_position_true(2),
user_position_true(3), 100, 'r', 'filled');
% Plot estimated user position
scatter3(x_estimate, y_estimate, z_estimate, 100, 'g',
'filled');
% Plot lines from satellites to estimated user position
for i = 1:num_satellites
line([satellite_positions(i,1), x_estimate],
[satellite_positions(i,2), y_estimate],
[satellite_positions(i,3), z_estimate], 'Color', 'k',
'LineStyle', '--');
end
% Set labels and legend
xlabel('X (meters)');
ylabel('Y (meters)');
zlabel('Z (meters)');
legend('Satellite Positions', 'True User Position', 'Estimated
User Position', 'Satellite-User Lines');
% Set title
title('Satellite Navigation System Simulation');
% Set aspect ratio
axis equal;
% Set grid
grid on;
hold off;