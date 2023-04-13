% Katie Steinmann
% University of Wyoming
% Plots the flight track of the UWKA during RF13 of TRANS2Am
% Figures 1, 2, and 3 show the entire flight track
% Figures 4, 5, and 6 show the area of interest with the locations of the
    % CAFOS

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

% Found by looking at flight path
s_fiverivers = 5730; % Start of five rivers observations
e_fiverivers = 10500; % End of five rivers observations

% Reading in VAFO location information
CAFO_file = readtable('CAFO_cattle.xlsx');

% Reading in variables
CAFO_lat = CAFO_file{:, 1}; % Latitudes of CAFOs [degrees north]
CAFO_lon = CAFO_file{:, 2}; % Longitudes of CAFOs [degrees east]

% Reading in oila and gas information
ONG_file = readtable('oil_and_gas.xlsx');

ONG_lat = ONG_file{:, 1}; % Latitudes of oil and gas sites [degrees north]
ONG_lon = ONG_file{:, 2}; % Longitudes of oila and gas sites [degrees east]

% Methane conversion
CH4_ppb = CH4 .* 1000; % Making methane the same units as ammonia [ppbv]

% Creating colormap for plot taken from Megan McCabe
mycolormap =[
     1 0 0
    1 .02 0
    1 .08 .04
    1 .1 0
    1 .12 .1
    1 .13 .2
    1 .14 .3
    1 .15 .4
    1 .2 .5
    1 .233 .6
    1 .263 .7
    1 .3 .8
    1 .35 .8
    1 .4 .9
    1 .45 .9
    1 .5 .9
    1 .5 1
    1 .65 1
    1 .7 1
    0.8 .95 1
    0.6 .95 1
    0.4 .95 1
    .2 .95 1
    0 .95 1
    0 .9 1
    0 .85 1
    0 .8 1
    0 .78 1
    0 .75 1
    0 .7 1
    0 .65 1
    0 .6 1
    0 .55 1
    0 .5 1
    0 .4 1
    0 .3 1
    0 .2 1
    0 0 1
    0 0 .97
    0 0 .93
    0 0 .92
    0 0 .9
    0 0 .85
    0 0 .83
    0 0 .8
    0 0 .7
    0 0 .75
    0 0 .6
    0 0 .65
    0 0 .5];

%% Figure 1
% Flight path colored by methane concentration
figure
scatter(AVlon, AVlat, 5, CH4, 'filled') % Plots the flight path colored by methane concentration
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c1=colorbar; % Showing colorbar
c1.Label.String = 'Methane Concentration (ppmv)'; % Labeling the colorbar
set(c1, 'FontSize', 20) % Setting the font size of the colorbar
caxis([1.8 2]) % Sets the minimum and maximum methane concentration for the colorbar
xlabel('Longitude (^oE)', 'FontSize', 20) % X-axis label
ylabel('Latitude (^oN)', 'FontSize', 20) % Y-axis label
title('RF13 Methane Concentrations', 'FontSize', 30) % Plot title
grid on % Turning on the major grid
grid minor % Turning on the minor grid

%% Figure 2
% Flight path colored by ammonia concentration
figure
scatter(AVlon, AVlat, 5, NH3, 'filled') % Plots the flight path colored by ammonia concentration
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c2=colorbar; % Showing colorbar
c2.Label.String = 'Ammonia Concentration [ppbv]'; % Labeling the colorbar
set(c2, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 100]) % Sets the minimum and maximum ammonia concentration for the colorbar
xlabel('Longitude (^oE)', 'FontSize', 20) % X-axis label
ylabel('Latitude (^oN)', 'FontSize', 20) % Y-axis label
title('RF13 Ammonia Concentrations', 'FontSize', 30') % Plot title
grid on % Turning on the major grid
grid minor % Turning on the minor grid

%% Figure 3
% Flight path colored by ethane concentration
figure
scatter(AVlon, AVlat, 5, C2H6, 'filled') % Plots the flight path colored by ethane concentration
set(gca, 'FontSize', 20) % Setting the font size of the number
c3=colorbar; % Showing colorbar
c3.Label.String = 'Ethane Concentration (ppbv)'; % Labeling the colorbar
set(c3, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 18]) % Sets the minimum and maximum methane concentration for the colorbar
xlabel('Longitude (^oE)', 'FontSize', 20) % X-axis label
ylabel('Latitude (^oN)', 'FontSize', 20) % Y-axis label
title('RF13 Ethane Concentrations', 'FontSize', 30) % Plot title
grid on % Turning on the major grid
grid minor % Turning on the minor grid

%% Figure 4
% Flight path colored by methane including feedlot location

