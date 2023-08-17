% Katie Steinmann
% University of Wyoming
% Code to calculate the perpendicular winds for TRANS2Am RF 13
% Figure 1 - Timeseries of observed wind and perpendicular wind for
    % Producers
% Figure 2 - Timeseries of observed wind and perpendicular wind for JBS
    % Five Rivers
% Figure 3 - Wind rose for observed wind at Producers
% Figure 4 - Wind rose for perpendicular wind at Producers
% Figure 5 - Wind rose for observed wind at JBS Five Rivers
% Figure 6 - Wind rose for perpendicular wind at JBS Rive Rivers
% Needed Functions: AzimuthAngle.m, Distance.m, PolarCoordinates.m,
% perp_wind.m, WindRose.m
% Code modified from Megan McCabe

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
s_fiverivers = 5730; % Start
e_fiverivers = 10500; % End

% Found by looking at flight path
s_Producers = 1700; % Start
e_Producers = 5750; % End

% Radius of the Earth
R = 6366308.7; % [m]

%% Conversions

% Converting reference longitude and latitude from degrees to radians
% Producers
Lat_ref_Prod = deg2rad(40.435182);
Lon_ref_Prod = deg2rad(-104.601597);

% JBS Five Rivers
Lat_ref_JBS = deg2rad(40.3769); % Latitude
Lon_ref_JBS = deg2rad(-104.511); % Longitude

% Converting all longitude and latitude data from degrees to radians
Lat_rad=deg2rad(AVlat);
Lon_rad=deg2rad(AVlon);

%% Transects
% Same transects as in RF13_Transects.m

% Producers
% Transect 1 -------------------------------------------------------------
% Leg 1
trans1_a_start = 2770;
trans1_a_end = 2840;

% Leg 2
trans1_b_start = 2905;
trans1_b_end = 2965;

% Leg 3
trans1_c_start = 3050;
trans1_c_end = 3120;

% Leg 4
trans1_d_start = 3186;
trans1_d_end = 3250;

% Leg 5
trans1_e_start = 3345;
trans1_e_end = 3415;

% Transect 2 -------------------------------------------------------------
% Leg 1
trans2_a_start = 3630;
trans2_a_end = 3680;

% Leg 2
trans2_b_start = 3785;
trans2_b_end = 3855;

% Leg 3
trans2_c_start = 3915;
trans2_c_end = 3965;

% Leg 4
trans2_d_start = 4080;
trans2_d_end = 4135;

% Leg 5
trans2_e_start = 4215;
trans2_e_end = 4260;

% Leg 6
trans2_f_start = 4360;
trans2_f_end = 4420;

% Leg 7
trans2_g_start = 4480;
trans2_g_end = 4530;

% JBS Five Rivers
% Transect 3 -------------------------------------------------------------
% Leg 1
trans3_a_start = 6228;
trans3_a_end = 6340;

% Leg 2
trans3_b_start = 6400;
trans3_b_end = 6540;

% Leg 3
trans3_c_start = 6600;
trans3_c_end = 6700;

% Leg 4
trans3_d_start = 6740;
trans3_d_end = 6880;

% Leg 5
trans3_e_start = 6920;
trans3_e_end = 7020;

% Leg 6
trans3_f_start = 7080;
trans3_f_end = 7220;

% Transect 4 -------------------------------------------------------------
% Leg 1
trans4_a_start = 7350;
trans4_a_end = 7480;

% Leg 2
trans4_b_start = 7500;
trans4_b_end = 7640;

% Leg 3
trans4_c_start = 7680;
trans4_c_end = 7800;

% Leg 4
trans4_d_start = 8300;
trans4_d_end = 8450;

% Leg 5
trans4_e_start = 8480;
trans4_e_end = 8600;

% Leg 6
trans4_f_start = 7840;
trans4_f_end = 7950;

% Transect 5 --------------------------------------------------------------
% Leg 2
trans5_b_start = 8900;
trans5_b_end = 9000;

% Leg 4
trans5_d_start = 9250;
trans5_d_end = 9420;

% Leg 6
trans5_f_start = 9700;
trans5_f_end = 9870;

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
Distance_Prod = Distance(R, Lat_ref_Prod, Lon_ref_Prod, Lat_rad, Lon_rad); % [m]

% JBS Five Rivers -----------------------------------------------------
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
plot(UTC(s_Producers:e_Producers), perpwind_Prod(s_Producers:e_Producers), 'r', 'LineWidth', 2)
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

%% Finding Entire Transect Data
% Combines transect leg data 

