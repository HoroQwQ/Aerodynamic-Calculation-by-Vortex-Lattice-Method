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
function Cy=airDynamic_CalLiftingForce(Vinf,RHO,dZ,S,varGamma,n)
    for i=1:(n/2)
        varGammaLeft(i) = varGamma(i);
    end
    for i=(n/2+1):n
        varGammaRight(i) = varGamma(i);
    end
    Y =sum(RHO.*Vinf.*dZ.*varGammaLeft.*(-1))+sum(RHO.*Vinf.*dZ.*varGammaRight);
    Cy = Y/(0.5*RHO*(Vinf^2)*S);
end