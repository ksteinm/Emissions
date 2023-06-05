% Katie Steinmann
% University of Wyoming
% Calculates potential temperature and creates plots to help identify
    % boundary layer height
% Figure 1 - Potential temperature versus altitude for entire flight
% Figure 2 - Water vapor mixing ratio versus altitude for entire flight
% Figure 3 - Methane concentratio versus altitude for entire flight
% Figure 4 - Potential temperature versus altitude for initial descent
% Figure 5 - Water vapor mixing ratio versus altitude for initial descent
% Figure 6 - Methane concentration versus altitude for initial descent
% Figure 7 - Potential temperature and water vapor mixing ratio versus altitude for initial descent
% Figure 8 - Potential temperature and methane concentration versus altitude for initial descent
% Figure 9 - Water vapor mixing ratio and methane concentration versus altitude for initial descent
% Figure 10 - Potential temperature and methane concentration versus
    % altitude and flight track colored by methane concentration
% Figure 11 - Potential temperature versus altitude for final descent
% Figure 12 - Water vapor mixing ratio versus altitude for final descent
% Figure 13 - Methane concentration versus altitude for final descent
% Figure 14 - Potential temperature and water vapor mixing ratio versus altitude for final descent
% Figure 15 - Potential temperature and methane concentration versus altitude for final descent
% Figure 16 - Water vapor mixing ratio and methane concentration versus altitude for final descent
% Figure 17 - Potential temperature and methane concentration versus
    % altitude and flight track colored by methane concentration
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

% Dry air gas constant
R = 287; % [K / (K kg)]

% Specific heat of dry air
Cp = 1004; % [J / (K kg)]

% Initial Descent
desc_top = 1190; % Top of the initial descent
desc_bottom = 1700; % Bottom of the inital descent

% Final Descent
final_top = 12500;
final_bottom = 13274;

%% Conversions

% Temperature
Temp_K = temp + 273.15; % [K]

%% Calculating Potential temperature

theta = pot_temp(Temp_K, ps_hads_a, R, Cp); % [K]

%% Figure 1
% Potential temperature versus altitude of the aircraft for entire flight

