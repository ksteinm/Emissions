% Katie Steinmann
% University of Wyoming
% Contact: ksteinma@uwuo.edu
% Description: Reads in data from .csv file, renames variables, and creates
% constants used other RF13 coding files.
% Code is modified from Megan McCabe

%% Reading in data

M = importdata('RF13_merge_1Hz.csv',',',1); % 1 header lines and comma for deliminator,
v = genvarname(M.colheaders); % get variable names from headers
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

% Start and end index points associated with feedlot sampling
start = 1700;
done = 10700;

% Radius of the Earth
R = 6366308.7; % [m]

% Universal Gas Constant
R_star = 8.314; % [J/(mol*K)]

% Height of boundary layer
PBL = 2000; % [m]

% Height of ground above sea level
Ground = round(mean(topo(start:done), 'omitnan')); % [m]

%% Conversions

% Methane conversion
CH4_ppb = CH4 .* 1000; % [ppbv]

% Pressure
Press_Pa = ps_hads_a .* 100; % [Pa]

% Temperature
Temp_K = temp + 273.15; % [K]

n = 1;
