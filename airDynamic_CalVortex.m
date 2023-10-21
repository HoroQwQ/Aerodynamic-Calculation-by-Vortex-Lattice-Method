%--------------------------------------------------------------------------
% airDynamic_CalVortex.m
% 
% Purpose:
%   Calculate and solve the lifting ring quantity of each horseshoe vortex.
%
% Last modified:   2023/10/14    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function [varGamma,K]=airDynamic_CalVortex(x,x1,x2,z,z1,z2,Vinf,alpha,n)
    %% Calculate the coefficient matrix of the equations
    for contraPoint=1:n
        for i=1:n
            A = 1 ./ ((x2(i) - x(contraPoint)) .* (z1(i) - z(contraPoint)) - (x1(i) - x(contraPoint)) .* (z2(i) - z(contraPoint)));
            B = ((x2(i) - x1(i)) .* (x1(i) - x(contraPoint)) + (z2(i) - z1(i)) .* (z1(i) - z(contraPoint))) ./ sqrt((x1(i) - x(contraPoint)) .^ 2 + (z1(i) - z(contraPoint)).^ 2);
            C = ((x2(i) - x1(i)) .* (x2(i) - x(contraPoint)) + (z2(i) - z1(i)) .* (z2(i) - z(contraPoint))) ./ sqrt((x2(i) - x(contraPoint)) .^ 2 + (z2(i) - z(contraPoint)).^ 2);
            D = 1 ./ (z1(i) - z(contraPoint)) .* (1 - (x1(i) - x(contraPoint)) ./ sqrt((x1(i) - x(contraPoint)) .^ 2 + (z1(i) - z(contraPoint)).^ 2));
            E = 1 ./ (z2(i) - z(contraPoint)) .* (1 - (x2(i) - x(contraPoint)) ./ sqrt((x2(i) - x(contraPoint)) .^ 2 + (z2(i) - z(contraPoint)).^ 2));
            K(contraPoint,i) = (A * (B - C) + D - E)/(4 * pi);
        end
    end
    %% Calculate the augmented matrix
    F = (repmat(Vinf*sind(alpha),1,n))';
    %% Solve the equations
    varGamma=K\F;
end
