%--------------------------------------------------------------------------
%
% WING_Const
% 
% Purpose:
%   Definition of astronomical and mathematical constants
%
% Last modified:   2023/10/4    by: Minghe Lee  
% 
%--------------------------------------------------------------------------

%% type of the wing
type = 1; %1: sweepbackwing  2:deltawing

%% numble of net
n=2*900;
n=(sqrt(n/2)+1)^2;

%% Mathematical constants
pi        = 3.14159265358979324;
pi2       = 2.0*pi;              % 2pi
Rad       = pi/180.0;            % Radians per degree
Deg       = 180.0/pi;            % Degrees per radian
Arcs      = 3600.0*180.0/pi;     % Arcseconds per radian
    
%% wing
deltaWing_wide = 3;
deltaWing_length = 1;
sweepbackWing_angle = 20*Rad;
sweepbackWing_wide=6;
sweepbackWing_centra=1;
sweepbackWing_length=0.5;

%% General
MJD_J2000 = 51544.5;             % Modif. Julian Date of J2000.0
c_light   = 299792457.999999984; % Speed of light  [m/s]; DE200
AU        = 149597870659.999996; % Astronomical unit [m]; DE20
H         = 1000;                % Altitude [m]
RHO       = 1.1117;              % Atmospheric density[Kg/m^3]
T         = 281.66;              % Atmospheric temperature[K]
a         = sqrt(T*1.4*287.06);  % Speed of sound [m/s]

