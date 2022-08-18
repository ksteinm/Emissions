% Katie Steinmann
% University of Wyoming
% Emission data calculations for TRANS2AM RF13
    % RF13 took place on August 23, 2021
    % UWKA took off from Laramie, WY
% Created on August 18, 2022 by Katie Steinmann
% Edits
    % August 18, 2022 - Reading in data files; Collecting data; Figure 1;
    % Figure 2

%% 
% Reading in the necessary files
Picarro = ICARTTreader('CH4_RF13_20210823_RA.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m
Plane = ICARTTreader('trans2am-Aircraft_n2uw_20210823_R0.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m
Ammonia = ICARTTreader('RF13_NH3_20210823_RA.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m
Ethane = ICARTTreader('C2H6_RF13_20210823_RA.ict'); % ICARTTreader is a function used to open ict files => Calls ICARTTreader.m

%% 
% Collecting data from files
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

%% 
% Figure 1
    % Flight path colored by methane concentration
figure
scatter(av_long, av_lat, 5, CH4, 'filled') % Creating a scatter plot - longitude=x-coordinates, latitude=y-corrdinates, dot size, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c1=colorbar; % Showing colorbar
c1.Label.String = 'Methane Concentration (ppb)'; % Naming the colorbar
set(c1, 'FontSize', 20) % Setting the font size of the colorbar
caxis([1.8 2]) % Setting the colorbar range
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Methane Concentrations', 'FontSize', 30) % Providing a title
grid on % Turning on the major grid
grid minor % Turning on the minor grid

%% 
% Figure 2
    % Flight path colored by ammonia concentration
figure
scatter(av_long, av_lat, 5, NH3, 'filled') % Creating a scatter plot - longitude=x-coordinate, latitude=y-coordinate, dotsize, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c2=colorbar; % Showing colorbar
c2.Label.String = 'Ammonia Concentration [ppbv]'; % Naming the colorbar
set(c2, 'FontSize', 20)
caxis([0 100]) % Setting colorbar range
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Ammonia Concentrations', 'FontSize', 30') % Providing a title
grid on % Turning on the major grid
grid minor % Turning on the minor grid