Trans1S_wind = NaN(size(AVwmag));
Trans1S_perp  = NaN(size(AVwmag));

Trans1N_wind = NaN(size(AVwmag));
Trans1N_perp  = NaN(size(AVwmag));

Trans2S_wind  = NaN(size(AVwmag));
Trans2S_perp  = NaN(size(AVwmag));

Trans2N_wind  = NaN(size(AVwmag));
Trans2N_perp  = NaN(size(AVwmag));

Trans3S_wind = NaN(size(AVwmag));
Trans3S_perp  = NaN(size(AVwmag));

Trans3N_wind = NaN(size(AVwmag));
Trans3N_perp  = NaN(size(AVwmag));

Trans4S_wind  = NaN(size(AVwmag));
Trans4S_perp  = NaN(size(AVwmag));

Trans4N_wind = NaN(size(AVwmag));
Trans4N_perp  = NaN(size(AVwmag));

Trans5S_wind  = NaN(size(AVwmag));
Trans5S_perp  = NaN(size(AVwmag));

for i = 1:length(NH3)
    if NH3(i) >= 5
        % Transect 1 North Legs -------------------------------------------
        if i >= trans1_a_start && i <= trans1_a_end  || i >= trans1_c_start && i <= trans1_c_end || i >= trans1_e_start && i <= trans1_e_end
            Trans1N_wind(i) = AVwmag(i);
            Trans1N_perp(i) = perpwind_Prod(i);
        end
        % Transect 1 South Legs -------------------------------------------
        if i >= trans1_b_start && i <= trans1_b_end || i >= trans1_d_start && i <= trans1_d_end
            Trans1S_wind(i) = AVwmag(i);
            Trans1S_perp(i) = perpwind_Prod(i);
        end
        % Transect 2 South Legs -------------------------------------------
        if i >= trans2_a_start && i <= trans2_a_end || i >= trans2_c_start && i <= trans2_c_end || i >= trans2_e_start && i <= trans2_e_end || i >= trans2_g_start && i <= trans2_g_end
            Trans2S_wind(i) = AVwmag(i);
            Trans2S_perp(i) = perpwind_Prod(i);
        end
        % Transect 2 North Legs -------------------------------------------
        if i >= trans2_b_start && i <= trans2_b_end || i >= trans2_d_start && i <= trans2_d_end || i >= trans2_f_start && i <= trans2_f_end
            Trans2N_wind(i) = AVwmag(i);
            Trans2N_perp(i) = perpwind_Prod(i);
        end
        % Transect 3 Southwest Legs ---------------------------------------
        if i >= trans3_b_start && i <= trans3_b_end || i >= trans3_d_start && i <= trans3_d_end || i >= trans3_f_start && i <= trans3_f_end
            Trans3S_wind(i) = AVwmag(i);
            Trans3S_perp(i) = perpwind_JBS(i);
        end
        % Transect 3 Northeast Legs ---------------------------------------
        if i >= trans3_a_start && i <= trans3_a_end || i >= trans3_c_start && i <= trans3_c_end || i >= trans3_e_start && i <= trans3_e_end
            Trans3N_wind(i) = AVwmag(i);
            Trans3N_perp(i) = perpwind_JBS(i);
        end
        % Transect 4 Southwest Legs ---------------------------------------
        if i >= trans4_b_start && i <= trans4_b_end || i >= trans4_e_start && i <= trans4_e_end || i >= trans4_f_start && i <= trans4_f_end
            Trans4S_wind(i) = AVwmag(i);
            Trans4S_perp(i) = perpwind_JBS(i);
        end
        % Transect 4 Northeast Legs ---------------------------------------
        if i >= trans4_a_start && i <= trans4_a_end || i >= trans4_c_start && i <= trans4_c_end || i >= trans4_d_start && i <= trans4_d_end
            Trans4N_wind(i) = AVwmag(i);
            Trans4N_perp(i) = perpwind_JBS(i);
        end
        % Transect 5 Southwest Legs ---------------------------------------
        if i >= trans5_b_start && i <= trans5_b_end || i >= trans5_d_start && i <= trans5_d_end || i >= trans5_f_start && i <= trans5_f_end
            Trans5S_wind(i) = AVwmag(i);
            Trans5S_perp(i) = perpwind_JBS(i);
        end
    end
end

%% Average Wind Speed for Producer Transects

AVG_Prod_1N = mean(Trans1N_wind, 'omitnan');
a = ['Averge Wind Speed for Transect 1-North = ', num2str(AVG_Prod_1N)];
disp(a)

