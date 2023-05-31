% Katie Steinmann
% University of Wyoming
% Sets flight transects
% Figure 1 - Flight track plot showing transects
% Figures 2, 5, 8, 11, 14, 17, 20, 23, 26 - Plots Distance from the center
    % of the transect and altitude colored by methane 
% Figures 3, 6, 9, 12, 15, 18, 21, 24, 27 - Plots distance from the center
    % of the transect and altitude colored by ammonia
% Figures 4, 7, 10, 13, 16, 19, 22, 25, 28 - Plots distance from the center
    % of the transect and altitude colored by ethane
% Figure 29 plots methane, ehtane, and correlation line to determine the
    % ONG influence on the data
% Code modified from Megan MCabe

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

% Radius of the Earth
R=6366308.7; % [m]

%% Identifying Transects

% Feedlot identification done by eye
% Transects corresponding to Producers feedlot
% Transect 1 -------------------------------------------------------------
% Leg 1
trans1_a_start = 2770; % Index value of the start of the transect leg at 1,764 m
trans1_a_end = 2840; % Index value of the end of the transect leg at 1,735 m
Center_1a = ((trans1_a_end - trans1_a_start) / 2) + trans1_a_start; % Calculates the center of the leg

% Leg 2
trans1_b_start = 2905; % Index value of the start of the transect leg at 1,765 m
trans1_b_end = 2965; % Index value of the end of the transect leg at 1,697 m
Center_1b = ((trans1_b_end - trans1_b_start) / 2) + trans1_b_start; % Calculates the center of the leg

% Leg 3
trans1_c_start = 3050; % Index value of the start of the transect leg at 1,787 m
trans1_c_end = 3120; % Index value of the end of the transect leg at 1,715 m
Center_1c = ((trans1_c_end - trans1_c_start) / 2) + trans1_c_start; % Calculates the center of the leg

% Leg 4
trans1_d_start = 3186; % Index value of the start of the transect leg at 1,605 m
trans1_d_end = 3250; % Index value of the end of the transect leg at 1,573 m
Center_1d = ((trans1_d_end - trans1_d_start) / 2) + trans1_d_start; % Calculates the center of the leg

% Leg 5
trans1_e_start = 3345; % Index value of the start of the transect leg at 1,622 m
trans1_e_end = 3415; % Index value of the end of the transect leg at 1,635 m
Center_1e = ((trans1_e_end - trans1_e_start) / 2) + trans1_e_start; % Calculates the center of the leg

% Transect 2 -------------------------------------------------------------
% Leg 1
trans2_a_start = 3630; % Index value of the start of the transect leg at 1,758 m
trans2_a_end = 3680; % Index value of the end of the transect leg at 1,746 m
Center_2a = ((trans2_a_end - trans2_a_start) / 2) + trans2_a_start;

% Leg 2
trans2_b_start = 3785; % Index value of the start of the transect leg at 1,732 m
trans2_b_end = 3855; % Index value of the end of the transect leg at 1,772 m
Center_2b = ((trans2_b_end - trans2_b_start) / 2) + trans2_b_start;

% Leg 3
trans2_c_start = 3915; % Index value of the start of the transect leg at 1,646 m
trans2_c_end = 3965; % Index value of the end of the transect leg at 1,590 m
Center_2c = ((trans2_c_end - trans2_c_start) / 2) + trans2_c_start;

% Leg 4
trans2_d_start = 4080; % Index value of the start of the transect leg at 1,628 m
trans2_d_end = 4135; % Index value of the end of the transect leg at 1,599 m
Center_2d = round(((trans2_d_end - trans2_d_start) / 2) + trans2_d_start);

% Leg 5
trans2_e_start = 4215; % Index value of the start of the transect leg at 1,845 m
trans2_e_end = 4260; % Index value of the end of the transect leg at 1,918 m
Center_2e = round(((trans2_e_end - trans2_e_start) / 2) + trans2_e_start);

% Leg 6
trans2_f_start = 4360; % Index value of the start of the transect leg at 1,980 m
trans2_f_end = 4420; % Index value of the end of the transect leg at 1,901 m
Center_2f = round(((trans2_f_end - trans2_e_start) / 2) + trans2_f_start);

% Leg 7
trans2_g_start = 4480; % Index value of the start of the transect leg at 1,954 m
trans2_g_end = 4530; % Index value of the end of the transect leg at 1,884 m
Center_2g = ((trans2_g_end - trans2_g_start) / 2) + trans2_g_start;

% Transects corresponding with JBS Five Rivers Feedlot
% Transect 3 -------------------------------------------------------------
% Leg 1
trans3_a_start = 6228; % Index value of the start of the transect leg at 1,731 m
trans3_a_end = 6340; % Index value of the end of the transect leg at 1,748 m
Center_3a = ((trans3_a_end - trans3_a_start) / 2) + trans3_a_start;

% Leg 2
trans3_b_start = 6400; % Index value of the start of the transect leg at 1803 m
trans3_b_end = 6540; % Index value of the end of the transect leg at 1,649 m
Center_3b = ((trans3_b_end - trans3_b_start) / 2) + trans3_b_start;

% Leg 3
trans3_c_start = 6600; % Index value of the start of the transect leg at 1,551 m
trans3_c_end = 6700; % Index value of the end of the transect leg at 1,573 m
Center_3c = ((trans3_c_end - trans3_c_start) / 2) + trans3_c_start;

% Leg 4
trans3_d_start = 6740; % Index value of the start of the transect leg at 1,618 m
trans3_d_end = 6880; % Index value of the end of the transect leg at 1,775 m
Center_3d = ((trans3_d_end - trans3_d_start) / 2) + trans3_d_start;

% Leg 5
trans3_e_start = 6920; % Index value of the start of the transect leg at 1,863 m
trans3_e_end = 7020; % Index value of the end of the transect leg at 1,888 m
Center_3e = ((trans3_e_end - trans3_e_start) / 2) + trans3_e_start;

% Leg 6
trans3_f_start = 7080; % Index value of the start of the transect leg at 1,905 m
trans3_f_end = 7220; % Index value of the end of the transect leg at 1,862 m
Center_3f = ((trans3_f_end - trans3_f_start) / 2) + trans3_f_start;

% Transect 4 -------------------------------------------------------------
% Leg 1
trans4_a_start = 7350; % Index value of the start of the transect leg at 1,773 m
trans4_a_end = 7480; % Index value of the end of the transect leg at 1,762 m
Center_4a = ((trans4_a_end - trans4_a_start) / 2) + trans4_a_start;

