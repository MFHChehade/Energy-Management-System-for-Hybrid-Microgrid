function [s_radiation] = radiation_slope_surface (day, time, G_horizontal_radiation, solar_zenith)

if G_horizontal_radiation == 0 || solar_zenith < 0
    s_radiation=0;
else
    
%-----------------------initial parameters for the specific project--------
    longitude = 33.9009;
    latitude = 35.4811;
    timezone_index = 2;
    tilt_angle = latitude;
    surface_azim = 0;
    ground_reflectance = 0.6;

%-----------------------incidence angle calculation------------------------
    %calculating solar time
    longit_zone=15*timezone_index;
    b=(day-1)*(360/365);
    %equation of time
    e=229.2*(0.000075+0.001868*cosd(b)-0.032077*sind(b)-0.014615*cosd(2*b)-0.04089*sind(2*b)); 
    %solar time
    t_solar=time+(4*(longitude-longit_zone)+e)/60;

    %declination angle
    delta=(23.45*sind((360*(284+day)/365)));

    %solar azimuthal angle
    if t_solar >= 12
        sign = 1;
    else
        sign = -1;
    end
    solar_azimuth=sign*abs(acosd((cosd(solar_zenith)*sind(latitude)-sind(delta))/(sind(solar_zenith)*cosd(latitude))));

    %incidence angle
    theta = cosd(solar_zenith) * cosd(tilt_angle) + sind(solar_zenith) * sind(tilt_angle) * cosd(solar_azimuth - surface_azim);

%-----------------------calculating radiation on a sloped surface----------
    
    %Calculating solar radiation (G0)
    Gsc = 1367;
    solar_radiation = Gsc*(1.000110+0.034221*cosd(b)+0.001280*sind(b)+0.000719*cosd(2*b)+0.000077*sind(2*b));
    

    %Calculating clearness index Kt
    clearness_index = G_horizontal_radiation/(solar_radiation*cosd(solar_zenith));

    %calculating fraction of hourly diffuse radiation Ro_d
    if clearness_index<=0.35
        Ro_d = 1-0.249*clearness_index;
    elseif clearness_index>0.75
        Ro_d = 0.177;
    else
        Ro_d = 1.557-1.84*clearness_index;
    end

    %Calculating diffuse radiation Gd
    diffuse_radiation = Ro_d*G_horizontal_radiation;

    %Calculating Gbh
    beam_radiation = (1-Ro_d)*G_horizontal_radiation;

    %Calculating beam radiation (HDKR method)
    Rb = cosd(theta)/cosd(solar_zenith);
    Ai = beam_radiation/(solar_radiation*cosd(solar_zenith));
    beam_radiation_HDKR = (beam_radiation + (diffuse_radiation*Ai))*Rb;

    %Calculating diffuse radiation (HDKR method)
    f = sqrt(beam_radiation/G_horizontal_radiation);
    diffuse_radiation_HDKR = diffuse_radiation*(1-Ai)*((1+cosd(tilt_angle))/2)*(1+(f*(sind(tilt_angle/2))^3));

    %Calculating diffuse radiation reflected from ground
    diffuse_radiation_reflected = G_horizontal_radiation*ground_reflectance*((1-cosd(tilt_angle))/2);

%-----------------------output value---------------------------------------
    s_radiation = beam_radiation_HDKR + diffuse_radiation_HDKR + diffuse_radiation_reflected;
end
end
