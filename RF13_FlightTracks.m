% Katie Steinmann
% University of Wyoming
% Plots the flight track of the UWKA during RF13 of TRANS2Am
% Figures 1, 2, and 3 show the entire flight track
% Figures 4, 5, and 6 show the area of interest with the locations of the
    % CAFOS
% Figures 7 and 8 show the flight track associated with the JBS Five Rivers
    % facility and CAFOs and dairies in the region
% Figures 9 and 10 show the flight track associated with the Producers
    % facility and CAFOs and dairies in the region
% Code modified from Megan McCabe

%% Reading in data

M = importdata('RF13_merge_1Hz.csv',',',1); % 1 header lines and comma for deliminator, 
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

% Found by looking at flight path
s_Producers = 1700; % Beginning of feedlot sampling
e_Producers = 5750; % End of feelot sampling

% Reading in VAFO location information
CAFO_file = readtable('CAFO_cattle.xlsx');

% Reading in variables
CAFO_lat = CAFO_file{:, 1}; % Latitudes of CAFOs [degrees north]
CAFO_lon = CAFO_file{:, 2}; % Longitudes of CAFOs [degrees east]

% Reading in oila and gas information
ONG_file = readtable('oil_and_gas.xlsx');

ONG_lat = ONG_file{:, 1}; % Latitudes of oil and gas sites [degrees north]
ONG_lon = ONG_file{:, 2}; % Longitudes of oila and gas sites [degrees east]

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

%% Conversion

% Methane conversion
CH4_ppb = CH4 .* 1000; % [ppbv]

%% Figure 1
% Flight path colored by methane concentration

figure
scatter(AVlon, AVlat, 5, CH4, 'filled')
set(gca, 'FontSize', 20)
c1=colorbar;
c1.Label.String = 'Methane Concentration (ppmv)';
set(c1, 'FontSize', 20)
clim([1.8 2])
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
title('RF13 Methane Concentrations', 'FontSize', 30)
grid on
grid minor

%% Figure 2
% Flight path colored by ammonia concentration

