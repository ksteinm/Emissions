% Katie Steinmann
% University of Wyoming
% Code to calculate the perpendicular winds for TRANS2Am RF 13
% Figure 1 - Time series of observed winds and perpendicular winds with the
    % Producers Feedlot as the reference point
% Figure 2 - Time series of observed winds and perpendicular winds with JBS
    % Five Rivers as the reference point
% Figure 3 - Wind rose for observed winds at Producers
% Figure 4 - Wind rose for perpendicular winds at Producers
% Figure 5 - Wind rose for observed winds at JBS Five Rivers
% Figure 6 - Wind rose for perpendicular winds at JBS Five Rivers

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
s_fiverivers = 5730; % Start of five rivers observations
e_fiverivers = 10500; % End of five rivers observation

% Found by looking at flight path
s_Producers = 1700; % Beginning of feedlot sampling
e_Producers = 5750; % End of feelot sampling

% Radius of the Earth
R=6366308.7; % [m]

%% Conversions

% Producers -----------------------------------------------------------
% Converting reference longitude and latitude from degrees to radians
Lat_ref_Prod = deg2rad(40.435182); % Latitude
Lon_ref_Prod = deg2rad(-104.601597); % Longitude

% JBS Five Rivers -----------------------------------------------------
% Converting reference longitude and latitude from degrees to radians
Lat_ref_JBS = deg2rad(40.3769); % Latitude
Lon_ref_JBS = deg2rad(-104.511); % Longitude

% Converting all longitude and latitude data from degrees to radians
Lat_rad=deg2rad(AVlat); % Converting latitude to radians
Lon_rad=deg2rad(AVlon); % Converting longitude to radians

%% Calculate the Azimuth Angle

% Producers -----------------------------------------------------------
% Calculating the azimuth angle
azimuth_Prod = AzimuthAngle(Lat_ref_Prod, Lon_ref_Prod, Lat_rad, Lon_rad); % [radians]
% Calculating the theta position
theta_rad_Prod = atan(azimuth_Prod); % [radians]
% Converting theta to degrees
theta_deg_Prod = rad2deg(theta_rad_Prod); % [degrees]

% JBS Five Rivers -----------------------------------------------------
% Calculating the azimuth angle
azimuth_JBS = AzimuthAngle(Lat_ref_JBS, Lon_ref_JBS, Lat_rad, Lon_rad); % [radians]
% Calculating the theta position
theta_rad_JBS = atan(azimuth_JBS); % [radians]
% Converting theta to degrees
theta_deg_JBS = rad2deg(theta_rad_JBS); % [degrees]

%% Calculating Distance

% Producers -----------------------------------------------------------
% Calculating distance from Producers feedlot
Distance_Prod = Distance(R, Lat_ref_Prod, Lon_ref_Prod, Lat_rad, Lon_rad); % [m]

% JBS Five Rivers -----------------------------------------------------
% Calculating distance from JBS Five Rivers feedlot
Distance_JBS = Distance(R, Lat_ref_JBS, Lon_ref_JBS, Lat_rad, Lon_rad); % [m]

%% Theta Correction

% Producers -----------------------------------------------------------
r_Prod = Distance_Prod;

for i = 1:length(r_Prod)
    if (r_Prod(i) < 0) && (theta_deg_Prod(i)>0)
        r_Prod(i) = r_Prod(i)*-1;
        theta_deg_Prod(i) = 270 - theta_deg_Prod(i); 
    elseif (r_Prod(i) >0) && (theta_deg_Prod(i)<0)
        theta_deg_Prod(i)=270 - theta_deg_Prod(i);
    elseif (r_Prod(i)<0) && (theta_deg_Prod(i)<0)
        theta_deg_Prod(i) = 90-theta_deg_Prod(i);
        r_Prod(i) = r_Prod(i)*-1;
    elseif (theta_deg_Prod(i)<90) && (theta_deg_Prod(i)>0)
        theta_deg_Prod(i) = 90-theta_deg_Prod(i);
    end
end

theta_rad_roation_Prod = deg2rad(theta_deg_Prod); % [radians]

% JBS Five Rivers -----------------------------------------------------
r_JBS = Distance_JBS;