% Leg 2
trans4_b_start = 7500; % Index value of the start of the transect leg at 1,778 m
trans4_b_end = 7640; % Index value of the end of the transect leg at 1,708 m
Center_4b = ((trans4_b_end - trans4_b_start) / 2) + trans4_b_start;

% Leg 3
trans4_c_start = 7680; % Index value of the start of the transect leg at 1,622 m
trans4_c_end = 7800; % Index value of the end of the transect leg at 1,636 m
Center_4c = ((trans4_c_end - trans4_c_start) / 2) + trans4_c_start;

% Leg 4
trans4_d_start = 8300; % Index value of the start of the transect leg at 1,878 m
trans4_d_end = 8450; % Index value of the end of the transect leg at 1,897 m
Center_4d = ((trans4_d_end - trans4_d_start) / 2) + trans4_d_start;

% Leg 5
trans4_e_start = 8480; % Index value of the start of the transect leg at 1,927 m
trans4_e_end = 8600; % Index value of the end of the transect leg at 1,864 m
Center_4e = ((trans4_e_end - trans4_e_start) / 2) + trans4_e_start;

% Leg 6
trans4_f_start = 7840; % Index value of the start of the transect leg at 1,645 m
trans4_f_end = 7950; % Index value of the end of the transect leg at 1,812 m
Center_4f = ((trans4_f_end - trans4_f_start) / 2) + trans4_f_start;

% Transect 5 --------------------------------------------------------------
% Leg 2
trans5_b_start = 8900; % Index value of the start of the transect leg at 1,763 m
trans5_b_end = 9000; % Index value of the end of the transect leg at 1,792 m
Center_5b = ((trans5_b_end - trans5_b_start) / 2) + trans5_b_start;

% Leg 4
trans5_d_start = 9250; % Index value of the start of the transect leg at 1,749 m
trans5_d_end = 9420; % Index value of the end of the transect leg at  1,701 m
Center_5d = ((trans5_d_end - trans5_d_start) / 2) + trans5_d_start;

% Leg 6
trans5_f_start = 9700; % Index value of the start of the transect leg at 1,629 m
trans5_f_end = 9870; % Index value of the end of the transect leg at 
Center_5f = ((trans5_f_end - trans5_f_start) / 2) + trans5_f_start;

%% Figure 1
% Flight track with transects

