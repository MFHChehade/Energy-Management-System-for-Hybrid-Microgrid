%%
close all;
clear all;
clc;
solar_rad = csvread('Data/radiation_data.csv',1,0);

%%
DY_per_MO = [31,29,31,30,31,30,31,31,30,31,30,31];
cum_days = cumsum(DY_per_MO);
% solar_rad(730:750,:)                              % check
for i = 745:8784
    solar_rad(i,2) = solar_rad(i,2) + cum_days(solar_rad(i,1) - 1);
end
% solar_rad(730:750,:)                              % check

irradiance_available_at_panels = zeros(366,24);

for i = 1:8784
    
    %[s_radiation] = radiation_slope_surface (day, time, G_horizontal_radiation, solar_zenith);
    day = solar_rad(i,2);
    time = solar_rad(i,3);
    solar_zenith = solar_rad(i,5);
    G_horizontal_radiation = solar_rad(i,4);
    
    irradiance = radiation_slope_surface (day, time, G_horizontal_radiation, solar_zenith);
    
    irradiance_available_at_panels(day,time+1) = irradiance;
    
end

%%
csvwrite('Data/solar_irradiance.csv', irradiance_available_at_panels)