for i = 1:length(r_JBS)
    if (r_JBS(i) < 0) && (theta_deg_JBS(i)>0)
        r_JBS(i) = r_JBS(i)*-1;
        theta_deg_JBS(i) = 270 - theta_deg_JBS(i); 
    elseif (r_JBS(i) >0) && (theta_deg_JBS(i)<0)
        theta_deg_JBS(i)=270 - theta_deg_JBS(i);
    elseif (r_JBS(i)<0) && (theta_deg_JBS(i)<0)
        theta_deg_JBS(i) = 90-theta_deg_JBS(i);
        r_JBS(i) = r_JBS(i)*-1;
    elseif (theta_deg_JBS(i)<90) && (theta_deg_JBS(i)>0)
        theta_deg_JBS(i) = 90-theta_deg_JBS(i);
    end
end

theta_rad_roation_JBS = deg2rad(theta_deg_JBS); % [radians]

%% Calculating the Wind in Polar Coordinates

avwdir_polar_deg = PolarCoordinates(AVwdir);

%% Calculating the Perpendicular Wind

% Producers -----------------------------------------------------------
perpwind_Prod = perp_wind(1, 13274, theta_deg_Prod, AVwmag, avwdir_polar_deg, CH4); % [m/s]

% JBS Five Rivers -----------------------------------------------------
perpwind_JBS = perp_wind(1, 13274, theta_deg_JBS, AVwmag, avwdir_polar_deg, CH4); % [m/s]

%% Figure 1
% Time series of observed winds and perpendicular winds for Producers

figure
plot(UTC(s_Producers:e_Producers), AVwmag(s_Producers:e_Producers), 'k', 'LineWidth', 2)
hold on
plot(UTC(s_Producers:e_Producers), perpwind_JBS(s_Producers:e_Producers), 'r', 'LineWidth', 2)
hold off
set(gca, 'FontSize', 20)
legend('Observed', 'Perpendicular', 'FontSize', 20)
xlabel('Time (UTC)', 'FontSize', 20)
ylabel('Wind Speed (m s^{-1})', 'FontSize', 20)
title('Producer Feedlot Winds', 'FontSize', 30)
grid on
grid minor

%% Figure 2
% Time series of observed winds and perpendicular winds for JBS Five Rivers

figure
plot(UTC(s_fiverivers:e_fiverivers), AVwmag(s_fiverivers:e_fiverivers), 'k', 'LineWidth', 2)
hold on
plot(UTC(s_fiverivers:e_fiverivers), perpwind_JBS(s_fiverivers:e_fiverivers), 'r', 'LineWidth', 2)
hold off
set(gca, 'FontSize', 20)
legend('Observed', 'Perpendicular', 'FontSize', 20, 'Location', 'northwest')
xlabel('Time (UTC)', 'FontSize', 20)
ylabel('Wind Speed (m s^{-1})', 'FontSize', 20)
title('JBS Five Rivers Feedlot Winds', 'FontSize', 30)
grid on
grid minor

%% Figure 3
% Wind Rose for Producers Observations

[handle_Prod, count_Prod, speeds_Prod, directions_Prod, Table_Prod] = WindRose(AVwdir(s_Producers:e_Producers), AVwmag(s_Producers:e_Producers), 'anglenorth', 0, 'angleeast', 90);

%% Figure 4
% Wind Rose for Producers Perpendicular Wind

[handle_Prod_per, count_Prod_per, speeds_Prod_per, directions_Prod_per, Table_Prod_per] = WindRose(AVwdir(s_Producers:e_Producers), perpwind_Prod(s_Producers:e_Producers), 'anglenorth', 0, 'angleeast', 90);

%% Figure 5
% Wind Rose for JBS Observations

[handle_JBS, count_JBS, speeds_JBS, directions_JBS, Table_JBS] = WindRose(AVwdir(s_fiverivers:e_fiverivers), AVwmag(s_fiverivers:e_fiverivers), 'anglenorth', 0, 'angleeast', 90);

%% Figure 6

% Wind Rose for JBS Perpendicular Wind
[handle_JBS_per, count_JBS_per, speeds_JBS_per, directions_JBS_per, Table_JBS_per] = WindRose(AVwdir(s_fiverivers:e_fiverivers), perpwind_JBS(s_fiverivers:e_fiverivers), 'anglenorth', 0, 'angleeast', 90);

