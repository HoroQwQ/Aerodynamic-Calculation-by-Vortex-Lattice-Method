%--------------------------------------------------------------------------
%
% Function: axisCal_SBW
%
% axisCal_SBW.m
% 
% Purpose:
%   define and calculate the axis of the wing vertex of sweepbackWing
%
% Last modified:   2023/10/4    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function [x1s,y1s,x2s,y2s,x3s,y3s,x4s,y4s]=axisCal_SBW(sweepbackWing_angle,...
                                                       sweepbackWing_wide,...
                                                       sweepbackWing_centra,...
                                                       sweepbackWing_length)
    x1s=0;
    x2s=sweepbackWing_wide/2;
    y4s=x2s.*sin(sweepbackWing_angle);
    x4s=0;
    y1s=sweepbackWing_centra+y4s;
    y3s=0;
    x3s=x2s;
    y2s=sweepbackWing_length;
end