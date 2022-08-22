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

%% 
% Figure 3
    % Flight path colored by ethane concentration
figure
scatter(av_long, av_lat, 5, C2H6, 'filled') % Creating a scatter plot - longitude=x-coordinate, latitude=y-coordinate, dotsize, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the number
c3=colorbar; % Showing colorbar
c3.Label.String = 'Ethane Concentration (ppbv)'; % Naming the colorbar
set(c3, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 18]) % Setting colorbar range
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Ethane Concentrations', 'FontSize', 30) % Providing a title
grid on % Turning on the major grid
grid minor % Turning on the minor grid

%% 
% Figure 4
    % Flight path colored by methane including feedlot location

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
%Greeley feedlot locations
p1 = scatter(-104.5881,40.43502,100,'k','filled'); % Producers
p2 = scatter(-104.50219,40.37626,100,'r','filled'); % JBS Five Rivers -Keresy 
p3 = scatter(-104.48439,40.44753,100,'b','filled'); % Monte Vista
legend({'CH4', 'Producers', 'JBS Five Rivers - Keresy', 'Monte Vista'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Methane Concentrations with Feedlot Locations', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% 
% Figure 5
    % Flight path colored by ammonia including feedlot locations

figure
scatter(av_long(start:done), av_lat(start:done), 5, NH3(start:done), 'filled') % Creating a scatter plot - longitude=x-coordinate, latitude=y-coordinate, dotsize, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c5=colorbar; % Showing colorbar
c5.Label.String = 'Ammonia Concentration [ppbv]'; % Naming the colorbar
set(c5, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 100]) % Setting colorbar range
hold on
%Greeley feedlot locations
p1 = scatter(-104.5881,40.43502,100,'k','filled'); % Producers
p2 = scatter(-104.50219,40.37626,100,'r','filled'); % JBS Five Rivers -Keresy 
p3 = scatter(-104.48439,40.44753,100,'b','filled'); % Monte Vista
legend({'CH4', 'Producers', 'JBS Five Rivers - Keresy', 'Monte Vista'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Ammonia Concentrations with Feedlot Locations', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% 
% Figure 6
    % Flight path colored by ammonia including feedlot location

figure
scatter(av_long(start:done), av_lat(start:done), 5, C2H6(start:done), 'filled') % Creating a scatter plot - longitude=x-coordinate, latitude=y-coordinate, dotsize, variable to color by, type of dot
set(gca, 'FontSize', 20) % Setting the font size of the number
c3=colorbar; % Showing colorbar
c3.Label.String = 'Ethane Concentration (ppbv)'; % Naming the colorbar
set(c3, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 18]) % Setting colorbar range
hold on
%Greeley feedlot locations
p1 = scatter(-104.5881,40.43502,100,'k','filled'); % Producers
p2 = scatter(-104.50219,40.37626,100,'r','filled'); % JBS Five Rivers -Keresy 
p3 = scatter(-104.48439,40.44753,100,'b','filled'); % Monte Vista
legend({'CH4', 'Producers', 'JBS Five Rivers - Keresy', 'Monte Vista'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF13 Ethane Concentrations with Feedlot Locations', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid


%% 
% Figure 7
    % Potential temperature versus mean sea level altitude of the aircraft
desc_top = 1190; % Top of the initial descent
desc_bottom = 1700; % Bottom of the inital descent
% Potnetial Temperature = Temperature * (reference pressure/pressure)^(dry air gas constant/specific heat at a constant pressure)
theta = (trf+273.15) .* ((1000 ./ ps_hads_a) .^ (287/1004)); % Calculating potential temperature [K]

figure
line(theta(desc_top:desc_bottom), avzmsl(desc_top:desc_bottom), 'Color', 'k', 'LineWidth', 2) % Creating a line plot - potential tempeature=x-axis, mean sea level altitude-y-axis, colored black
set(gca, 'FontSize', 20) % Setting the font size of the number
xlabel('Potential Temperature (K)', 'FontSize', 20) % Naming the x-axis
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20) % Naming the y-axis
title('RF13 Potential Temperature', 'FontSize', 30) % Providing a title
grid on % Turning on major grid
grid minor % Turning on minor grid

%% 
% Figure 8
    % Potential temperature versus mean sea level altitude of the aircraft
figure
line(theta, avzmsl, 'Color', 'k', 'LineWidth', 2) % Creating a line plot - potential tempeature=x-axis, mean sea level altitude-y-axis, colored black
set(gca, 'FontSize', 20) % Setting the font size of the number
xlabel('Potential Temperature (K)', 'FontSize', 20) % Naming the x-axis
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20) % Naming the y-axis
title('RF13 Potential Temperature', 'FontSize', 30) % Providing a title
grid on % Turning on major grid
grid minor % Turning on minor grid