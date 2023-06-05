% Katie Steinmann
% University of Wyoming
% Calculates the air density for TRANS2Am RF 13
% Figure 1 - Temperature vs. pressure plot colored by density

%% Reading in data

M = importdata('RF13_merge_1Hz.csv',',',1); % 1 header lines and commana for deliminator, 
v = genvarname(M.colheaders); %get variable names from headers
for i=1:length(M.colheaders)
    eval([v{i} ' =M.data(:,i)']);
end
clearvars('files','filename','M','v','i');

%% Rename Variables

CH4 = CH4_ppmv; % Methane [ppmv]
NH3 = NH3_ppbv; % Ammonia [ppbv]
C2H6 = C2H6_ppbv; % Ethane [ppbv]
H2O = H2O_perc; % Water vapor [%]
UTC = Datetime_UTC; % Time [UTC]


%% Constants

% Found by looking at flight path
start = 1700; % Beginning of feedlot sampling
done = 10700; % End of feelot sampling

% Universal Gas Constant
R_star = 8.314; % [J/(mol*K)]

%% Conversions

% Pressure
Press_Pa = ps_hads_a .* 100; % [Pa]

% Temperature
Temp_K = temp + 273.15; % [K]

%% Calculating Density

rho = Density(Press_Pa, R_star, Temp_K); % [mol/(m^3)]

%% Average Temperature

mean_temp = mean(temp, 'omitnan');
std_temp = std(temp, 'omitnan');

a = ['Average Temperature = ', num2str(mean_temp), ' degrees C'];
b = ['Standard Deviation of Temperature = ', num2str(std_temp), ' degrees C'];

disp(a)
disp(b)

%% Figure 1
% Density plot

figure
scatter(Temp_K, Press_Pa, 50, rho, 'filled')
set(gca, 'FontSize', 20)
c1=colorbar;
c1.Label.String = 'Density (mol/m^3)';
set(c1, 'FontSize', 20)
xlabel('Temperature (K)', 'FontSize', 20)
ylabel('Pressure (Pa)', 'FontSize', 20)
title('Density', 'FontSize', 30);
grid on
grid minor