figure
line(theta, AVzmsl, 'Color', 'k', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Potential Temperature (K)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
title('Potential Temperature', 'FontSize', 30)
grid on
grid minor

%% Figure 2
% Water vapor mixing ratio versus altitude of the aircraft for entire flight

figure
line(H2O, AVzmsl, 'Color', 'b', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
title('Water Vapor Mixing Ratio', 'FontSize', 30)
grid on
grid minor

%% Figure 3
% Methane concentration versus altitude of the aircraft for entire flight

figure 
scatter(CH4, AVzmsl, 'r', 'filled')
set(gca, 'FontSize', 20)
xlabel('Methane (ppmv)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
title('Methane Concentration', 'FontSize', 30)
grid on 
grid minor

%% Figure 4
% Potential temperature versus altitude of the aircraft during initial descent

figure
line(theta(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'k', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Potential Temperature (K)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
title('Potential Temperature - Initial Descent', 'FontSize', 30)
grid on
grid minor

%% Figure 5
% Water vapor mixing ratio versus altitude of the aircraft during initial descent

figure
line(H2O(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'b', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
title('Water Vapor Mixing Ratio - Initital Descent', 'FontSize', 30)
grid on
grid minor

%% Figure 6
% Methane concentration versus altitude of the aircraft for initial descent

figure
line(CH4(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'r', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Methane (ppb)', 'FontSize', 20)
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20)
title('Methane Concentration - Initial Descent', 'FontSize', 30)
grid on
grid minor

%% Figure 7
% Potential temperature and water vapor mixing ratio versus altitude of the aircraft during initial descent

figure
p1 = line(theta(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'k', 'DisplayName', 'Potential Temperature', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca;
ax1.XColor = 'k';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Potential Temperature (K)', 'FontSize', 20)
hold on
ax1_pos = ax1.Position;
% Top x-axis
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none'); 
p2 = line(H2O(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'b', 'DisplayName', 'Water Vapor Mixing ratio', 'LineWidth', 2);
ax2.XColor = 'b';
set(ax2, 'FontSize', 20)
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
legend([p1,p2])
grid on
grid minor

%% Figure 8
% Potential temperature and methane concentration versus altitude of aircraft for initial descent

figure
p1 = line(theta(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'k', 'DisplayName', 'Potential Temperature', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca;
ax1.XColor = 'k';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Potential Temperature (K)', 'FontSize', 20)
hold on
ax1_pos = ax1.Position;
% Top x-axis
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none');
p2 = line(CH4(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'r', 'DisplayName', 'Methane', 'LineWidth', 2);
ax2.XColor = 'r';
set(ax2, 'FontSize', 20)
xlabel('Methane (ppmv)', 'FontSize', 20)
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20)
legend([p1,p2])
grid on
grid minor

%% Figure 9
% Water vapor mixing ratio and methane concentration versus altitude of aircraft for initial descent

figure
p1 = line(H2O(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'b', 'DisplayName', 'Water Vapor Mixing ratio', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca;
ax1.XColor = 'b';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
hold on
% Top x-axis
ax1_pos = ax1.Position;
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none'); 
p2 = line(CH4(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'r', 'DisplayName', 'Methane', 'LineWidth', 2);
ax2.XColor = 'r';
set(ax2, 'FontSize', 20)
xlabel('Methane (ppmv)', 'FontSize', 20)
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20)
legend([p1,p2])
grid on
grid minor

%% Figure 10
% Plot 1: Potential temperature and methane concentration versus altitude of the aircraft
% Plot 2: Flight track colored by methane concentration

figure
% Left subplot
subplot(1, 2, 1)
p1 = line(theta(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'k', 'DisplayName', 'Potential Temperature', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca; 
ax1.XColor = 'k';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Potential Temperature (K)', 'FontSize', 20)
hold on
% Top x-axis
ax1_pos = ax1.Position;
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none');
p2 = line(CH4(desc_top:desc_bottom), AVzmsl(desc_top:desc_bottom), 'Color', 'r', 'DisplayName', 'Methane', 'LineWidth', 2);
ax2.XColor = 'r';
set(ax2, 'FontSize', 20)
xlabel('Methane (ppb)', 'FontSize', 20) 
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20) 
legend([p1,p2])
grid on
grid minor
hold off

% Right Plot
subplot(1, 2, 2)
p1 = scatter(-104.5881,40.43502,100,'k','filled'); % Producers
set(gca, 'FontSize', 20)
c4=colorbar;
c4.Label.String = 'Methane Concentration (ppmv)';
set(c4, 'FontSize', 20)
caxis([1.85 2.2])
hold on
p2 = scatter(-104.50219,40.37626,100,'r','filled'); % JBS Five Rivers -Keresy 
p3 = scatter(-104.48439,40.44753,100,'b','filled'); % Monte Vista
scatter(AVlon(desc_top:desc_bottom), AVlat(desc_top:desc_bottom), 5, CH4(desc_top:desc_bottom), 'filled')
legend({'Producers', 'JBS Five Rivers - Keresy', 'Monte Vista'}, 'NumColumns', 2, 'FontSize', 20, 'Location', 'southwest')
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
grid on
grid minor 
hold off 

%% Figure 11
% Potential temperature versus altitude of the aircraft during final descent

figure
line(theta(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'k', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Potential Temperature (K)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
ylim([2000 2800])
title('Potential Temperature - Final Descent', 'FontSize', 30)
grid on
grid minor

%% Figure 12
% Water vapor mixing ratio versus altitude of the aircraft during final descent

figure
line(H2O(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'b', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
ylim([2000 2800])
title('Water Vapor Mixing Ratio - Final Descent', 'FontSize', 30)
grid on
grid minor

%% Figure 13
% Methane concentration versus altitude of aircraft during final descent

figure
line(CH4(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'r', 'LineWidth', 2)
set(gca, 'FontSize', 20)
xlabel('Methane (ppb)', 'FontSize', 20)
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20)
ylim([2000 2800])
title('Methane Concentration - Final Descent', 'FontSize', 30)
grid on
grid minor

%% Figure 14
% Potential temperature and water vapor mixing ratio versus altitude of the aircraft during final descent

figure
p1 = line(theta(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'k', 'DisplayName', 'Potential Temperature', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca;
ax1.XColor = 'k';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Potential Temperature (K)', 'FontSize', 20)
hold on
ax1_pos = ax1.Position;
% Top x-axis
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none'); 
p2 = line(H2O(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'b', 'DisplayName', 'Water Vapor Mixing ratio', 'LineWidth', 2);
ax2.XColor = 'b';
set(ax2, 'FontSize', 20)
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
legend([p1,p2])
grid on
grid minor

%% Figure 15
% Potential temperature and methane concentration versus altitude of aircraft for final descent

figure
p1 = line(theta(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'k', 'DisplayName', 'Potential Temperature', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca;
ax1.XColor = 'k';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Potential Temperature (K)', 'FontSize', 20)
hold on
ax1_pos = ax1.Position;
% Top x-axis
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none');
p2 = line(CH4(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'r', 'DisplayName', 'Methane', 'LineWidth', 2);
ax2.XColor = 'r';
set(ax2, 'FontSize', 20)
xlabel('Methane (ppmv)', 'FontSize', 20)
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20)
legend([p1,p2])
grid on
grid minor

%% Figure 16
% Water vapor mixing ratio and methane concentration versus altitude of aircraft for final descent

figure
p1 = line(H2O(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'b', 'DisplayName', 'Water Vapor Mixing ratio', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca;
ax1.XColor = 'b';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Water Vapor Mixing Ratio (%)', 'FontSize', 20)
hold on
% Top x-axis
ax1_pos = ax1.Position;
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none'); 
p2 = line(CH4(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'r', 'DisplayName', 'Methane', 'LineWidth', 2);
ax2.XColor = 'r';
set(ax2, 'FontSize', 20)
xlabel('Methane (ppmv)', 'FontSize', 20)
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20)
legend([p1,p2])
grid on
grid minor

%% Figure 17
% Plot 1: Potential temperature and methane concentration versus altitude of the aircraft
% Plot 2: Flight track colored by methane concentration

figure
% Left subplot
subplot(1, 2, 1)
p1 = line(theta(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'k', 'DisplayName', 'Potential Temperature', 'LineWidth', 2);
% Bottom x-axis
ax1 = gca; 
ax1.XColor = 'k';
ax1.YColor = 'k';
set(ax1, 'FontSize', 20)
set(ax1, 'yticklabel', [])
set(ax1, 'ytick', [])
xlabel('Potential Temperature (K)', 'FontSize', 20)
hold on
% Top x-axis
ax1_pos = ax1.Position;
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none');
p2 = line(CH4(final_top:final_bottom), AVzmsl(final_top:final_bottom), 'Color', 'r', 'DisplayName', 'Methane', 'LineWidth', 2);
ax2.XColor = 'r';
set(ax2, 'FontSize', 20)
xlabel('Methane (ppb)', 'FontSize', 20) 
ylabel('Mean Sea Level Altitude (m)', 'FontSize', 20) 
legend([p1,p2])
grid on
grid minor
hold off

% Right Plot
subplot(1, 2, 2)
p1 = scatter(-104.5881,40.43502,100,'k','filled'); % Producers
set(gca, 'FontSize', 20)
c4=colorbar;
c4.Label.String = 'Methane Concentration (ppmv)';
set(c4, 'FontSize', 20)
caxis([1.85 2.2])
hold on
p2 = scatter(-104.50219,40.37626,100,'r','filled'); % JBS Five Rivers -Keresy 
p3 = scatter(-104.48439,40.44753,100,'b','filled'); % Monte Vista
scatter(AVlon(final_top:final_bottom), AVlat(final_top:final_bottom), 5, CH4(final_top:final_bottom), 'filled')
legend({'Producers', 'JBS Five Rivers - Keresy', 'Monte Vista'}, 'NumColumns', 2, 'FontSize', 20, 'Location', 'southeast')
xlabel('Longitude (^oE)', 'FontSize', 20)
ylabel('Latitude (^oN)', 'FontSize', 20)
grid on
grid minor 
hold off 

