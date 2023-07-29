% Katie Steinmann
% University of Wyoming
% Calculates the air density for TRANS2Am RF 13
% Figure 1 - Temperature vs. pressure plot colored by density
% Needed Functions: Density
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
start = 1700; % Beginning of feedlot sampling
done = 10700; % End of feelot sampling

% Found by looking at flight path
s_fiverivers = 5730; % Start of five rivers observations
e_fiverivers = 10500; % End of five rivers observation

% Found by looking at flight path
s_Producers = 1700; % Beginning of feedlot sampling
e_Producers = 5750; % End of feelot sampling

% Universal Gas Constant
R_star = 8.314; % [J/(mol*K)]

%% Conversions

% Pressure
Press_Pa = ps_hads_a .* 100; % [Pa]

% Temperature
Temp_K = temp + 273.15; % [K]

%% Transects
% Same transects as in RF13_Transects.m

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

% Transects corresponding with JBS Five Rivers Feedlot
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

%% Calculating Density

rho = Density(Press_Pa, R_star, Temp_K); % [mol/(m^3)]

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

%% Finding Entire Transect Data
% Combines transect leg data 

Trans1S_Temp = NaN(size(temp));

Trans1N_Temp = NaN(size(temp));

Trans2S_Temp  = NaN(size(temp));

Trans2N_Temp  = NaN(size(temp));

Trans3S_Temp = NaN(size(temp));

Trans3N_Temp = NaN(size(temp));

Trans4S_Temp  = NaN(size(temp));

Trans4N_Temp = NaN(size(temp));

Trans5S_Temp  = NaN(size(temp));

for i = 1:length(temp)
    % Transect 1 North Legs -------------------------------------------
    if i >= trans1_a_start && i <= trans1_a_end  || i >= trans1_c_start && i <= trans1_c_end || i >= trans1_e_start && i <= trans1_e_end
        Trans1N_Temp(i) = temp(i);
    end
    % Transect 1 South Legs -------------------------------------------
    if i >= trans1_b_start && i <= trans1_b_end || i >= trans1_d_start && i <= trans1_d_end
        Trans1S_Temp(i) = temp(i);
    end
    % Transect 2 South Legs -------------------------------------------
    if i >= trans2_a_start && i <= trans2_a_end || i >= trans2_c_start && i <= trans2_c_end || i >= trans2_e_start && i <= trans2_e_end || i >= trans2_g_start && i <= trans2_g_end
        Trans2S_Temp(i) = temp(i);
    end
    % Transect 2 North Legs -------------------------------------------
    if i >= trans2_b_start && i <= trans2_b_end || i >= trans2_d_start && i <= trans2_d_end || i >= trans2_f_start && i <= trans2_f_end
        Trans2N_Temp(i) = temp(i);
    end
    % Transect 3 Southwest Legs ---------------------------------------
    if i >= trans3_b_start && i <= trans3_b_end || i >= trans3_d_start && i <= trans3_d_end || i >= trans3_f_start && i <= trans3_f_end
        Trans3S_Temp(i) = temp(i);
    end
    % Transect 3 Northeast Legs ---------------------------------------
    if i >= trans3_a_start && i <= trans3_a_end || i >= trans3_c_start && i <= trans3_c_end || i >= trans3_e_start && i <= trans3_e_end
        Trans3N_Temp(i) = temp(i);
    end
    % Transect 4 Southwest Legs ---------------------------------------
    if i >= trans4_b_start && i <= trans4_b_end || i >= trans4_e_start && i <= trans4_e_end || i >= trans4_f_start && i <= trans4_f_end
        Trans4S_Temp(i) = temp(i);
    end
    % Transect 4 Northeast Legs ---------------------------------------
    if i >= trans4_a_start && i <= trans4_a_end || i >= trans4_c_start && i <= trans4_c_end || i >= trans4_d_start && i <= trans4_d_end
        Trans4N_Temp(i) = temp(i);
    end
    % Transect 5 Southwest Legs ---------------------------------------
    if i >= trans5_b_start && i <= trans5_b_end || i >= trans5_d_start && i <= trans5_d_end || i >= trans5_f_start && i <= trans5_f_end
        Trans5S_Temp(i) = temp(i);
    end
end

%% Average Temperatures

AVG_Prod_1N = mean(Trans1N_Temp, 'omitnan');
a = ['Averge Temperature for Transect 1-North = ', num2str(AVG_Prod_1N)];
disp(a)

AVG_Prod_1S = mean(Trans1S_Temp, 'omitnan');
b = ['Averge Teperature for Transect 1-South = ', num2str(AVG_Prod_1S)];
disp(b)

AVG_Prod_2S = mean(Trans2S_Temp, 'omitnan');
c = ['Averge Temperature for Transect 2-South = ', num2str(AVG_Prod_2S)];
disp(c)

AVG_Prod_2N = mean(Trans2N_Temp, 'omitnan');
d = ['Averge Temperature for Transect 2-North = ', num2str(AVG_Prod_2N)];
disp(d)

AVG_JBS_1 = mean(Trans3S_Temp, 'omitnan');
e = ['Averge Temperature for JBS Transect 1 = ', num2str(AVG_JBS_1)];
disp(e)

AVG_JBS_2 = mean(Trans3N_Temp, 'omitnan');
f = ['Averge Temperature for JBS Transect 2 = ', num2str(AVG_JBS_2)];
disp(f)

AVG_JBS_3 = mean(Trans4S_Temp, 'omitnan');
g = ['Averge Temperature for JBS Transect 3 = ', num2str(AVG_JBS_3)];
disp(g)

AVG_JBS_4 = mean(Trans4N_Temp, 'omitnan');
h = ['Averge Temperature for JBS Transect 4 = ', num2str(AVG_JBS_4)];
disp(h)

AVG_JBS_5 = mean(Trans5S_Temp, 'omitnan');
i = ['Averge Temperature for JBS Transect 5 = ', num2str(AVG_JBS_5)];
disp(i)

AVG_Prod = mean(temp(s_Producers:e_Producers), 'omitnan');
j = ['Average Temperature for Producer Transects = ', num2str(AVG_Prod)];
disp(j)

AVG_JBS = mean(temp(s_fiverivers:e_fiverivers), 'omitnan');
k = ['Average Temperature for JBS Transects = ', num2str(AVG_JBS)];
disp(k)

AVG_Temp = mean(temp(start:done), 'omitnan');
l = ['Average Temperature for Sampling CAFOS = ', num2str(AVG_Temp)];
disp(l)
