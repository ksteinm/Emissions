% Katie Steinmann
% University of Wyoming
% Emission data calculations for TRANS2AM RF13
    % RF13 took place on August 23, 2021
    % UWKA took off from Laramie, WY
% Created on August 29, 2022 by Katie Steinmann
% Edits
    % August 29, 2022 - Read in files; Collected data; Identified transect
    % 1, leg A, B, and C
    % August 30, 2022 - Indentified transectg 1, leg D and E. Indetified
    % transect 1, leg A, B, C, D, E, F, G, H, and I
    % August 31, 2022 - Created plot 2 with transects 1 and 2; Updated legs
    % for transects 1 and 2
    % September 1, 2022 - Identified legs 1, 2, 3, and 4 of the third
    % transect
    % September 6, 2022 - Identified legs 5 and 6 of the third transect;
    % Identified all legs of the fourth and fifth transect; Added feedlot locations to figure 2 

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

%% Figure 1
    % Flight path colored by methane concentration
    % Plot used to identify transect locations

start = 1700; % Beginning of feedlot sampling
done = 10700; % End of feelot sampling

figure
scatter(av_long(start:done), av_lat(start:done), 5, CH4(start:done), 'filled') % Creating a scatter plot - longitude=x-coordinates, latitude=y-corrdinates, dot size, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c4=colorbar; % Showing colorbar
c4.Label.String = 'Methane Concentration (ppb)'; % Naming the colorbar
set(c4, 'FontSize', 20) % Setting the font size of the colorbar
caxis([1.85 2.2]) % Setting the colorbar range
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Methane Concentrations', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Identifying transects

% Leg 1 of the first transect
trans1_a_start = 2755; % Index value of the start of the transect leg at 1,784 m
trans1_a_end = 2856; % Index value of the end of the transect leg at 1,732 m

% Leg 2 of the first transect
trans1_b_start = 2898; % Index value of the start of the transect leg at 1,784 m
trans1_b_end = 2985; % Index value of the end of the transect leg at 1,705 m

% Leg 3 of the first transect
trans1_c_start = 3030; % Index value of the start of the transect leg at 1,814 m
trans1_c_end = 3140; % Index value of the end of the transect leg at 1,732 m

% Leg 4 of the first transect
trans1_d_start = 3180; % Index value of the start of the transect leg at 1,630 m
trans1_d_end = 3265; % Index value of the end of the transect leg at 1,597 m

% Leg 5 of the first transect
trans1_e_start = 3324; % Index value of the start of the transect leg at 1,680 m
trans1_e_end = 3440; % Index value of the end of the transect leg at 1,677 m

%---------------------------------------------------------------------
% Leg 1 of the second transect
trans2_a_start = 3620; % Index value of the start of the transect leg at 1,724 m
trans2_a_end = 3700; % Index value of the end of the transect leg at 1,729 m

% Leg 2 of the second transect
trans2_b_start = 3772; % Index value of the start of the transect leg at 1,755 m
trans2_b_end = 3880; % Index value of the end of the transect leg at 1,767 m

% Leg 3 of the second transect
trans2_c_start = 3902; % Index value of the start of the transect leg at 1,728 m
trans2_c_end = 3990; % Index value of the end of the transect leg at 1,599 m

% Leg 4 of the second transect
trans2_d_start = 4066; % Index value of the start of the transect leg at 1,664 m
trans2_d_end = 4152; % Index value of the end of the transect leg at 1,606 m

% Leg 5 of the second transect
trans2_e_start = 4208; % Index value of the start of the transect leg at 1,820 m
trans2_e_end = 4280; % Index value of the end of the transect leg at 1,946 m

% Leg 6 of the second transect
trans2_f_start = 4346; % Index value of the start of the transect leg at 2,002 m
trans2_f_end = 4436; % Index value of the end of the transect leg at 1,911 m

% Leg 7 of the second transect
trans2_g_start = 4470; % Index value of the start of the transect leg at 1,939 m
trans2_g_end = 4555; % Index value of the end of the transect leg at 1,932 m

% Leg 8 of the second transect
trans2_h_start = 4627; % Index value of the start of the transect leg at 2,268 m
trans2_h_end = 4715; % Index value of the end of the transect leg at 2,272 m

% Leg 9 of the seceond transect
trans2_i_start = 4758; % Index value of the start of the transect leg at 2,368 m
trans2_i_end = 4835; % Index value of the end of the transect leg at 2,272 m

