%--------------------------------------------------------------------------
%
% Function: airDynamic_CalLiftingForce
%
% airDynamic_CalLiftingForce.m
% 
% Purpose:
%   Calculate the lift coefficient of the wing
%
% Last modified:   2023/10/15    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function Cy=airDynamic_CalLiftingForce(Vinnf,RHO,dZ,S,varGamma)
    L= sum(RHO.*Vinnf.*dZ.*varGamma);
    Cy=L/(0.5*RHO*(Vinnf.^2)*S);
end