AVG_perp_Prod_1N = mean(Trans1N_perp, 'omitnan');
aa = ['Average Perpendicular Wind Speed for Transect 1-North = ', num2str(AVG_perp_Prod_1N)];
disp(aa)

AVG_Prod_1S = mean(Trans1S_wind, 'omitnan');
b = ['Averge Wind Speed for Transect 1-South = ', num2str(AVG_Prod_1S)];
disp(b)

AVG_perp_Prod_1S = mean(Trans1S_perp, 'omitnan');
bb = ['Average Perpendicular Wind Speed for Transect 1-South = ', num2str(AVG_perp_Prod_1S)];
disp(bb)

AVG_Prod_2S = mean(Trans2S_wind, 'omitnan');
c = ['Averge Wind Speed for Transect 2-South = ', num2str(AVG_Prod_2S)];
disp(c)

AVG_perp_Prod_2S = mean(Trans2S_perp, 'omitnan');
cc = ['Average Perpendicular Wind Speed for Transect 2-South = ', num2str(AVG_perp_Prod_2S)];
disp(cc)

AVG_Prod_2N = mean(Trans2N_wind, 'omitnan');
d = ['Averge Wind Speed for Transect 2-North = ', num2str(AVG_Prod_2N)];
disp(d)

AVG_perp_Prod_2N = mean(Trans2N_perp, 'omitnan');
dd = ['Average Perpendicular Wind Speed for Transect 2-North = ', num2str(AVG_perp_Prod_2N)];
disp(dd)

AVG_JBS_1 = mean(Trans3S_wind, 'omitnan');
e = ['Averge Wind Speed for JBS Transect 1 = ', num2str(AVG_JBS_1)];
disp(e)

AVG_perp_JBS_1 = mean(Trans3S_perp, 'omitnan');
ee = ['Average Perpendicular Wind Speed for JBS Transect 1 = ', num2str(AVG_perp_JBS_1)];
disp(ee)

AVG_JBS_2 = mean(Trans3N_wind, 'omitnan');
f = ['Averge Wind Speed for JBS Transect 2 = ', num2str(AVG_JBS_2)];
disp(f)

AVG_perp_JBS_2 = mean(Trans3N_perp, 'omitnan');
ff = ['Average Perpendicular Wind Speed for JBS Transect 2 = ', num2str(AVG_perp_JBS_2)];
disp(ff)

AVG_JBS_3 = mean(Trans4S_wind, 'omitnan');
g = ['Averge Wind Speed for JBS Transect 3 = ', num2str(AVG_JBS_3)];
disp(g)

AVG_perp_JBS_3 = mean(Trans4S_perp, 'omitnan');
gg = ['Average Perpendicular Wind Speed for JBS Transect 3 = ', num2str(AVG_perp_JBS_3)];
disp(gg)

AVG_JBS_4 = mean(Trans4N_wind, 'omitnan');
h = ['Averge Wind Speed for JBS Transect 4 = ', num2str(AVG_JBS_4)];
disp(h)

AVG_perp_JBS_4 = mean(Trans4N_perp, 'omitnan');
hh = ['Average Perpendicular Wind Speed for JBS Transect 4 = ', num2str(AVG_perp_JBS_4)];
disp(hh)

AVG_JBS_5 = mean(Trans5S_wind, 'omitnan');
i = ['Averge Wind Speed for JBS Transect 5 = ', num2str(AVG_JBS_5)];
disp(i)

AVG_perp_JBS_5 = mean(Trans5S_perp, 'omitnan');
ii = ['Average Perpendicular Wind Speed for JBS Transect 5 = ', num2str(AVG_perp_JBS_5)];
disp(ii)

AVG_Prod = mean(AVwmag(s_Producers:e_Producers), 'omitnan');
j = ['Average Wind Speed for Producer Transects = ', num2str(AVG_Prod)];
disp(j)

AVG_Prod_Perp = mean(perpwind_Prod(s_Producers:e_Producers), 'omitnan');
jj = ['Average Perpendicular Wind Speed for Producer Transects = ', num2str(AVG_Prod_Perp)];
disp(jj)

AVG_JBS = mean(AVwmag(s_fiverivers:e_fiverivers), 'omitnan');
k = ['Average Wind Speed for JBS Transects = ', num2str(AVG_JBS)];
disp(k)

AVG_JBS_Perp = mean(perpwind_JBS(s_fiverivers:e_fiverivers), 'omitnan');
kk = ['Average Perpendicular Wind Speed for JBS Transects = ', num2str(AVG_JBS_Perp)];
disp(kk)