%-----------------------------------------------------------------------
% Leg 1 of third transect
trans3_a_start = 6258; % Index value of the start of the transect leg at
trans3_a_end = 6376; % Index value of the end of the transect leg at

% Leg 2 of the third transect
trans3_b_start = 6400; % Index value of the start of the transect leg at
trans3_b_end = 6535; % Index value of the end of the transect leg at

% Leg 3 of the third transect
trans3_c_start = 6581; % Index value of the start of the transect leg at
trans3_c_end = 6711; % Index value of the end of the transect leg at

% Leg 4 of the third transect
trans3_d_start = 6733; % Index value of the start of the transect leg at
trans3_d_end = 6877; % Index value of the end of the transect leg at

% Leg 5 of the third transect
trans3_e_start = 6903; % Index value of the start of the transect leg at
trans3_e_end = 7047; % Index value of the end of the transect leg at

% Leg 6 of the third transect
trans3_f_start = 7068; % Index value of the start of the transect leg at
trans3_f_end = 7230; % Index value of the end of the transect leg at

%------------------------------------------------------------------------
% Leg 1 of the fourth transect
trans4_a_start = 7344; % Index value of the start of the transect leg at
trans4_a_end = 7488; % Index value of the end of the transect leg at

% Leg 2 of the fourth transect
trans4_b_start = 7500; % Index value of the start of the transect leg at
trans4_b_end = 7635; % Index value of the end of the transect leg at

% Leg 3 of the fourth transect
trans4_c_start = 7668; % Index value of the start of the transect leg at
trans4_c_end = 7806; % Index value of the end of the transect leg at

% Leg 4 of the fourth transect
trans4_d_start = 8151; % Index value of the start of the transect leg at
trans4_d_end = 8455; % Index value of the end of the transect leg at

% Leg 5 of the fourth transect
trans4_e_start = 8477; % Index value of the start of the transect leg at
trans4_e_end = 8592; % Index value of the end of the transect leg at

% Leg 6 of the fourth transect
trans4_f_start = 7824; % Index value of the start of the transect leg at
trans4_f_end = 8113; % Index value of the end of the transect leg at

%-----------------------------------------------------------------------
% Leg 1 of the fifth transect
trans5_a_start = 8710; % Index value of the start of the transect leg at
trans5_a_end = 8830; % Index value of the end of the transect leg at

% Leg 2 of the fifth transect
trans5_b_start = 8887; % Index value of the start of the transect leg at
trans5_b_end = 9011; % Index value of the end of the transect leg at

% Leg 3 of the fifth transect
trans5_c_start = 9048; % Index value of the start of the transect leg at
trans5_c_end = 9225; % Index value of the end of the transect leg at

% Leg 4 of the fifth transect
trans5_d_start = 9248; % Index value of the start of the transect leg at
trans5_d_end = 9435; % Index value of the end of the transect leg at

% Leg 5 of the fifth transect
trans5_e_start = 9470; % Index value of the start of the transect leg at
trans5_e_end = 9672; % Index value of the end of the transect leg at

% Leg 6 of the fifth transect
trans5_f_start = 9697; % Index value of the start of the transect leg at
trans5_f_end = 9868; % Index value of the end of the transect leg at

%% Figure 2
    % Flight path colored by methane concentration with transects

start = 1700; % Beginning of feedlot sampling
done = 10700; % End of feelot sampling

