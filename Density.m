% Calculates air density
% Inputs:
    % Press_pa = Atmospheric pressure in pascals
    % R        = Univeral gas constant (R_star) in Joules / (mol * Kelvin)
    % Temp_K   = Air temperature in Kelvin
% Output:
    % rho      = Air density in mol/m^3
% Example:
    % Press_pa = 82169 Pa        => Atmopsheric pressure
    % R        = 8.314 J/(mol*K) => Universal gas constant
    %Temp_K    = 300.7500 K      => Air temperature

    % rho = Density(Press_pa, R, Temp_K)
    % rho = 32.8619 mol/m^3

% -------------------------------------------------------------------------
% Edits
% 2023/August/16 - First Version

% By Kathryn Steinmann - ksteinma@uwyo.edu

function [rho] = Density(Press_pa, R, Temp_K)
    rho = Press_pa ./ (R .* Temp_K); % rho = P/(RT)
end