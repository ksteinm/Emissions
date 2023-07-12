% Calculates the distance between two geographical points
% Inputs:
    % R       = Radius of the planet in meters
    % Lat_ref = Latitude of the reference point in radians
    % Lon_ref = Longitude of the reference point in radians
    % Lat_rad = Latitude of the measurement in radians
    % Lon_rad = Longitude of the measurement in radians
% Output:
    % Dist    = Distance between the reference point and the measurements
% Example:
    % R       = 6366308.7 => Radius of the Earth in meters
    % Lat_ref = 0.7047    => Latitude of the reference point in radians (40.3769 degrees North)
    % Lon_ref = -1.8241   => Longitude of the reference point in radians (-104.511 degrees East)
    % Lat_rad = 0.7016    => Latitude of the measurement in radians (40.2 degrees North)
    % Lon_rad = =1.8241   => Longitude of the measurement in radians (-104.513 degrees East)

    % Dist = Distance(R, Lat_ref, Lon_ref, Lat_rad, Lon_rad)
    % Dist = -1965.7 m
% ------------------------------------------------------------------------
% Edits
% 2023/July/12 - First version

% By Kathryn Steinmann - ksteinma@uwyo.edu

function [Dist] = Distance(R, Lat_ref, Lon_ref, Lat_rad, Lon_rad)
    Dist = (acos(((sin(Lat_ref)) .* (sin(Lat_rad))) + (cos(Lat_ref)) .* (cos(Lat_rad)) .* (cos(Lon_ref - Lon_rad)))) .* R;
    for i = 1:length(Lon_rad)
        if Lon_rad(i) < Lon_ref
            Dist(i) = (-1) .* Dist(i);
        end
    end
end