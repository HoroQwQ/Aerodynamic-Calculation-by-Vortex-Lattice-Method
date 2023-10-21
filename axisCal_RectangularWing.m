%--------------------------------------------------------------------------
%
% Function: axisCal_RectangularWing
%
% axisCal_RectangularWing.m
% 
% Purpose:
%   define and calculate the axis of the wing vertex of sweepbackWing
%
% Last modified:   2023/10/4    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function [x1s,y1s,x2s,y2s,x3s,y3s,x4s,y4s]=axisCal_RectangularWing(lambda)
    x1s=0;
    x2s=lambda/2;
    y4s=0;
    x4s=0;
    y1s=1;
    y3s=0;
    x3s=lambda/2;
    y2s=1;
end