figure
scatter(av_long(start:done), av_lat(start:done), 5, CH4(start:done), 'filled') % Creating a scatter plot - longitude=x-coordinates, latitude=y-corrdinates, dot size, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c4=colorbar; % Showing colorbar
c4.Label.String = 'Methane Concentration (ppb)'; % Naming the colorbar
set(c4, 'FontSize', 20) % Setting the font size of the colorbar
caxis([1.85 2.2]) % Setting the colorbar range
hold on
% Transect 1
scatter(av_long(trans1_a_start:trans1_a_end), av_lat(trans1_a_start:trans1_a_end), 10, 'r', 'filled');
scatter(av_long(trans1_b_start:trans1_b_end), av_lat(trans1_b_start:trans1_b_end), 10, 'g', 'filled');
scatter(av_long(trans1_c_start:trans1_c_end), av_lat(trans1_c_start:trans1_c_end), 10, 'k', 'filled');
scatter(av_long(trans1_d_start:trans1_d_end), av_lat(trans1_d_start:trans1_d_end), 10, 'm', 'filled');
scatter(av_long(trans1_e_start:trans1_e_end), av_lat(trans1_e_start:trans1_e_end), 10, 'c', 'filled');
% Transect 2
scatter(av_long(trans2_a_start:trans2_a_end), av_lat(trans2_a_start:trans2_a_end), 10, 'r', 'filled');
scatter(av_long(trans2_b_start:trans2_b_end), av_lat(trans2_b_start:trans2_b_end), 10, 'g', 'filled');
scatter(av_long(trans2_c_start:trans2_c_end), av_lat(trans2_c_start:trans2_c_end), 10, 'k', 'filled');
scatter(av_long(trans2_d_start:trans2_d_end), av_lat(trans2_d_start:trans2_d_end), 10, 'm', 'filled');
scatter(av_long(trans2_e_start:trans2_e_end), av_lat(trans2_e_start:trans2_e_end), 10, 'c', 'filled');
scatter(av_long(trans2_f_start:trans2_f_end), av_lat(trans2_f_start:trans2_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
scatter(av_long(trans2_g_start:trans2_g_end), av_lat(trans2_g_start:trans2_g_end), 10, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Orange
scatter(av_long(trans2_h_start:trans2_h_end), av_lat(trans2_h_start:trans2_h_end), 10, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Purple
scatter(av_long(trans2_i_start:trans2_i_end), av_lat(trans2_i_start:trans2_i_end), 10, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % Green
% Transect 3
scatter(av_long(trans3_a_start:trans3_a_end), av_lat(trans3_a_start:trans3_a_end), 10, 'r', 'filled');
scatter(av_long(trans3_b_start:trans3_b_end), av_lat(trans3_b_start:trans3_b_end), 10, 'g', 'filled');
scatter(av_long(trans3_c_start:trans3_c_end), av_lat(trans3_c_start:trans3_c_end), 10, 'k', 'filled');
scatter(av_long(trans3_d_start:trans3_d_end), av_lat(trans3_d_start:trans3_d_end), 10, 'm', 'filled');
scatter(av_long(trans3_e_start:trans3_e_end), av_lat(trans3_e_start:trans3_e_end), 10, 'c', 'filled');
scatter(av_long(trans3_f_start:trans3_f_end), av_lat(trans3_f_start:trans3_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% Transect 4 
scatter(av_long(trans4_a_start:trans4_a_end), av_lat(trans4_a_start:trans4_a_end), 10, 'r', 'filled');
scatter(av_long(trans4_b_start:trans4_b_end), av_lat(trans4_b_start:trans4_b_end), 10, 'g', 'filled');
scatter(av_long(trans4_c_start:trans4_c_end), av_lat(trans4_c_start:trans4_c_end), 10, 'k', 'filled');
scatter(av_long(trans4_d_start:trans4_d_end), av_lat(trans4_d_start:trans4_d_end), 10, 'm', 'filled');
scatter(av_long(trans4_e_start:trans4_e_end), av_lat(trans4_e_start:trans4_e_end), 10, 'c', 'filled');
scatter(av_long(trans4_f_start:trans4_f_end), av_lat(trans4_f_start:trans4_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% Transect 5
scatter(av_long(trans5_a_start:trans5_a_end), av_lat(trans5_a_start:trans5_a_end), 10, 'r', 'filled');
scatter(av_long(trans5_b_start:trans5_b_end), av_lat(trans5_b_start:trans5_b_end), 10, 'g', 'filled');
scatter(av_long(trans5_c_start:trans5_c_end), av_lat(trans5_c_start:trans5_c_end), 10, 'k', 'filled');
scatter(av_long(trans5_d_start:trans5_d_end), av_lat(trans5_d_start:trans5_d_end), 10, 'm', 'filled');
scatter(av_long(trans5_e_start:trans5_e_end), av_lat(trans5_e_start:trans5_e_end), 10, 'c', 'filled');
scatter(av_long(trans5_f_start:trans5_f_end), av_lat(trans5_f_start:trans5_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% Feedlot locations
p1 = scatter(-104.5881,40.43502,100,'k','filled'); % Producers
p2 = scatter(-104.50219,40.37626,100,'r','filled'); % JBS Five Rivers -Keresy 
p3 = scatter(-104.48439,40.44753,100,'b','filled'); % Monte Vista
hold off
legend({'CH_4', 'Producers', 'JBS Five Rivers - Keresy', 'Monte Vista'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Methane Concentrations', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid
