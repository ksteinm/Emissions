% Katie Steinmann
% University of Wyoming
% Emission data calculations for TRANS2AM RF13
    % RF13 took place on August 23, 2021
    % UWKA took off from Laramie, WY
% Created on September 8 by Katie Steinmann
% Edits
% September 21, 2022 - Calculated the average height of each leg;
% Calculated the distance from the ground for each leg;  Calculated the
% distance between each leg.

%% Reading in the necessary files

Picarro = ICARTTreader('CH4_RF13_20210823_RA.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m
Plane = ICARTTreader('trans2am-Aircraft_n2uw_20210823_R0.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m
Ammonia = ICARTTreader('RF13_NH3_20210823_RA.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m
Ethane = ICARTTreader('C2H6_RF13_20210823_RA.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m

%% Collecting data from files

CH4 = Picarro.CH4; % Reading in the methane data from Picarro [ppb]
NH3 = Ammonia.NH3_1Hz_ppbv; % Reading in the ammonia data [ppbv]
C2H6 = Ethane.C2H6_1Hz_ppbv_uwka; % Reading in the ethane data [ppbv]
avzmsl = Plane.AVzmsl; % Reading in the mean sea level altitude of the aircraft [m]
tas = Plane.tas; % Reading in the true air speed of the aircraft [m/s]
trf = Plane.trf; % Reading in static temperature [C]
ps_hads_a = Plane.ps_hads_a; % Reading in static pressure [hPa]
av_lat = Plane.AVlat; % Reading in aircraft latitude [degrees North]
av_long = Plane.AVlon; % Reading in aircraft longitude [degrees East]
av_w_wind = Plane.AVwwind; % Reading in the vertical wind speed [m/s]
H2O = Picarro.H2O; % Reading in water vapor mixing ratio [ppb]

%% Height Calculations

Boundary_Layer_Height = 1970; % Found using RF13_Boundary_Layer_Heights.m [m]
Ground = 1250; % Height of the ground in mean sea level [m] 

% Transect 1 --------------------------------------
Avg_Height_Trans1_a = mean(avzmsl(trans1_a_start:trans1_a_end), 'omitnan'); % Calculates the average height of the aircraft during leg 1 of transect 1 [m]
Avg_Height_Trans1_b = mean(avzmsl(trans1_b_start:trans1_b_end), 'omitnan'); % Calculates the average height of the aircraft during leg 2 of transect 1 [m]
Avg_Height_Trans1_c = mean(avzmsl(trans1_c_start:trans1_c_end), 'omitnan'); % Calculates the average height of the aircraft during leg 3 of transect 1 [m]
Avg_Height_Trans1_d = mean(avzmsl(trans1_d_start:trans1_d_end), 'omitnan'); % Calculates the average height of the aircraft during leg 4 of transect 1 [m]
Avg_Height_Trans1_e = mean(avzmsl(trans1_e_start:trans1_e_end), 'omitnan'); % Calculates the average height of the aircraft during leg 5 of transect 1 [m]

% Transect 2 -------------------------------------
Avg_Height_Trans2_a = mean(avzmsl(trans2_a_start:trans2_a_end), 'omitnan'); % Calculates the average height of the aircraft during leg 1 of transect 2 [m]
Avg_Height_Trans2_b = mean(avzmsl(trans2_b_start:trans2_b_end), 'omitnan'); % Calculates the average height of the aircraft during leg 2 of transect 2 [m]
Avg_Height_Trans2_c = mean(avzmsl(trans2_c_start:trans2_c_end), 'omitnan'); % Calculates the average height of the aircraft during leg 3 of transect 2 [m]
Avg_Height_Trans2_d = mean(avzmsl(trans2_d_start:trans2_d_end), 'omitnan'); % Calculates the average height of the aircraft during leg 4 of transect 2 [m]
Avg_Height_Trans2_e = mean(avzmsl(trans2_e_start:trans2_e_end), 'omitnan'); % Calculates the average height of the aircraft during leg 5 of transect 2 [m]
Avg_Height_Trans2_f = mean(avzmsl(trans2_f_start:trans2_f_end), 'omitnan'); % Calculates the average height of the aircraft during leg 6 of transect 2 [m]
Avg_Height_Trans2_g = mean(avzmsl(trans2_g_start:trans2_g_end), 'omitnan'); % Calculates the average height of the aircraft during leg 7 of transect 2 [m]
Avg_Height_Trans2_h = mean(avzmsl(trans2_h_start:trans2_h_end), 'omitnan'); % Calculates the average height of the aircraft during leg 8 of transect 2 [m]
Avg_Height_Trans2_i = mean(avzmsl(trans2_i_start:trans2_i_end), 'omitnan'); % Calculates the average height of the aircraft during leg 9 of transect 2 [m]

% Transect 3 --------------------------------------
Avg_Height_Trans3_a = mean(avzmsl(trans3_a_start:trans3_a_end), 'omitnan'); % Calculates the average height of the aircraft during leg 1 of transect 3 [m]
Avg_Height_Trans3_b = mean(avzmsl(trans3_b_start:trans3_b_end), 'omitnan'); % Calculates the average height of the aircraft during leg 2 of transect 3 [m]
Avg_Height_Trans3_c = mean(avzmsl(trans3_c_start:trans3_c_end), 'omitnan'); % Calculates the average height of the aircraft during leg 3 of transect 3 [m]
Avg_Height_Trans3_d = mean(avzmsl(trans3_d_start:trans3_d_end), 'omitnan'); % Calculates the average height of the aircraft during leg 4 of transect 3 [m]
Avg_Height_Trans3_e = mean(avzmsl(trans3_e_start:trans3_e_end), 'omitnan'); % Calculates the average height of the aircraft during leg 5 of transect 3 [m]
Avg_Height_Trans3_f = mean(avzmsl(trans3_f_start:trans3_f_end), 'omitnan'); % Calculates the average height of the aircraft during leg 5 of transect 3 [m]

% Transect 4 --------------------------------------
Avg_Height_Trans4_a = mean(avzmsl(trans4_a_start:trans4_a_end), 'omitnan'); % Calculates the average height of the aircraft during leg 1 of transect 4 [m]
Avg_Height_Trans4_b = mean(avzmsl(trans4_b_start:trans4_b_end), 'omitnan'); % Calculates the average height of the aircraft during leg 2 of transect 4 [m]
Avg_Height_Trans4_c = mean(avzmsl(trans4_c_start:trans4_c_end), 'omitnan'); % Calculates the average height of the aircraft during leg 3 of transect 4 [m]
Avg_Height_Trans4_d = mean(avzmsl(trans4_d_start:trans4_d_end), 'omitnan'); % Calculates the average height of the aircraft during leg 4 of transect 4 [m]
Avg_Height_Trans4_e = mean(avzmsl(trans4_e_start:trans4_e_end), 'omitnan'); % Calculates the average height of the aircraft during leg 5 of transect 4 [m]
Avg_Height_Trans4_f = mean(avzmsl(trans4_f_start:trans4_f_end), 'omitnan'); % Calculates the average height of the aircraft during leg 6 of transect 4 [m]

% Transect 5 -------------------------------------
Avg_Height_Trans5_a = mean(avzmsl(trans5_a_start:trans5_a_end), 'omitnan'); % Calculates the average height of the aircraft during leg 1 of transect 5 [m]
Avg_Height_Trans5_b = mean(avzmsl(trans5_b_start:trans5_b_end), 'omitnan'); % Calculates the average height of the aircraft during leg 2 of transect 5 [m]
Avg_Height_Trans5_c = mean(avzmsl(trans5_c_start:trans5_c_end), 'omitnan'); % Calculates the average height of the aircraft during leg 3 of transect 5 [m]
Avg_Height_Trans5_d = mean(avzmsl(trans5_d_start:trans5_d_end), 'omitnan'); % Calculates the average height of the aircraft during leg 4 of transect 5 [m]
Avg_Height_Trans5_e = mean(avzmsl(trans5_e_start:trans5_e_end), 'omitnan'); % Calculates the average height of the aircraft during leg 5 of transect 5 [m]
Avg_Height_Trans5_f = mean(avzmsl(trans5_f_start:trans5_f_end), 'omitnan'); % Calculates the average height of the aircraft during leg 6 of transect 5 [m]

%% Distance from ground

% Transect 1 --------------------------------------
Distance_from_Ground_Trans1_a = Avg_Height_Trans1_a - Ground; % Calculates the distance from the ground for leg 1 of transect 1 [m]
Distance_from_Ground_Trans1_b = Avg_Height_Trans1_b - Ground; % Calculates the distance from the ground for leg 2 of transect 1 [m]
Distance_from_Ground_Trans1_c = Avg_Height_Trans1_c - Ground; % Calculates the distance from the ground for leg 3 of transect 1 [m]
Distance_from_Ground_Trans1_d = Avg_Height_Trans1_d - Ground; % Calculates the distance from the ground for leg 4 of transect 1 [m]
Distance_from_Ground_Trans1_e = Avg_Height_Trans1_e - Ground; % Calculates the distance from the ground for leg e of transect 1 [m]

% Transect 2 -------------------------------------
Distance_from_Ground_Trans2_a = Avg_Height_Trans2_a - Ground; % Calculates the distance from the ground for leg 1 of transect 2 [m]
Distance_from_Ground_Trans2_b = Avg_Height_Trans2_b - Ground; % Calculates the distance from the ground for leg 2 of transect 2 [m]
Distance_from_Ground_Trans2_c = Avg_Height_Trans2_c - Ground; % Calculates the distance from the ground for leg 3 of transect 2 [m]
Distance_from_Ground_Trans2_d = Avg_Height_Trans2_d - Ground; % Calculates the distance from the ground for leg 4 of transect 2 [m]
Distance_from_Ground_Trans2_e = Avg_Height_Trans2_e - Ground; % Calculates the distance from the ground for leg 5 of transect 2 [m]
Distance_from_Ground_Trans2_f = Avg_Height_Trans2_f - Ground; % Calculates the distance from the ground for leg 6 of transect 2 [m]
Distance_from_Ground_Trans2_g = Avg_Height_Trans2_g - Ground; % Calculates the distance from the ground for leg 7 of transect 2 [m]
Distance_from_Ground_Trans2_h = Avg_Height_Trans2_h - Ground; % Calculates the distance from the ground for leg 8 of transect 2 [m]
Distance_from_Ground_Trans2_i = Avg_Height_Trans2_i - Ground; % Calculates the distance from the ground for leg 9 of transect 2 [m]

% Transect 3 -----------------------------------
Distance_from_Ground_Trans3_a = Avg_Height_Trans3_a - Ground; % Calculates the distance from the ground for leg 1 of transect 3 [m]
Distance_from_Ground_Trans3_b = Avg_Height_Trans3_b - Ground; % Calculates the distance from the ground for leg 2 of transect 3 [m]
Distance_from_Ground_Trans3_c = Avg_Height_Trans3_c - Ground; % Calculates the distance from the ground for leg 3 of transect 3 [m]
Distance_from_Ground_Trans3_d = Avg_Height_Trans3_d - Ground; % Calculates the distance from the ground for leg 4 of transect 3 [m]
Distance_from_Ground_Trans3_e = Avg_Height_Trans3_e - Ground; % Calculates the distance from the ground for leg 5 of transect 3 [m]
Distance_from_Ground_Trans3_f = Avg_Height_Trans3_f - Ground; % Calculates the distance from the ground for leg 6 of transect 3 [m]

% Transect 4 ----------------------------------
Distance_from_Ground_Trans4_a = Avg_Height_Trans4_a - Ground; % Calculates the distance from the ground for leg 1 of transect 4 [m]
Distance_from_Ground_Trans4_b = Avg_Height_Trans4_b - Ground; % Calculates the distance from the ground for leg 2 of transect 4 [m]
Distance_from_Ground_Trans4_c = Avg_Height_Trans4_c - Ground; % Calculates the distance from the ground for leg 3 of transect 4 [m]
Distance_from_Ground_Trans4_d = Avg_Height_Trans4_d - Ground; % Calculates the distance from the ground for leg 4 of transect 4 [m]
Distance_from_Ground_Trans4_e = Avg_Height_Trans4_e - Ground; % Calculates the distance from the ground for leg 5 of transect 4 [m]
Distance_from_Ground_Trans4_f = Avg_Height_Trans4_f - Ground; % Calculates the distance from the ground for leg 6 of transect 4 [m]

% Transect 5 -----------------------------------
Distance_from_Ground_Trans5_a = Avg_Height_Trans5_a - Ground; % Calculates the distance from the ground for leg 1 of transect 5 [m]
Distance_from_Ground_Trans5_b = Avg_Height_Trans5_b - Ground; % Calculates the distance from the ground for leg 2 of transect 5 [m]
Distance_from_Ground_Trans5_c = Avg_Height_Trans5_c - Ground; % Calculates the distance from the ground for leg 3 of transect 5 [m]
Distance_from_Ground_Trans5_d = Avg_Height_Trans5_d - Ground; % Calculates the distance from the ground for leg 4 of transect 5 [m]
Distance_from_Ground_Trans5_e = Avg_Height_Trans5_e - Ground; % Calculates the distance from the ground for leg 5 of transect 5 [m]
Distance_from_Ground_Trans5_f = Avg_Height_Trans5_f - Ground; % Calculates the distance from the ground for leg 6 of transect 5 [m]

%% Vertical distance between transects

% Transect 1 -------------------------------
% Northern legs - Legs 1, 3, and 5
% Leg 5 is the lowest, followed by leg 1, and leg 3

Height_1e = Distance_from_Ground_Trans1_e; % Sets the height of leg 5 as the average height - the ground [m]
Height_1a = Distance_from_Ground_Trans1_a - Height_1e; % Calculates the difference between the height of leg 1 and the height of leg 5 [m]
Height_1c = Distance_from_Ground_Trans1_c - Height_1a; % Calculates the difference between the height of leg 3 and the heights of legs 1 and 3 [m]

% Southern legs - Legs 2 and 4
% Leg 4 is lower than leg 2
Height_1d = Distance_from_Ground_Trans1_d; % Sets the height of leg 4 as the average height - the ground [m]
Height_1b = Distance_from_Ground_Trans1_b - Height_1d; % Calculates the difference between the height of leg 2 and the height of leg 4 [m]

% Transect 2 -------------------------------
% Northern legs - Legs 2, 4, 6, 8
% From Lowest to highest heights - 4, 2, 6, 8
Height_2d = Distance_from_Ground_Trans2_d; % Sets the height of leg 4 as the average height - the ground [m]
Height_2b = Distance_from_Ground_Trans2_b - Height_2d; % Calculates the difference between the height of leg 2 and the height of leg 4 [m]
Height_2f = Distance_from_Ground_Trans2_f - Height_2b; % Calculates the difference between the height of leg 6 and the height of leg 2 [m]
Height_2h = Distance_from_Ground_Trans2_h - Height_2f; % Calculates the difference between the height of leg 8 and the height of leg 6 [m]

% Southern Legs - Legs 1, 3, 5, 7, 9
% From lowest to highest heights - 3, 1, 5, 7, 9

Height_2c = Distance_from_Ground_Trans2_c; % Sets the height of leg 3 as the average height - the ground [m]
Height_2a = Distance_from_Ground_Trans2_a - Height_2c; % Calculates the difference between the height of leg 1 and the height of leg 3 [m]
Height_2e = Distance_from_Ground_Trans2_e - Height_2a; % Calculates the difference between the height of leg 5 and the height of leg 1 [m]
Height_2g = Distance_from_Ground_Trans2_g - Height_2e; % Calculates the difference between the height of leg 7 and the height of leg 5 [m]
Height_2i = Distance_from_Ground_Trans2_i - Height_2g; % Calculates the difference between the height of leg 9 and the height of leg 7 [m]

% Transect 3 -------------------------------
% Northeastern leg - Legs 1, 3, and 5
% From lowest to highest heights - 3, 1, 5
Height_3c = Distance_from_Ground_Trans3_c; % Sets the height of leg 3 as the average height - the ground [m]
Height_3a = Distance_from_Ground_Trans3_a - Height_3c; % Calculates the difference between the height of leg 1 and the height of leg 3 [m]
Height_3e = Distance_from_Ground_Trans3_e - Height_3a; % Calculates the difference between the height of leg 5 and the height of leg 1 [m]

% Southwestern legs - Legs 2, 4, and 6
% From lowest to highest heights - 4, 2, 6

Height_3d = Distance_from_Ground_Trans3_d; % Sets the height of leg 4 as the average height - the ground [m]
Height_3b = Distance_from_Ground_Trans3_b - Height_3d; % Calculates the difference between the height of leg 2 and the height of leg 4 [m]
Height_3f = Distance_from_Ground_Trans3_f - Height_3b; % Calculates the difference between the height of leg 8 and the height of leg 6 [m]

% Transect 4 ------------------------------
% Northeastern legs - Legs 1, 3, and 4
% From lowest to highest heights - 3, 1, 4

Height_4c = Distance_from_Ground_Trans4_c; % Sets the height of leg 3 as the average height - the ground [m]
Height_4a = Distance_from_Ground_Trans4_a - Height_4c; % Calculates the difference between the height of leg 1 and the height of leg 3 [m]
Height_4d = Distance_from_Ground_Trans4_d - Height_4a; % Calculates the difference between the height of leg 4 and the height of leg 1 [m]

% Southwestern legs - Legs 2, 5, and 6
% From lowest to highest heights - 2, 6, 5

Height_4b = Distance_from_Ground_Trans4_b; % Sets the height of leg 2 as the average height - the ground [m]
Height_4f = Distance_from_Ground_Trans4_f - Height_4b; % Calculates the difference between the height of leg 5 and the height of leg 2 [m]
Height_4e = Distance_from_Ground_Trans4_e - Height_4f; % Calculates the difference between the height of leg 6 and the height of leg 5 [m]

% Transect 5 -----------------------------
% Northeastern legs - Legs 1, 3, and 5
% From lowest to highest hegihts - 5, 3, 1
Height_5e = Distance_from_Ground_Trans5_e; % Sets the height of leg 5 as the average height - the ground [m]
Height_5c = Distance_from_Ground_Trans5_c - Height_5e; % Calculates the difference between the height of leg 3 and the height of leg 5 [m]
Height_5a = Distance_from_Ground_Trans5_a - Height_5c; % Calculates the difference between the height of leg 1 and the height of leg 3 [m]

% Southwestern legs - Legs 2, 4, and 6
% From lowest to highest heights - 6, 4, 2

Height_5f = Distance_from_Ground_Trans5_f; % Sets the height of leg 6 as the average height - the ground [m]
Height_5d = Distance_from_Ground_Trans5_d - Height_5f; % Calculates the difference between the height of leg 4 and the height of leg 6 [m]
Height_5b = Distance_from_Ground_Trans5_b - Height_5d; % Calculates the difference between the height of leg 2 and the height of leg 2 [m]

%% 3D plot of flight track
% Used to confirm heights of each leg
start = 1700; % Beginning of feedlot sampling
done = 10700; % End of feelot sampling

figure
scatter3(av_long(start:done), av_lat(start:done), avzmsl(start:done), 5, CH4(start:done), 'filled') % Creating a scatter plot - longitude=x-coordinates, latitude=y-corrdinates, dot size, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c4=colorbar; % Showing colorbar
c4.Label.String = 'Methane Concentration (ppb)'; % Naming the colorbar
set(c4, 'FontSize', 20) % Setting the font size of the colorbar
caxis([1.85 2.2]) % Setting the colorbar range
hold on
% % Transect 1
% scatter3(av_long(trans1_a_start:trans1_a_end), av_lat(trans1_a_start:trans1_a_end), avzmsl(trans1_a_start:trans1_a_end), 10, 'r', 'filled');
% scatter3(av_long(trans1_b_start:trans1_b_end), av_lat(trans1_b_start:trans1_b_end), avzmsl(trans1_b_start:trans1_b_end), 10, 'g', 'filled');
% scatter3(av_long(trans1_c_start:trans1_c_end), av_lat(trans1_c_start:trans1_c_end), avzmsl(trans1_c_start:trans1_c_end), 10, 'k', 'filled');
% scatter3(av_long(trans1_d_start:trans1_d_end), av_lat(trans1_d_start:trans1_d_end), avzmsl(trans1_d_start:trans1_d_end), 10, 'm', 'filled');
% scatter3(av_long(trans1_e_start:trans1_e_end), av_lat(trans1_e_start:trans1_e_end), avzmsl(trans1_e_start:trans1_e_end), 10, 'c', 'filled');
% % Transect 2
% scatter3(av_long(trans2_a_start:trans2_a_end), av_lat(trans2_a_start:trans2_a_end), avzmsl(trans2_a_start:trans2_a_end), 10, 'r', 'filled');
% scatter3(av_long(trans2_b_start:trans2_b_end), av_lat(trans2_b_start:trans2_b_end), avzmsl(trans2_b_start:trans2_b_end), 10, 'g', 'filled');
% scatter3(av_long(trans2_c_start:trans2_c_end), av_lat(trans2_c_start:trans2_c_end), avzmsl(trans2_c_start:trans2_c_end), 10, 'k', 'filled');
% scatter3(av_long(trans2_d_start:trans2_d_end), av_lat(trans2_d_start:trans2_d_end), avzmsl(trans2_d_start:trans2_d_end), 10, 'm', 'filled');
% scatter3(av_long(trans2_e_start:trans2_e_end), av_lat(trans2_e_start:trans2_e_end), avzmsl(trans2_e_start:trans2_e_end), 10, 'c', 'filled');
% scatter3(av_long(trans2_f_start:trans2_f_end), av_lat(trans2_f_start:trans2_f_end), avzmsl(trans2_f_start:trans2_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% scatter3(av_long(trans2_g_start:trans2_g_end), av_lat(trans2_g_start:trans2_g_end), avzmsl(trans2_g_start:trans2_g_end), 10, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Orange
% scatter3(av_long(trans2_h_start:trans2_h_end), av_lat(trans2_h_start:trans2_h_end), avzmsl(trans2_h_start:trans2_h_end), 10, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Purple
% scatter3(av_long(trans2_i_start:trans2_i_end), av_lat(trans2_i_start:trans2_i_end), avzmsl(trans2_i_start:trans2_i_end), 10, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % Green
% % Transect 3
% scatter3(av_long(trans3_a_start:trans3_a_end), av_lat(trans3_a_start:trans3_a_end), avzmsl(trans3_a_start:trans3_a_end), 10, 'r', 'filled');
% scatter3(av_long(trans3_b_start:trans3_b_end), av_lat(trans3_b_start:trans3_b_end), avzmsl(trans3_b_start:trans3_b_end), 10, 'g', 'filled');
% scatter3(av_long(trans3_c_start:trans3_c_end), av_lat(trans3_c_start:trans3_c_end), avzmsl(trans3_c_start:trans3_c_end), 10, 'k', 'filled');
% scatter3(av_long(trans3_d_start:trans3_d_end), av_lat(trans3_d_start:trans3_d_end), avzmsl(trans3_d_start:trans3_d_end), 10, 'm', 'filled');
% scatter3(av_long(trans3_e_start:trans3_e_end), av_lat(trans3_e_start:trans3_e_end), avzmsl(trans3_e_start:trans3_e_end), 10, 'c', 'filled');
% scatter3(av_long(trans3_f_start:trans3_f_end), av_lat(trans3_f_start:trans3_f_end), avzmsl(trans3_f_start:trans3_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% % Transect 4 
% scatter3(av_long(trans4_a_start:trans4_a_end), av_lat(trans4_a_start:trans4_a_end), avzmsl(trans4_a_start:trans4_a_end), 10, 'r', 'filled');
% scatter3(av_long(trans4_b_start:trans4_b_end), av_lat(trans4_b_start:trans4_b_end), avzmsl(trans4_b_start:trans4_b_end), 10, 'g', 'filled');
% scatter3(av_long(trans4_c_start:trans4_c_end), av_lat(trans4_c_start:trans4_c_end), avzmsl(trans4_c_start:trans4_c_end), 10, 'k', 'filled');
% scatter3(av_long(trans4_d_start:trans4_d_end), av_lat(trans4_d_start:trans4_d_end), avzmsl(trans4_d_start:trans4_d_end), 10, 'm', 'filled');
% scatter3(av_long(trans4_e_start:trans4_e_end), av_lat(trans4_e_start:trans4_e_end), avzmsl(trans4_e_start:trans4_e_end), 10, 'c', 'filled');
% scatter3(av_long(trans4_f_start:trans4_f_end), av_lat(trans4_f_start:trans4_f_end), avzmsl(trans4_f_start:trans4_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% Transect 5
scatter3(av_long(trans5_a_start:trans5_a_end), av_lat(trans5_a_start:trans5_a_end), avzmsl(trans5_a_start:trans5_a_end), 10, 'r', 'filled');
scatter3(av_long(trans5_b_start:trans5_b_end), av_lat(trans5_b_start:trans5_b_end), avzmsl(trans5_b_start:trans5_b_end), 10, 'g', 'filled');
scatter3(av_long(trans5_c_start:trans5_c_end), av_lat(trans5_c_start:trans5_c_end), avzmsl(trans5_c_start:trans5_c_end), 10, 'k', 'filled');
scatter3(av_long(trans5_d_start:trans5_d_end), av_lat(trans5_d_start:trans5_d_end), avzmsl(trans5_d_start:trans5_d_end), 10, 'm', 'filled');
scatter3(av_long(trans5_e_start:trans5_e_end), av_lat(trans5_e_start:trans5_e_end), avzmsl(trans5_e_start:trans5_e_end), 10, 'c', 'filled');
scatter3(av_long(trans5_f_start:trans5_f_end), av_lat(trans5_f_start:trans5_f_end), avzmsl(trans5_f_start:trans5_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
