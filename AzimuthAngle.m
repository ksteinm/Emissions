% Calculates the azimuth angle for a given longitude and latitude
    % Azimuth angle: Angle between North (measured clockwise around the
    % observer's horizon) and a celestial body (sun or moon)
% Inputs:
    % Lat_ref = Latitude of the point of interest in radians
    % Lon_ref = Longitude of the point of interest in radians
    % Lat_rad = Latitude of measurement in radians
    % Lon_rad = Longitude of measurement in radians
% Output:
    % azimuth = Azimuth angle in radians
% Example:
    % Lat_ref = 0.7047 radians  => Point of interest latitude
    % Lon_ref = -1.8241 radians => Point of interest longitude
    % Lat_rad = 0.7070 radians  => Measurement latitude
    % Lon_rad = -1.8255 radians => Measurement longitude

    % azimuth = AzimuthAngle(Lat_ref, Lon_ref, Lat_rad, Lon_ref)
    % azimuth = -0.4679 radians

% -------------------------------------------------------------------------
% Edits
% 2023/August/28 - First version

% By Kathryn Steinmann - ksteinma@uwyo.edu


function [azimuth] = AzimuthAngle(Lat_ref, Lon_ref, Lat_rad, Lon_rad)
    azimuth = cos(Lat_ref).*sin(Lon_ref-Lon_rad)./(cos(Lat_rad).*sin(Lat_ref)-sin(Lat_rad).*cos(Lat_ref).*cos(Lon_ref-Lon_rad));
end