figure
p1 = scatter(-104.601597,40.435182, 100, 'k','filled'); % Location of Producers CAFO
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c4=colorbar; % Showing colorbar
c4.Label.String = 'Methane Concentration (ppb)'; % Labeling colorbar
set(c4, 'FontSize', 40) % Setting the font size of the colorbar
caxis([1.85 2.2]) % Sets the minimum and maximum methane concentration for the colorbar
hold on
p2 = scatter(-104.511,40.3769, 100, 'r','filled'); % Location of JBS Five Rivers Kersey CAFO
p3 = scatter(-104.48439,40.44983, 100, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Location of Monte Vista Dairy; Purple color
p4 = scatter(-104.51102, 40.428269, 100, 'm', 'filled'); % Location of Larson's Farms and Feeding CAFO
p5 = scatter(-104.545259, 40.369655, 100, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Location of Platte Valley Cattle Company CAFO; Orange color
p6 = scatter(-104.526171, 40.362904, 100, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % Location of V&T Cattle (Mendes Ranch) CAFO; Green color
p7 = scatter(-104.47313, 40.45024, 100, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Location of Wells Ranch CAFO; Maroon color
scatter(AVlon(start:done), AVlat(start:done), 7, CH4(start:done), 'filled') % Plots the flight path colored by methane concentration
legend({'Producers', 'JBS Five Rivers Keresy', 'Monte Vista', 'Larsons Farm and Feeding', 'Platte Valley Cattle Company', 'V&T Cattle', 'Wells Ranch'}, 'NumColumns', 2, 'FontSize', 20) % Legend information
xlabel('Longitude (^oE)', 'FontSize', 30) % X-axis label
ylabel('Latitude (^oN)', 'FontSize', 30) % Y-axis label
title('RF13 Methane Concentrations with Feedlot Locations', 'FontSize', 40); % Plot title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Figure 5
% Flight path colored by ammonia including feedlot locations
figure
p1 = scatter(-104.601597,40.435182, 100, 'k','filled'); % Location of Producers CAFO
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c5=colorbar; % Showing colorbar
c5.Label.String = 'Ammonia Concentration [ppbv]'; % Naming the colorbar
set(c5, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 100]) % Sets the minimum and maximum ammonia concentration for the colorbar
hold on
p2 = scatter(-104.511,40.3769, 100, 'r','filled'); % Location of JBS Five Rivers Kersey CAFO
p3 = scatter(-104.48439,40.44983, 100, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Location of Monte Vista Dairy; Purple color
p4 = scatter(-104.51102, 40.428269, 100, 'm', 'filled'); % Location of Larson's Farms and Feeding CAFO
p5 = scatter(-104.545259, 40.369655, 100, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Location of Platte Valley Cattle Company CAFO; Orange color
p6 = scatter(-104.526171, 40.362904, 100, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % Location of V&T Cattle (Mendes Ranch) CAFO; Green color
p7 = scatter(-104.47313, 40.45024, 100, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Location of Wells Ranch CAFO; Maroon color
scatter(AVlon(start:done), AVlat(start:done), 5, NH3(start:done), 'filled') % Plots the flight path colored by ammonia concentration
legend({'Producers', 'JBS Five Rivers Keresy', 'Monte Vista', 'Larsons Farm and Feeding', 'Platte Valley Cattle Company', 'V&T Cattle', 'Wells Ranch'}, 'NumColumns', 2, 'FontSize', 20) % Legend information
xlabel('Longitude (^oE)', 'FontSize', 20) % X-axis label
ylabel('Latitude (^oN)', 'FontSize', 20) % Y-axis label
title('RF13 Ammonia Concentrations with Feedlot Locations', 'FontSize', 30); % Plot title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Figure 6
% Flight path colored by ethane including feedlot location
figure
p1 = scatter(-104.601597,40.435182, 100, 'k','filled'); % Location of Producers CAFO
set(gca, 'FontSize', 20) % Setting the font size of the number
c3=colorbar; % Showing colorbar
c3.Label.String = 'Ethane Concentration (ppbv)'; % Naming the colorbar
set(c3, 'FontSize', 20) % Setting the fontsize of the colorbar
caxis([0 18]) % Sets the minimum and maximum methane concentration for the colorbar
hold on
%Greeley feedlot locations
p2 = scatter(-104.511,40.3769, 100, 'r','filled'); % Location of JBS Five Rivers Kersey CAFO
p3 = scatter(-104.48439,40.44983, 100, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Location of Monte Vista Dairy; Purple color
p4 = scatter(-104.51102, 40.428269, 100, 'm', 'filled'); % Location of Larson's Farms and Feeding CAFO
p5 = scatter(-104.545259, 40.369655, 100, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Location of Platte Valley Cattle Company CAFO; Orange color
p6 = scatter(-104.526171, 40.362904, 100, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % Location of V&T Cattle (Mendes Ranch) CAFO; Green color
p7 = scatter(-104.47313, 40.45024, 100, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Location of Wells Ranch CAFO; Maroon color
scatter(AVlon(start:done), AVlat(start:done), 5, C2H6(start:done), 'filled') % Plots the flight path colored by ethane concentration
legend({'Producers', 'JBS Five Rivers Keresy', 'Monte Vista', 'Larsons Farm and Feeding', 'Platte Valley Cattle Company', 'V&T Cattle', 'Wells Ranch'}, 'NumColumns', 2, 'FontSize', 20) % Legend information
xlabel('Longitude (^oE)', 'FontSize', 20) % X-axis label
ylabel('Latitude (^oN)', 'FontSize', 20) % Y-axis label
title('RF13 Ethane Concentrations with Feedlot Locations', 'FontSize', 30); % Plot title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Figure 7 
% Flight Paths with Map Background

% Accessing map website
baseURL = "https://basemap.nationalmap.gov/ArcGIS/rest/services";

% Accessing the basemap website
usgsURL = baseURL + "/BASEMAP/MapServer/tile/${z}/${y}/${x}";

% Retrieving the basemap
basemaps = ["USGSImageryTopo"];
color = [0.75, 0.75, .2]; % Assigns RBG color for transect numbers

figure
geoscatter(ONG_lat,ONG_lon,30,color,'filled'); % Plotting oil and gas locations
hold on
geoscatter(AVlat(s_fiverivers:e_fiverivers),AVlon(s_fiverivers:e_fiverivers),60,CH4_ppb(s_fiverivers:e_fiverivers),'filled'); % Plots flight path colored by methane concentration
geoscatter(40.3769,-104.511,1000,'p','y','filled'); % Plots the location of the target feedlot
geoscatter(40.44983, -104.48439, 200, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Location of Monte Vista Dairy; Purple color
geoscatter(40.428269, -104.51102, 200, 'k', 'filled'); % Location of Larson's Farms and Feeding CAFO
geoscatter(40.369655, -104.545259, 200, 'k', 'filled'); % Location of Platte Valley Cattle Company CAFO
geoscatter(40.362904, -104.526171, 200, 'k', 'filled'); % Location of V&T Cattle (Mendes Ranch) CAFO
geoscatter(40.45024, -104.47313, 200, 'k', 'filled'); % Location of Wells Ranch CAFO
geolimits([40.32 40.6],[-104.6 -104.2]) % Sets the longitude and latitude limits of the map
set(gca, 'FontSize', 20) % Setting the font size of the numbers
geobasemap(basemaps) % Plots the basemap background
colormap(flipud(mycolormap)) % Flips the colorbar
caxis([1920 2200]) % Sets the minimum and maximum methane concentration for the colorbar
text(40.409,-104.530783, '1', 'Color','w','FontSize',30) % Transect 1 label
text(40.448,-104.49983, '2', 'Color','w','FontSize',30) % Transect 2 label
text(40.468,-104.46683, '3', 'Color','w','FontSize',30) % Transect 3 label
text(40.504,-104.43083, '4', 'Color','w','FontSize',30) % Transect 4 label
text(40.528,-104.44083, '5', 'Color','w','FontSize',30) % Transect 5 label
c = colorbar; % Shows the colorbar to the right of the plot
c.Label.String = 'CH_4 (ppbv)'; % Creates the colorbar label


%% Figure 8
% Flight Paths with Map Background

figure
geoscatter(ONG_lat,ONG_lon,30,color,'filled'); % Plotting oil and gas locations
hold on
geoscatter(AVlat(s_fiverivers:e_fiverivers),AVlon(s_fiverivers:e_fiverivers),60,NH3(s_fiverivers:e_fiverivers),'filled'); % Plots flight path colored by methane concentration
geoscatter(40.3769,-104.511,1000,'p','y','filled'); % Plots the location of the target feedlot
geoscatter(40.44983, -104.48439, 200, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Location of Monte Vista Dairy; Purple color
geoscatter(40.428269, -104.51102, 200, 'k', 'filled'); % Location of Larson's Farms and Feeding CAFO
geoscatter(40.369655, -104.545259, 200, 'k', 'filled'); % Location of Platte Valley Cattle Company CAFO
geoscatter(40.362904, -104.526171, 200, 'k', 'filled'); % Location of V&T Cattle (Mendes Ranch) CAFO
geoscatter(40.45024, -104.47313, 200, 'k', 'filled'); % Location of Wells Ranch CAFO
geolimits([40.32 40.6],[-104.6 -104.2]) % Sets the longitude and latitude limits of the map
set(gca, 'FontSize', 20) % Setting the font size of the numbers
geobasemap(basemaps) % Plots the basemap background
colormap(flipud(mycolormap)) % Flips the colorbar
caxis([0 200]) % Sets the minimum and maximum ammonia concentration for the colorbar
text(40.409,-104.530783, '1', 'Color','w','FontSize',30) % Transect 1 label
text(40.448,-104.49983, '2', 'Color','w','FontSize',30) % Transect 2 label
text(40.468,-104.46683, '3', 'Color','w','FontSize',30) % Transect 3 label
text(40.504,-104.43083, '4', 'Color','w','FontSize',30) % Transect 4 label
text(40.528,-104.44083, '5', 'Color','w','FontSize',30) % Transect 5 label
c = colorbar; % Shows the colorbar to the right of the plot
c.Label.String = 'NH_3 (ppbv)';  % Creates the colorbar label









