%--------------------------------------------------------------------------
%
% Function: axisCal_DeltaWing
%
% axisCal_DeltaWing.m
% 
% Purpose:
%   define and calculate the axis of the wing vertex of Delta Wing
%
% Last modified:   2023/10/21    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function [x1s,y1s,x2s,y2s,x3s,y3s,x4s,y4s]=axisCal_DeltaWing(deltaWing_TrailingEdge)
    x1s=0;y1s=1;y2s=0.0000000001;y4s=0;x4s=0;y3s=0;
    x2s=deltaWing_TrailingEdge/2;
    x3s=deltaWing_TrailingEdge/2;  
end