figure
scatter(AVlon, AVlat, 5, NH3, 'filled')
set(gca, 'FontSize', 20)
c2=colorbar;
c2.Label.String = 'Ammonia Concentration [ppbv]';
set(c2, 'FontSize', 20)
clim([0 100])
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
title('RF13 Ammonia Concentrations', 'FontSize', 30')
grid on
grid minor

%% Figure 3
% Flight path colored by ethane concentration

figure
scatter(AVlon, AVlat, 5, C2H6, 'filled')
set(gca, 'FontSize', 20)
c3=colorbar;
c3.Label.String = 'Ethane Concentration (ppbv)';
set(c3, 'FontSize', 20)
clim([0 18])
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
title('RF13 Ethane Concentrations', 'FontSize', 30)
grid on
grid minor

%% Figure 4
% Flight path colored by methane including feedlot location

figure
p4a = scatter(-104.601597,40.435182, 100, 'k','filled'); % Producers
set(gca, 'FontSize', 20)
c4=colorbar;
c4.Label.String = 'Methane Concentration (ppb)';
set(c4, 'FontSize', 40)
clim([1.85 2.2])
hold on
p4b = scatter(-104.511,40.3769, 100, 'r','filled'); % JBS Five Rivers Kersey
p4c = scatter(-104.48439,40.44983, 100, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Monte Vista Dairy; Purple color
p4d = scatter(-104.51102, 40.428269, 100, 'm', 'filled'); % Larson's Farms and Feeding
p4e = scatter(-104.545259, 40.369655, 100, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Platte Valley Cattle Company; Orange color
p4f = scatter(-104.526171, 40.362904, 100, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % V&T Cattle (Mendes Ranch); Green color
p4g = scatter(-104.47313, 40.45024, 100, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Wells Ranch; Maroon color
scatter(AVlon(start:done), AVlat(start:done), 7, CH4(start:done), 'filled')
legend({'Producers', 'JBS Five Rivers Keresy', 'Monte Vista', 'Larsons Farm and Feeding', 'Platte Valley Cattle Company', 'V&T Cattle', 'Wells Ranch'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 30)
ylabel('Latitude (^oN)', 'FontSize', 30)
title('RF13 Methane Concentrations with Feedlot Locations', 'FontSize', 40);
grid on
grid minor 

%% Figure 5
% Flight path colored by ammonia including feedlot locations

figure
p5a = scatter(-104.601597,40.435182, 100, 'k','filled'); % Producers
set(gca, 'FontSize', 20)
c5=colorbar;
c5.Label.String = 'Ammonia Concentration [ppbv]';
set(c5, 'FontSize', 20)
clim([0 100])
hold on
p5b = scatter(-104.511,40.3769, 100, 'r','filled'); % JBS Five Rivers Kersey
p5c = scatter(-104.48439,40.44983, 100, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Monte Vista Dairy; Purple color
p5d = scatter(-104.51102, 40.428269, 100, 'm', 'filled'); % Larson's Farms and Feeding
p5e = scatter(-104.545259, 40.369655, 100, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Platte Valley Cattle Company; Orange color
p5f = scatter(-104.526171, 40.362904, 100, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % V&T Cattle (Mendes Ranch); Green color
p5g = scatter(-104.47313, 40.45024, 100, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Wells Ranch; Maroon color
scatter(AVlon(start:done), AVlat(start:done), 5, NH3(start:done), 'filled')
legend({'Producers', 'JBS Five Rivers Keresy', 'Monte Vista', 'Larsons Farm and Feeding', 'Platte Valley Cattle Company', 'V&T Cattle', 'Wells Ranch'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
title('RF13 Ammonia Concentrations with Feedlot Locations', 'FontSize', 30);
grid on
grid minor

%% Figure 6
% Flight path colored by ethane including feedlot location

figure
p6a = scatter(-104.601597,40.435182, 100, 'k','filled'); % Producers CAFO
set(gca, 'FontSize', 20)
c6=colorbar;
c6.Label.String = 'Ethane Concentration (ppbv)';
set(c6, 'FontSize', 20)
clim([0 18])
hold on
p6b = scatter(-104.511,40.3769, 100, 'r','filled'); % JBS Five Rivers Kersey
p6c = scatter(-104.48439,40.44983, 100, 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]); % Monte Vista Dairy; Purple color
p6d = scatter(-104.51102, 40.428269, 100, 'm', 'filled'); % Larson's Farms and Feeding
p6e = scatter(-104.545259, 40.369655, 100, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Platte Valley Cattle Company; Orange color
p6f = scatter(-104.526171, 40.362904, 100, 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]); % V&T Cattle (Mendes Ranch); Green color
p6g = scatter(-104.47313, 40.45024, 100, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Wells Ranch; Maroon color
scatter(AVlon(start:done), AVlat(start:done), 5, C2H6(start:done), 'filled')
legend({'Producers', 'JBS Five Rivers Keresy', 'Monte Vista', 'Larsons Farm and Feeding', 'Platte Valley Cattle Company', 'V&T Cattle', 'Wells Ranch'}, 'NumColumns', 2, 'FontSize', 20)
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
title('RF13 Ethane Concentrations with Feedlot Locations', 'FontSize', 30);
grid on
grid minor

%% Figure 7 
% JBS Flight Path with Map Background

% Accessing map website
baseURL = "https://basemap.nationalmap.gov/ArcGIS/rest/services";

% Accessing the basemap website
usgsURL = baseURL + "/BASEMAP/MapServer/tile/${z}/${y}/${x}";

% Retrieving the basemap
basemaps = "USGSImageryTopo";

figure
% Plotting oil and gas locations
geoscatter(ONG_lat,ONG_lon,30,'k','filled');
hold on
geoscatter(AVlat(s_fiverivers:e_fiverivers),AVlon(s_fiverivers:e_fiverivers),60,CH4_ppb(s_fiverivers:e_fiverivers),'filled');
geoscatter(40.3769,-104.511,2000,'p','y','filled'); % Target feedolot
geoscatter(40.44983, -104.48439, 300, 'g', 'filled'); % Dairy; Purple color
geoscatter(40.428269, -104.51102, 300, 'y', 'filled'); % Cattle
geoscatter(40.369655, -104.545259, 300, 'y', 'filled'); % Cattle
geoscatter(40.362904, -104.526171, 300, 'y', 'filled'); % Cattle
geoscatter(40.45024, -104.47313, 300, 'y', 'filled'); % Cattle
% Map limits
geolimits([40.32 40.6],[-104.6 -104.2])
set(gca, 'FontSize', 20)
geobasemap(basemaps)
colormap(flipud(mycolormap))
clim([1920 2200])
c7 = colorbar;
c7.Label.String = 'CH_4 (ppbv)';


%% Figure 8
% JBS Flight Path with Map Background

figure
% Plotting oil and gas locations
geoscatter(ONG_lat,ONG_lon,30,'k','filled');
hold on
geoscatter(AVlat(s_fiverivers:e_fiverivers),AVlon(s_fiverivers:e_fiverivers),60,NH3(s_fiverivers:e_fiverivers),'filled');
geoscatter(40.3769,-104.511,2000,'p','y','filled'); % Target feedlot
geoscatter(40.44983, -104.48439, 300, 'g', 'filled'); % Dairy; Purple color
geoscatter(40.428269, -104.51102, 300, 'y', 'filled'); % Cattle
geoscatter(40.369655, -104.545259, 300, 'y', 'filled'); % Cattle
geoscatter(40.362904, -104.526171, 300, 'y', 'filled'); % Cattle
geoscatter(40.45024, -104.47313, 300, 'y', 'filled'); % Cattle
% Map limits
geolimits([40.32 40.6],[-104.6 -104.2])
set(gca, 'FontSize', 20)
geobasemap(basemaps)
colormap(flipud(mycolormap))
clim([0 200])
c8 = colorbar;
c8.Label.String = 'NH_3 (ppbv)';

%% Figure 9 
% Flight Paths of Producers with Map Background

figure
% Plotting oil and gas locations
geoscatter(ONG_lat,ONG_lon,70,'k','filled');
hold on
geoscatter(AVlat(s_Producers:e_Producers),AVlon(s_Producers:e_Producers),60,CH4_ppb(s_Producers:e_Producers),'filled');
geoscatter(40.435182, -104.601597, 2000, 'p', 'y', 'filled') % Target feedlot
geoscatter(40.492649, -104.522827, 300, 'g', 'filled'); % Dairy
geoscatter(40.42848, -104.59066, 300, 'y', 'filled'); % Cattle
geoscatter(40.4849, -104.5431667, 300, 'g', 'filled'); % Dairy
geoscatter(40.49397, -104.65371, 300, 'y', 'filled'); % Cattle
geoscatter(40.4951, -104.5834, 300, 'y', 'filled'); % Cattle
geoscatter(40.428269, -104.51102, 300, 'y', 'filled'); % Cattle
% Map limits
geolimits([40.35 40.55],[-104.7 -104.4])
set(gca, 'FontSize', 20)
geobasemap(basemaps)
colormap(flipud(mycolormap))
clim([1920 2400])
c9 = colorbar;
c9.Label.String = 'CH_4 (ppbv)';

%% Figure 10
% Flight Paths of Producers with Map Background

figure
% Plotting oil and gas locations
geoscatter(ONG_lat,ONG_lon,70,'k','filled');
hold on
geoscatter(AVlat(s_Producers:e_Producers),AVlon(s_Producers:e_Producers),60,NH3(s_Producers:e_Producers),'filled');
geoscatter(40.435182, -104.601597, 2000, 'p', 'y', 'filled') % Target feedlot
geoscatter(40.492649, -104.522827, 300, 'g', 'filled'); % Dairy
geoscatter(40.42848, -104.59066, 300, 'y', 'filled'); % Cattle
geoscatter(40.4849, -104.5431667, 300, 'g', 'filled'); % Dairy
geoscatter(40.49397, -104.65371, 300, 'y', 'filled'); % Cattle
geoscatter(40.4951, -104.5834, 300, 'y', 'filled'); % Cattle
geoscatter(40.428269, -104.51102, 300, 'y', 'filled'); % Cattle
% Map limits
geolimits([40.35 40.55],[-104.7 -104.4])
set(gca, 'FontSize', 20)
geobasemap(basemaps)
colormap(flipud(mycolormap))
clim([0 200])
c10 = colorbar;
c10.Label.String = 'NH_3 (ppbv)';







