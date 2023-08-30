% Calculate the polar coordinates of a wind direction
% Inputs:
    % dir       = Wind direction in degrees
% Outouts:
    % polar_deg = Polar coordinates of the wind direction in degrees
% Example:
    % dir       = 197.4 degrees

    % polar_deg = PolarCoordinates(dir)
    % polar_deg = 252.6 degrees

% -------------------------------------------------------------------------
% Edits
% 2023/August/29 - First version

% By Kathryn Steinmann - ksteinma@uwyo.edu

function [polar_deg] = PolarCoordinates(dir)
    polar_deg = NaN(size(dir));
    for i=1:length(dir)
        if (dir(i) < 90) 
            polar_deg(i) = 90 - dir(i);
        elseif (dir(i) >= 90) && (dir(i) <= 360)
            polar_deg(i) = 450 - dir(i);
        end
     end
end