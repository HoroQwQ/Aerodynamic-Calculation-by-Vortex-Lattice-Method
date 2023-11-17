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
type = 2;  % 0:Rectanglezwing  1: sweepbackwing  2:deltawing 

%% numble of net
n=2*36;
n=(sqrt(n/2)+1)^2;

%% Mathematical constants
pi        = 3.14159265358979324;
Rad       = pi/180.0;            % Radians per degree
Deg       = 180.0/pi;            % Degrees per radian
    
%% Wing parameters
deltaWing_TrailingEdge = 3;
deltaWing_InnerEdge    = 1;
sweepbackWing_angle    = 20*Rad;
sweepbackWing_wide     = 6;
sweepbackWing_centra   = 1;
sweepbackWing_length   = 0.5;
lambda = 6;

%% General
H         = 1000;                % Altitude [m]
RHO       = 1.1117;              % Atmospheric density[Kg/m^3]
T         = 281.66;              % Atmospheric temperature[K]
a         = sqrt(T*1.4*287.06);  % Speed of sound [m/s]

if type ==2
    n=2*4;
    n=(sqrt(n/2)+1)^2;
end