figure
scatter(AVlon(start:done), AVlat(start:done), 5, CH4(start:done), 'filled')
set(gca, 'FontSize', 20) % Setting the font size of the numbers
c4=colorbar; % Showing colorbar
c4.Label.String = 'Methane Concentration (ppb)'; % Naming the colorbar
set(c4, 'FontSize', 20) % Setting the font size of the colorbar
caxis([1.85 2.2]) % Setting the colorbar range
hold on
% Transect 1
scatter(AVlon(trans1_a_start:trans1_a_end), AVlat(trans1_a_start:trans1_a_end), 10, 'r', 'filled');
scatter(AVlon(trans1_b_start:trans1_b_end), AVlat(trans1_b_start:trans1_b_end), 10, 'g', 'filled');
scatter(AVlon(trans1_c_start:trans1_c_end), AVlat(trans1_c_start:trans1_c_end), 10, 'k', 'filled');
scatter(AVlon(trans1_d_start:trans1_d_end), AVlat(trans1_d_start:trans1_d_end), 10, 'm', 'filled');
scatter(AVlon(trans1_e_start:trans1_e_end), AVlat(trans1_e_start:trans1_e_end), 10, 'c', 'filled');
% Transect 2
scatter(AVlon(trans2_a_start:trans2_a_end), AVlat(trans2_a_start:trans2_a_end), 10, 'r', 'filled');
scatter(AVlon(trans2_b_start:trans2_b_end), AVlat(trans2_b_start:trans2_b_end), 10, 'g', 'filled');
scatter(AVlon(trans2_c_start:trans2_c_end), AVlat(trans2_c_start:trans2_c_end), 10, 'k', 'filled');
scatter(AVlon(trans2_d_start:trans2_d_end), AVlat(trans2_d_start:trans2_d_end), 10, 'm', 'filled');
scatter(AVlon(trans2_e_start:trans2_e_end), AVlat(trans2_e_start:trans2_e_end), 10, 'c', 'filled');
scatter(AVlon(trans2_f_start:trans2_f_end), AVlat(trans2_f_start:trans2_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
scatter(AVlon(trans2_g_start:trans2_g_end), AVlat(trans2_g_start:trans2_g_end), 10, 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]); % Orange
% Transect 3
scatter(AVlon(trans3_a_start:trans3_a_end), AVlat(trans3_a_start:trans3_a_end), 10, 'r', 'filled');
scatter(AVlon(trans3_b_start:trans3_b_end), AVlat(trans3_b_start:trans3_b_end), 10, 'g', 'filled');
scatter(AVlon(trans3_c_start:trans3_c_end), AVlat(trans3_c_start:trans3_c_end), 10, 'k', 'filled');
scatter(AVlon(trans3_d_start:trans3_d_end), AVlat(trans3_d_start:trans3_d_end), 10, 'm', 'filled');
scatter(AVlon(trans3_e_start:trans3_e_end), AVlat(trans3_e_start:trans3_e_end), 10, 'c', 'filled');
scatter(AVlon(trans3_f_start:trans3_f_end), AVlat(trans3_f_start:trans3_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% Transect 4 
scatter(AVlon(trans4_a_start:trans4_a_end), AVlat(trans4_a_start:trans4_a_end), 10, 'r', 'filled');
scatter(AVlon(trans4_b_start:trans4_b_end), AVlat(trans4_b_start:trans4_b_end), 10, 'g', 'filled');
scatter(AVlon(trans4_c_start:trans4_c_end), AVlat(trans4_c_start:trans4_c_end), 10, 'k', 'filled');
scatter(AVlon(trans4_d_start:trans4_d_end), AVlat(trans4_d_start:trans4_d_end), 10, 'm', 'filled');
scatter(AVlon(trans4_e_start:trans4_e_end), AVlat(trans4_e_start:trans4_e_end), 10, 'c', 'filled');
scatter(AVlon(trans4_f_start:trans4_f_end), AVlat(trans4_f_start:trans4_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
% Transect 5
scatter(AVlon(trans5_b_start:trans5_b_end), AVlat(trans5_b_start:trans5_b_end), 10, 'g', 'filled');
scatter(AVlon(trans5_d_start:trans5_d_end), AVlat(trans5_d_start:trans5_d_end), 10, 'm', 'filled');
scatter(AVlon(trans5_f_start:trans5_f_end), AVlat(trans5_f_start:trans5_f_end), 10, 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]); % Maroon
hold off
xlabel('Longitude (^oE)', 'FontSize', 20) % Naming the x-axis
ylabel('Latitude (^oN)', 'FontSize', 20) % Naming the y-axis
title('RF 13 Transects', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Calculating Distance from Center of Transect
% Calls function Distance

% Producers Feedlot
% Transect 1
Distance_1a = Distance(R, deg2rad(AVlat(Center_1a)), deg2rad(AVlon(Center_1a)), deg2rad(AVlat(trans1_a_start:trans1_a_end)), deg2rad(AVlon(trans1_a_start:trans1_a_end)));
Distance_1b = Distance(R, deg2rad(AVlat(Center_1b)), deg2rad(AVlon(Center_1b)), deg2rad(AVlat(trans1_b_start:trans1_b_end)), deg2rad(AVlon(trans1_b_start:trans1_b_end)));
Distance_1c = Distance(R, deg2rad(AVlat(Center_1c)), deg2rad(AVlon(Center_1c)), deg2rad(AVlat(trans1_c_start:trans1_c_end)), deg2rad(AVlon(trans1_c_start:trans1_c_end)));
Distance_1d = Distance(R, deg2rad(AVlat(Center_1d)), deg2rad(AVlon(Center_1d)), deg2rad(AVlat(trans1_d_start:trans1_d_end)), deg2rad(AVlon(trans1_d_start:trans1_d_end)));
Distance_1e = Distance(R, deg2rad(AVlat(Center_1e)), deg2rad(AVlon(Center_1e)), deg2rad(AVlat(trans1_e_start:trans1_e_end)), deg2rad(AVlon(trans1_e_start:trans1_e_end)));

% Transect 2
Distance_2a = Distance(R, deg2rad(AVlat(Center_2a)), deg2rad(AVlon(Center_2a)), deg2rad(AVlat(trans2_a_start:trans2_a_end)), deg2rad(AVlon(trans2_a_start:trans2_a_end)));
Distance_2b = Distance(R, deg2rad(AVlat(Center_2b)), deg2rad(AVlon(Center_2b)), deg2rad(AVlat(trans2_b_start:trans2_b_end)), deg2rad(AVlon(trans2_b_start:trans2_b_end)));
Distance_2c = Distance(R, deg2rad(AVlat(Center_2c)), deg2rad(AVlon(Center_2c)), deg2rad(AVlat(trans2_c_start:trans2_c_end)), deg2rad(AVlon(trans2_c_start:trans2_c_end)));
Distance_2d = Distance(R, deg2rad(AVlat(Center_2d)), deg2rad(AVlon(Center_2d)), deg2rad(AVlat(trans2_d_start:trans2_d_end)), deg2rad(AVlon(trans2_d_start:trans2_d_end)));
Distance_2e = Distance(R, deg2rad(AVlat(Center_2e)), deg2rad(AVlon(Center_2e)), deg2rad(AVlat(trans2_e_start:trans2_e_end)), deg2rad(AVlon(trans2_e_start:trans2_e_end)));
Distance_2f = Distance(R, deg2rad(AVlat(Center_2f)), deg2rad(AVlon(Center_2f)), deg2rad(AVlat(trans2_f_start:trans2_f_end)), deg2rad(AVlon(trans2_f_start:trans2_f_end)));
Distance_2g = Distance(R, deg2rad(AVlat(Center_2g)), deg2rad(AVlon(Center_2g)), deg2rad(AVlat(trans2_g_start:trans2_g_end)), deg2rad(AVlon(trans2_g_start:trans2_g_end)));

% JBS Five Rivers
% Transect 3
Distance_3a = Distance(R, deg2rad(AVlat(Center_3a)), deg2rad(AVlon(Center_3a)), deg2rad(AVlat(trans3_a_start:trans3_a_end)), deg2rad(AVlon(trans3_a_start:trans3_a_end)));
Distance_3b = Distance(R, deg2rad(AVlat(Center_3b)), deg2rad(AVlon(Center_3b)), deg2rad(AVlat(trans3_b_start:trans3_b_end)), deg2rad(AVlon(trans3_b_start:trans3_b_end)));
Distance_3c = Distance(R, deg2rad(AVlat(Center_3c)), deg2rad(AVlon(Center_3c)), deg2rad(AVlat(trans3_c_start:trans3_c_end)), deg2rad(AVlon(trans3_c_start:trans3_c_end)));
Distance_3d = Distance(R, deg2rad(AVlat(Center_3d)), deg2rad(AVlon(Center_3d)), deg2rad(AVlat(trans3_d_start:trans3_d_end)), deg2rad(AVlon(trans3_d_start:trans3_d_end)));
Distance_3e = Distance(R, deg2rad(AVlat(Center_3e)), deg2rad(AVlon(Center_3e)), deg2rad(AVlat(trans3_e_start:trans3_e_end)), deg2rad(AVlon(trans3_e_start:trans3_e_end)));
Distance_3f = Distance(R, deg2rad(AVlat(Center_3f)), deg2rad(AVlon(Center_3f)), deg2rad(AVlat(trans3_f_start:trans3_f_end)), deg2rad(AVlon(trans3_f_start:trans3_f_end)));

% Transect 4
Distance_4a = Distance(R, deg2rad(AVlat(Center_4a)), deg2rad(AVlon(Center_4a)), deg2rad(AVlat(trans4_a_start:trans4_a_end)), deg2rad(AVlon(trans4_a_start:trans4_a_end)));
Distance_4b = Distance(R, deg2rad(AVlat(Center_4b)), deg2rad(AVlon(Center_4b)), deg2rad(AVlat(trans4_b_start:trans4_b_end)), deg2rad(AVlon(trans4_b_start:trans4_b_end)));
Distance_4c = Distance(R, deg2rad(AVlat(Center_4c)), deg2rad(AVlon(Center_4c)), deg2rad(AVlat(trans4_c_start:trans4_c_end)), deg2rad(AVlon(trans4_c_start:trans4_c_end)));
Distance_4d = Distance(R, deg2rad(AVlat(Center_4d)), deg2rad(AVlon(Center_4d)), deg2rad(AVlat(trans4_d_start:trans4_d_end)), deg2rad(AVlon(trans4_d_start:trans4_d_end)));
Distance_4e = Distance(R, deg2rad(AVlat(Center_4e)), deg2rad(AVlon(Center_4e)), deg2rad(AVlat(trans4_e_start:trans4_e_end)), deg2rad(AVlon(trans4_e_start:trans4_e_end)));
Distance_4f = Distance(R, deg2rad(AVlat(Center_4f)), deg2rad(AVlon(Center_4f)), deg2rad(AVlat(trans4_f_start:trans4_f_end)), deg2rad(AVlon(trans4_f_start:trans4_f_end)));

% Transect 5
Distance_5b = Distance(R, deg2rad(AVlat(Center_5b)), deg2rad(AVlon(Center_5b)), deg2rad(AVlat(trans5_b_start:trans5_b_end)), deg2rad(AVlon(trans5_b_start:trans5_b_end)));
Distance_5d = Distance(R, deg2rad(AVlat(Center_5d)), deg2rad(AVlon(Center_5d)), deg2rad(AVlat(trans5_d_start:trans5_d_end)), deg2rad(AVlon(trans5_d_start:trans5_d_end)));
Distance_5f = Distance(R, deg2rad(AVlat(Center_5f)), deg2rad(AVlon(Center_5f)), deg2rad(AVlat(trans5_f_start:trans5_f_end)), deg2rad(AVlon(trans5_f_start:trans5_f_end)));

%% Finding High Ammonia

% Creating empty variables to fill with values associated with high NH3
CH4_High_NH3  = NaN(size(CH4));
NH3_High_NH3  = NaN(size(NH3));
C2H6_High_NH3 = NaN(size(C2H6));

% Loop to find high NH3 and fill in variables 
for i = 1:length(NH3)
    if NH3(i) >= 5
        CH4_High_NH3(i) = CH4(i);
        NH3_High_NH3(i) = NH3(i);
        C2H6_High_NH3(i) = C2H6(i);
    end
end

%% Figure 2
% Transect 1 - North legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_1c, AVzmsl(trans1_c_start:trans1_c_end), 30, CH4_High_NH3(trans1_c_start:trans1_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.95 2.18])
title('Producers Transect 1', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c1c = colorbar;
c1c.Label.String = 'CH_4 (ppmv)';
set(c1c, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_1a, AVzmsl(trans1_a_start:trans1_a_end), 30, CH4_High_NH3(trans1_a_start:trans1_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.95 2.18])
ylabel('Altitude (m)', 'FontSize', 20)
c1a = colorbar;
c1a.Label.String = 'CH_4 (ppmv)';
set(c1a, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_1e, AVzmsl(trans1_e_start:trans1_e_end), 30, CH4_High_NH3(trans1_e_start:trans1_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.95 2.18])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c1e = colorbar;
c1e.Label.String = 'CH_4 (ppmv)';
set(c1e, 'FontSize', 20)
grid on
grid minor

%% Figure 3
% Transect 2 - North legs
% Ammonia

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_1c, AVzmsl(trans1_c_start:trans1_c_end), 30, NH3_High_NH3(trans1_c_start:trans1_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([15 60])
title('Producers Transect 1', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c1c = colorbar;
c1c.Label.String = 'NH_3 (ppbv)';
set(c1c, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_1a, AVzmsl(trans1_a_start:trans1_a_end), 30, NH3_High_NH3(trans1_a_start:trans1_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([15 60])
ylabel('Altitude (m)', 'FontSize', 20)
c1a = colorbar;
c1a.Label.String = 'NH_3 (ppbv)';
set(c1a, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_1e, AVzmsl(trans1_e_start:trans1_e_end), 30, NH3_High_NH3(trans1_e_start:trans1_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([15 60])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c1e = colorbar;
c1e.Label.String = 'NH_3 (ppbv)';
set(c1e, 'FontSize', 20)
grid on
grid minor

%% Figure 4
% Transect 1 - North legs
% Ethane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_1c, AVzmsl(trans1_c_start:trans1_c_end), 30, C2H6_High_NH3(trans1_c_start:trans1_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([3 14])
title('Producers Transect 1', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c1c = colorbar;
c1c.Label.String = 'C_2H_6 (ppbv)';
set(c1c, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_1a, AVzmsl(trans1_a_start:trans1_a_end), 30, C2H6_High_NH3(trans1_a_start:trans1_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([3 14])
ylabel('Altitude (m)', 'FontSize', 20)
c1a = colorbar;
c1a.Label.String = 'C_2H_6 (ppbv)';
set(c1a, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_1e, AVzmsl(trans1_e_start:trans1_e_end), 30, C2H6_High_NH3(trans1_e_start:trans1_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([3 14])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c1e = colorbar;
c1e.Label.String = 'C_2H_6 (ppbv)';
set(c1e, 'FontSize', 20)
grid on
grid minor

%% Figure 5
% Transect 1 - South legs
% Methane

figure
% Top Subplot
subplot(2, 1, 1)
scatter(Distance_1b, AVzmsl(trans1_b_start:trans1_b_end), 30, CH4_High_NH3(trans1_b_start:trans1_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2.00 2.7])
title('Producers Transect 2', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c1b = colorbar;
c1b.Label.String = 'CH_4 (ppmv)';
set(c1b, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(2, 1, 2)
scatter(Distance_1d, AVzmsl(trans1_d_start:trans1_d_end), 30, CH4_High_NH3(trans1_d_start:trans1_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2.00 2.7])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c1d = colorbar;
c1d.Label.String = 'CH_4 (ppmv)';
set(c1d, 'FontSize', 20)
grid on
grid minor

%% Figure 6
% Transect 1 - South legs
% Ammonia

figure
% Top Subplot
subplot(2, 1, 1)
scatter(Distance_1b, AVzmsl(trans1_b_start:trans1_b_end), 30, NH3_High_NH3(trans1_b_start:trans1_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 120])
title('Producers Transect 2', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c1b = colorbar;
c1b.Label.String = 'NH_3 (ppbv)';
set(c1b, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(2, 1, 2)
scatter(Distance_1d, AVzmsl(trans1_d_start:trans1_d_end), 30, NH3_High_NH3(trans1_d_start:trans1_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 120])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c1d = colorbar;
c1d.Label.String = 'NH_3 (ppbv)';
set(c1d, 'FontSize', 20)
grid on
grid minor

%% Figure 7
% Transect 1 - South legs
% Ethane

figure
% Top Subplot
subplot(2, 1, 1)
scatter(Distance_1b, AVzmsl(trans1_b_start:trans1_b_end), 30, C2H6_High_NH3(trans1_b_start:trans1_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([7 13])
title('Producers Transect 2', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c1b = colorbar;
c1b.Label.String = 'C_2H_6 (ppbv)';
set(c1b, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(2, 1, 2)
scatter(Distance_1d, AVzmsl(trans1_d_start:trans1_d_end), 30, C2H6_High_NH3(trans1_d_start:trans1_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([7 13])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c1d = colorbar;
c1d.Label.String = 'C_2H_6 (ppbv)';
set(c1d, 'FontSize', 20)
grid on
grid minor

%% Figure 8
% Transect 2 - North legs
% Methane

figure
% Top Subplot
subplot(4, 1, 1)
scatter(Distance_2g, AVzmsl(trans2_g_start:trans2_g_end), 30, CH4_High_NH3(trans2_g_start:trans2_g_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.8])
title('Producers Transect 3', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c2g = colorbar;
c2g.Label.String = 'CH_4 (ppmv)';
set(c2g, 'FontSize', 20)
grid on
grid minor

% Top Middle Subplot
subplot(4, 1, 2)
scatter(Distance_2e, AVzmsl(trans2_e_start:trans2_e_end), 30, CH4_High_NH3(trans2_e_start:trans2_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.8])
ylabel('Altitude (m)', 'FontSize', 20)
c2e = colorbar;
c2e.Label.String = 'CH_4 (ppmv)';
set(c2e, 'FontSize', 20)
grid on
grid minor

% Lower Middle Subplot
subplot(4, 1, 3)
scatter(Distance_2a, AVzmsl(trans2_a_start:trans2_a_end), 30, CH4_High_NH3(trans2_a_start:trans2_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.8])
ylabel('Altitude (m)', 'FontSize', 20)
c2a = colorbar;
c2a.Label.String = 'CH_4 (ppmv)';
set(c2a, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(4, 1, 4)
scatter(Distance_2c, AVzmsl(trans2_c_start:trans2_c_end), 30, CH4_High_NH3(trans2_c_start:trans2_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.8])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c2c = colorbar;
c2c.Label.String = 'CH_4 (ppmv)';
set(c2c, 'FontSize', 20)
grid on
grid minor

%% Figure 9
% Transect 2 - North legs
% Ammonia

figure
% Top Subplot
subplot(4, 1, 1)
scatter(Distance_2g, AVzmsl(trans2_g_start:trans2_g_end), 30, NH3_High_NH3(trans2_g_start:trans2_g_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 140])
title('Producers Transect 3', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c2g = colorbar;
c2g.Label.String = 'NH_3 (ppbv)';
set(c2g, 'FontSize', 20)
grid on
grid minor

% Top Middle Subplot
subplot(4, 1, 2)
scatter(Distance_2e, AVzmsl(trans2_e_start:trans2_e_end), 30, NH3_High_NH3(trans2_e_start:trans2_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 140])
ylabel('Altitude (m)', 'FontSize', 20)
c2e = colorbar;
c2e.Label.String = 'NH_3 (ppbv)';
set(c2e, 'FontSize', 20)
grid on
grid minor

% Lower Middle Subplot
subplot(4, 1, 3)
scatter(Distance_2a, AVzmsl(trans2_a_start:trans2_a_end), 30, NH3_High_NH3(trans2_a_start:trans2_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 140])
ylabel('Altitude (m)', 'FontSize', 20)
c2a = colorbar;
c2a.Label.String = 'NH_3 (ppbv)';
set(c2a, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(4, 1, 4)
scatter(Distance_2c, AVzmsl(trans2_c_start:trans2_c_end), 30, NH3_High_NH3(trans2_c_start:trans2_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 140])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c2c = colorbar;
c2c.Label.String = 'NH_3 (ppbv)';
set(c2c, 'FontSize', 20)
grid on
grid minor

%% Figure 10
% Transect 2 - North legs
% Ethane

figure
% Top Subplot
subplot(4, 1, 1)
scatter(Distance_2g, AVzmsl(trans2_g_start:trans2_g_end), 30, C2H6_High_NH3(trans2_g_start:trans2_g_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 11])
title('Producers Transect 3', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c2g = colorbar;
c2g.Label.String = 'C_2H_6 (ppbv)';
set(c2g, 'FontSize', 20)
grid on
grid minor

% Top Middle Subplot
subplot(4, 1, 2)
scatter(Distance_2e, AVzmsl(trans2_e_start:trans2_e_end), 30, C2H6_High_NH3(trans2_e_start:trans2_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 11])
ylabel('Altitude (m)', 'FontSize', 20)
c2e = colorbar;
c2e.Label.String = 'C_2H_6 (ppbv)';
set(c2e, 'FontSize', 20)
grid on
grid minor

% Lower Middle Subplot
subplot(4, 1, 3)
scatter(Distance_2a, AVzmsl(trans2_a_start:trans2_a_end), 30, C2H6_High_NH3(trans2_a_start:trans2_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 11])
ylabel('Altitude (m)', 'FontSize', 20)
c2a = colorbar;
c2a.Label.String = 'C_2H_6 (ppbv)';
set(c2a, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(4, 1, 4)
scatter(Distance_2c, AVzmsl(trans2_c_start:trans2_c_end), 30, C2H6_High_NH3(trans2_c_start:trans2_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 11])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c2c = colorbar;
c2c.Label.String = 'C_2H_6 (ppbv)';
set(c2c, 'FontSize', 20)
grid on
grid minor

%% Figure 11
% Transect 2 - South legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_2f, AVzmsl(trans2_f_start:trans2_f_end), 30, CH4_High_NH3(trans2_f_start:trans2_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2.0 2.5])
title('Producers Transect 4', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c2f = colorbar;
c2f.Label.String = 'CH_4 (ppmv)';
set(c2f, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_2b, AVzmsl(trans2_b_start:trans2_b_end), 30, CH4_High_NH3(trans2_b_start:trans2_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2.0 2.5])
ylabel('Altitude (m)', 'FontSize', 20)
c2b = colorbar;
c2b.Label.String = 'CH_4 (ppmv)';
set(c2b, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_2d, AVzmsl(trans2_d_start:trans2_d_end), 30, CH4_High_NH3(trans2_d_start:trans2_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2.0 2.5])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c2d = colorbar;
c2d.Label.String = 'CH_4 (ppmv)';
set(c2d, 'FontSize', 20)
grid on
grid minor

%% Figure 12
% Transect 2 - South legs
% Ammonia
figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_2f, AVzmsl(trans2_f_start:trans2_f_end), 30, NH3_High_NH3(trans2_f_start:trans2_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 120])
title('Producers Transect 4', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c2f = colorbar;
c2f.Label.String = 'NH_3 (ppbv)';
set(c2f, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_2b, AVzmsl(trans2_b_start:trans2_b_end), 30, NH3_High_NH3(trans2_b_start:trans2_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 120])
ylabel('Altitude (m)', 'FontSize', 20)
c2b = colorbar;
c2b.Label.String = 'NH_3 (ppbv)';
set(c2b, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_2d, AVzmsl(trans2_d_start:trans2_d_end), 30, NH3_High_NH3(trans2_d_start:trans2_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([20 120])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c2d = colorbar;
c2d.Label.String = 'NH_3 (ppbv)';
set(c2d, 'FontSize', 20)
grid on
grid minor

%% Figure 13
% Transect 2 - South legs
% Ethane
figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_2f, AVzmsl(trans2_f_start:trans2_f_end), 30, C2H6_High_NH3(trans2_f_start:trans2_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 10])
title('Producers Transect 4', 'FontSize', 30)
ylabel('Altitude (m)', 'FontSize', 20)
c2f = colorbar;
c2f.Label.String = 'C_2H_6 (ppbv)';
set(c2f, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_2b, AVzmsl(trans2_b_start:trans2_b_end), 30, C2H6_High_NH3(trans2_b_start:trans2_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 10])
ylabel('Altitude (m)', 'FontSize', 20)
c2b = colorbar;
c2b.Label.String = 'C_2H_6 (ppbv)';
set(c2b, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_2d, AVzmsl(trans2_d_start:trans2_d_end), 30, C2H6_High_NH3(trans2_d_start:trans2_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 10])
ylabel('Altitude (m)', 'FontSize', 20)
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
c2d = colorbar;
c2d.Label.String = 'C_2H_6 (ppbv)';
set(c2d, 'FontSize', 20)
grid on
grid minor

%% Figure 14
% Transect 3 - Southwest Legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_3f, AVzmsl(trans3_f_start:trans3_f_end), 30, CH4_High_NH3(trans3_f_start:trans3_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.22])
title('JBS Transect 1', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20);
c3f=colorbar;
c3f.Label.String = 'CH_4 (ppmv)'; 
set(c3f, 'FontSize', 20) 
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_3b, AVzmsl(trans3_b_start:trans3_b_end), 30, CH4_High_NH3(trans3_b_start:trans3_b_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([1.9 2.22])
ylabel('Altitude (m)', 'FontSize', 20) 
c3b=colorbar; 
c3b.Label.String = 'CH_4 (ppmv)'; 
set(c3b, 'FontSize', 20) 
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_3d, AVzmsl(trans3_d_start:trans3_d_end), 30, CH4_High_NH3(trans3_d_start:trans3_d_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([1.9 2.22])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20) 
ylabel('Altitude (m)', 'FontSize', 20) 
c3d=colorbar;
c3d.Label.String = 'CH_4 (ppmv)';
set(c3d, 'FontSize', 20)
grid on
grid minor

%% Figure 15
% Transect 3 - Southwest Legs
% Ammonia
figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_3f, AVzmsl(trans3_f_start:trans3_f_end), 30, NH3_High_NH3(trans3_f_start:trans3_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([50 250])
title('JBS Transect 1', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20);
c3f=colorbar;
c3f.Label.String = 'NH_3 (ppbv)'; 
set(c3f, 'FontSize', 20) 
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_3b, AVzmsl(trans3_b_start:trans3_b_end), 30, NH3_High_NH3(trans3_b_start:trans3_b_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([50 250])
ylabel('Altitude (m)', 'FontSize', 20) 
c3b=colorbar; 
c3b.Label.String = 'NH_3 (ppbv)'; 
set(c3b, 'FontSize', 20) 
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_3d, AVzmsl(trans3_d_start:trans3_d_end), 30, NH3_High_NH3(trans3_d_start:trans3_d_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([50 250])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20) 
ylabel('Altitude (m)', 'FontSize', 20) 
c3d=colorbar;
c3d.Label.String = 'NH_3 (ppbv)';
set(c3d, 'FontSize', 20)
grid on
grid minor

%% Figure 16
% Transect 3 - Southwest Legs
% Ethane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_3f, AVzmsl(trans3_f_start:trans3_f_end), 30, C2H6_High_NH3(trans3_f_start:trans3_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 12])
title('JBS Transect 1', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20);
c3f=colorbar;
c3f.Label.String = 'C_2H_6 (ppbv)'; 
set(c3f, 'FontSize', 20) 
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_3b, AVzmsl(trans3_b_start:trans3_b_end), 30, C2H6_High_NH3(trans3_b_start:trans3_b_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([2 12])
ylabel('Altitude (m)', 'FontSize', 20) 
c3b=colorbar; 
c3b.Label.String = 'C_2H_6 (ppbv)'; 
set(c3b, 'FontSize', 20) 
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_3d, AVzmsl(trans3_d_start:trans3_d_end), 30, C2H6_High_NH3(trans3_d_start:trans3_d_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([2 12])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20) 
ylabel('Altitude (m)', 'FontSize', 20) 
c3d=colorbar;
c3d.Label.String = 'C_2H_6 (ppbv)';
set(c3d, 'FontSize', 20)
grid on
grid minor

%% Figure 17
% Transect 3 - Northeast Legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_3e, AVzmsl(trans3_e_start:trans3_e_end), 30, CH4_High_NH3(trans3_e_start:trans3_e_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([1.9 2.15])
title('JBS Transect 2', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20) 
c3e=colorbar; 
c3e.Label.String = 'CH_4 (ppmv)'; 
set(c3e, 'FontSize', 20) 
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_3a, AVzmsl(trans3_a_start:trans3_a_end), 30, CH4_High_NH3(trans3_a_start:trans3_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.15])
ylabel('Altitude (m)', 'FontSize', 20)
c3a=colorbar; 
c3a.Label.String = 'CH_4 (ppmv)';
set(c3a, 'FontSize', 20) % Setting the font size of the colorbar
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_3c, AVzmsl(trans3_c_start:trans3_c_end), 30, CH4_High_NH3(trans3_c_start:trans3_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.15])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c3c=colorbar;
c3c.Label.String = 'CH_4 (ppmv)';
set(c3c, 'FontSize', 20)
grid on
grid minor

%% Figure 18
% Transect 3 - Northeast Legs
% Ammonia

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_3e, AVzmsl(trans3_e_start:trans3_e_end), 30, NH3_High_NH3(trans3_e_start:trans3_e_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([30 160])
title('JBS Transect 2', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20) 
c3e=colorbar; 
c3e.Label.String = 'NH_3 (ppbv)'; 
set(c3e, 'FontSize', 20) 
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_3a, AVzmsl(trans3_a_start:trans3_a_end), 30, NH3_High_NH3(trans3_a_start:trans3_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([30 160])
ylabel('Altitude (m)', 'FontSize', 20)
c3a=colorbar; 
c3a.Label.String = 'NH_3 (ppbv)';
set(c3a, 'FontSize', 20) % Setting the font size of the colorbar
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_3c, AVzmsl(trans3_c_start:trans3_c_end), 30, NH3_High_NH3(trans3_c_start:trans3_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([30 160])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c3c=colorbar;
c3c.Label.String = 'NH_3 (ppbv)';
set(c3c, 'FontSize', 20)
grid on
grid minor

%% Figure 19
% Transect 3 - Northeast Legs
% Ethane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_3e, AVzmsl(trans3_e_start:trans3_e_end), 30, C2H6_High_NH3(trans3_e_start:trans3_e_end), 'filled')
set(gca, 'FontSize', 20) 
caxis([2 10])
title('JBS Transect 2', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20) 
c3e=colorbar; 
c3e.Label.String = 'C_2H_6 (ppbv)'; 
set(c3e, 'FontSize', 20) 
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_3a, AVzmsl(trans3_a_start:trans3_a_end), 30, C2H6_High_NH3(trans3_a_start:trans3_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 10])
ylabel('Altitude (m)', 'FontSize', 20)
c3a=colorbar; 
c3a.Label.String = 'C_2H_6 (ppbv)';
set(c3a, 'FontSize', 20) % Setting the font size of the colorbar
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_3c, AVzmsl(trans3_c_start:trans3_c_end), 30, C2H6_High_NH3(trans3_c_start:trans3_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([2 10])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c3c=colorbar;
c3c.Label.String = 'C_2H_6 (ppbv)';
set(c3c, 'FontSize', 20)
grid on
grid minor

%% Figure 20
% Transect 4 - Southwest Legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_4e, AVzmsl(trans4_e_start:trans4_e_end), 30, CH4_High_NH3(trans4_e_start:trans4_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.16])
title('JBS Transect 3', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c4e=colorbar;
c4e.Label.String = 'CH_4 (ppmv)';
set(c4e, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_4b, AVzmsl(trans4_b_start:trans4_b_end), 30, CH4_High_NH3(trans4_b_start:trans4_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.16])
ylabel('Altitude (m)', 'FontSize', 20)
c4b=colorbar; 
c4b.Label.String = 'CH_4 (ppmv)';
set(c4b, 'FontSize', 20) 
grid on
grid minor

% Bottom Plot
subplot(3, 1, 3)
scatter(Distance_4f, AVzmsl(trans4_f_start:trans4_f_end), 30, CH4_High_NH3(trans4_f_start:trans4_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.16])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20) 
ylabel('Altitude (m)', 'FontSize', 20) 
c4f=colorbar;
c4f.Label.String = 'CH_4 (ppmv)';
set(c4f, 'FontSize', 20)
grid on
grid minor

%% Figure 21
% Transect 4 - Southwest Legs
% Ammonia

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_4e, AVzmsl(trans4_e_start:trans4_e_end), 30, NH3_High_NH3(trans4_e_start:trans4_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 140])
title('JBS Transect 3', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c4e=colorbar;
c4e.Label.String = 'NH_3 (ppbv)';
set(c4e, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_4b, AVzmsl(trans4_b_start:trans4_b_end), 30, NH3_High_NH3(trans4_b_start:trans4_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 140])
ylabel('Altitude (m)', 'FontSize', 20)
c4b=colorbar; 
c4b.Label.String = 'NH_3 (ppbv)';
set(c4b, 'FontSize', 20) 
grid on
grid minor

% Bottom Plot
subplot(3, 1, 3)
scatter(Distance_4f, AVzmsl(trans4_f_start:trans4_f_end), 30, NH3_High_NH3(trans4_f_start:trans4_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 140])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20) 
ylabel('Altitude (m)', 'FontSize', 20) 
c4f=colorbar;
c4f.Label.String = 'NH_3 (ppbv)';
set(c4f, 'FontSize', 20)
grid on
grid minor

%% Figure 22
% Transect 4 - Southwest Legs
% Ethane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_4e, AVzmsl(trans4_e_start:trans4_e_end), 30, C2H6_High_NH3(trans4_e_start:trans4_e_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 7])
title('JBS Transect 3', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c4e=colorbar;
c4e.Label.String = 'C_2H_6 (ppbv)';
set(c4e, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_4b, AVzmsl(trans4_b_start:trans4_b_end), 30, C2H6_High_NH3(trans4_b_start:trans4_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 7])
ylabel('Altitude (m)', 'FontSize', 20)
c4b=colorbar; 
c4b.Label.String = 'C_2H_6 (ppbv)';
set(c4b, 'FontSize', 20) 
grid on
grid minor

% Bottom Plot
subplot(3, 1, 3)
scatter(Distance_4f, AVzmsl(trans4_f_start:trans4_f_end), 30, C2H6_High_NH3(trans4_f_start:trans4_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 7])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20) 
ylabel('Altitude (m)', 'FontSize', 20) 
c4f=colorbar;
c4f.Label.String = 'C_2H_6 (ppbv)';
set(c4f, 'FontSize', 20)
grid on
grid minor

%% Figure 23
% Transect 4 - Northeast Legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_4d, AVzmsl(trans4_d_start:trans4_d_end), 30, CH4_High_NH3(trans4_d_start:trans4_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.92 2.1])
title('JBS Transect 4', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c4d=colorbar; 
c4d.Label.String = 'CH_4 (ppmv)';
set(c4d, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_4a, AVzmsl(trans4_a_start:trans4_a_end), 30, CH4_High_NH3(trans4_a_start:trans4_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.92 2.1])
ylabel('Altitude (m)', 'FontSize', 20)
c4a=colorbar;
c4a.Label.String = 'CH_4 (ppbv)';
set(c4a, 'FontSize', 20) 
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_4c, AVzmsl(trans4_c_start:trans4_c_end), 30, CH4_High_NH3(trans4_c_start:trans4_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.92 2.1])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c4c=colorbar;
c4c.Label.String = 'CH_4 (ppmv)'; 
set(c4c, 'FontSize', 20)
grid on
grid minor

%% Figure 24
% Transect 4 - Northeast Legs
% Ammonia

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_4d, AVzmsl(trans4_d_start:trans4_d_end), 30, NH3_High_NH3(trans4_d_start:trans4_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 100])
title('JBS Transect 4', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c4d=colorbar; 
c4d.Label.String = 'NH_3 (ppbv)';
set(c4d, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_4a, AVzmsl(trans4_a_start:trans4_a_end), 30, NH3_High_NH3(trans4_a_start:trans4_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 100])
ylabel('Altitude (m)', 'FontSize', 20)
c4a=colorbar;
c4a.Label.String = 'NH_3 (ppbv)';
set(c4a, 'FontSize', 20) 
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_4c, AVzmsl(trans4_c_start:trans4_c_end), 30, NH3_High_NH3(trans4_c_start:trans4_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 100])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c4c=colorbar;
c4c.Label.String = 'NH_3 (ppbv)'; 
set(c4c, 'FontSize', 20)
grid on
grid minor

%% Figure 25
% Transect 4 - Northeast Legs
% Ethane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_4d, AVzmsl(trans4_d_start:trans4_d_end), 30, C2H6_High_NH3(trans4_d_start:trans4_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 11])
title('JBS Transect 4', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c4d=colorbar; 
c4d.Label.String = 'C_2H_6 (ppbv)';
set(c4d, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_4a, AVzmsl(trans4_a_start:trans4_a_end), 30, C2H6_High_NH3(trans4_a_start:trans4_a_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 11])
ylabel('Altitude (m)', 'FontSize', 20)
c4a=colorbar;
c4a.Label.String = 'C_2H_6 (ppbv)';
set(c4a, 'FontSize', 20) 
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_4c, AVzmsl(trans4_c_start:trans4_c_end), 30, C2H6_High_NH3(trans4_c_start:trans4_c_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 11])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c4c=colorbar;
c4c.Label.String = 'C_2H_6 (ppbv)'; 
set(c4c, 'FontSize', 20)
grid on
grid minor

%% Figure 26
% Transect 5 - Southwest Legs
% Methane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_5b, AVzmsl(trans5_b_start:trans5_b_end), 30, CH4_High_NH3(trans5_b_start:trans5_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.03])
title('JBS Transect 5', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c5b=colorbar;
c5b.Label.String = 'CH_4 (ppmv)'; 
set(c5b, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_5d, AVzmsl(trans5_d_start:trans5_d_end), 30, CH4_High_NH3(trans5_d_start:trans5_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.03])
ylabel('Altitude (m)', 'FontSize', 20) 
c5d=colorbar;
c5d.Label.String = 'CH_4 (ppmv)';
set(c5d, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_5f, AVzmsl(trans5_f_start:trans5_f_end), 30, CH4_High_NH3(trans5_f_start:trans5_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1.9 2.03])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c5f=colorbar;
c5f.Label.String = 'CH_4 (ppmv)'; 
set(c5f, 'FontSize', 20) 
grid on
grid minor

%% Figure 27
% Transect 5 - Southwest Legs
% Ammonia

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_5b, AVzmsl(trans5_b_start:trans5_b_end), 30, NH3_High_NH3(trans5_b_start:trans5_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 70])
title('JBS Transect 5', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c5b=colorbar;
c5b.Label.String = 'NH_3 (ppbv)'; 
set(c5b, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_5d, AVzmsl(trans5_d_start:trans5_d_end), 30, NH3_High_NH3(trans5_d_start:trans5_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 70])
ylabel('Altitude (m)', 'FontSize', 20) 
c5d=colorbar;
c5d.Label.String = 'NH_3 (ppbv)';
set(c5d, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_5f, AVzmsl(trans5_f_start:trans5_f_end), 30, NH3_High_NH3(trans5_f_start:trans5_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([10 70])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c5f=colorbar;
c5f.Label.String = 'NH_3 (ppbv)'; 
set(c5f, 'FontSize', 20) 
grid on
grid minor

%% Figure 28
% Transect 5 - Southwest Legs
% Ethane

figure
% Top Subplot
subplot(3, 1, 1)
scatter(Distance_5b, AVzmsl(trans5_b_start:trans5_b_end), 30, C2H6_High_NH3(trans5_b_start:trans5_b_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 5])
title('JBS Transect 5', 'FontSize', 30);
ylabel('Altitude (m)', 'FontSize', 20)
c5b=colorbar;
c5b.Label.String = 'C_2H_6 (ppbv)'; 
set(c5b, 'FontSize', 20)
grid on
grid minor

% Middle Subplot
subplot(3, 1, 2)
scatter(Distance_5d, AVzmsl(trans5_d_start:trans5_d_end), 30, C2H6_High_NH3(trans5_d_start:trans5_d_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 5])
ylabel('Altitude (m)', 'FontSize', 20) 
c5d=colorbar;
c5d.Label.String = 'C_2H_6 (ppbv)';
set(c5d, 'FontSize', 20)
grid on
grid minor

% Bottom Subplot
subplot(3, 1, 3)
scatter(Distance_5f, AVzmsl(trans5_f_start:trans5_f_end), 30, C2H6_High_NH3(trans5_f_start:trans5_f_end), 'filled')
set(gca, 'FontSize', 20)
caxis([1 5])
xlabel('Distance from Center of Transect (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
c5f=colorbar;
c5f.Label.String = 'C_2H_6 (ppbv)'; 
set(c5f, 'FontSize', 20) 
grid on
grid minor

%% Figure 29
% ONG influence

[P_side2,s] = polyfit(CH4(trans3_a_start:trans5_f_end).*1000,C2H6(trans3_a_start:trans5_f_end), 1);
P_side= polyfit(CH4(trans3_a_start:trans5_f_end).*1000,C2H6(trans3_a_start:trans5_f_end), 1);
[y,delta] = polyval(P_side2,CH4(trans3_a_start:trans5_f_end).*1000,s);
mdl = fitlm(CH4(trans3_a_start:trans5_f_end).*1000,C2H6(trans3_a_start:trans5_f_end));
yfit_side = P_side(1)*CH4(trans3_a_start:trans5_f_end).*1000+ P_side(2);
txt = sprintf('y = %.4fx + %.0f', P_side(1), P_side(2));

figure
scatter(CH4(trans3_a_start:trans5_f_end) .* 1000, C2H6(trans3_a_start:trans5_f_end), 80, 'k', 'filled')
hold on
plot(CH4(trans3_a_start:trans5_f_end).*1000, yfit_side,'r', 'LineWidth', 3)
text(2000, 14.5, txt, 'Color', 'r', 'FontSize', 25, 'FontWeight', 'Bold', 'HorizontalAlignment', 'left');
hold off
set(gca, 'FontSize', 20)
xlabel('CH_4 (ppbv)', 'FontSize', 20)
ylabel('C_2H_6 (ppbv)', 'FontSize', 20)
title('RF 13 ONG Influence')
grid on
grid minor
