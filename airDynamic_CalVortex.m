%--------------------------------------------------------------------------
% airDynamic_CalVortex.m
% 
% Purpose:
%   Calculate and solve the lifting ring quantity of each horseshoe vortex.
%
% Last modified:   2023/10/14    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function [varGamma,K,F]=airDynamic_CalVortex(x,x1,x2,z,z1,z2,Vinf,alpha,n)
    %% Calculate the coefficient matrix of the equations
    for i=1:n
        for j=1:n
            A = 1 / ((x2(j) - x(i)) * (z1(j) - z(i)) - ((x1(j) - x(i)) * (z2(j) - z(i))));
            B = ((x2(j) - x1(j)) * (x1(j) - x(i)) + ((z2(j) - z1(j)) * (z1(j) - z(i)))) / sqrt(((x1(j) - x(i))^ 2) + (z1(j) - z(i))^2);
            C = ((x2(j) - x1(j)) * (x2(j) - x(i)) + ((z2(j) - z1(j)) * (z2(j) - z(i)))) / sqrt(((x2(j) - x(i))^ 2) + ((z2(j) - z(i))^2));
            D = 1 / (z1(j) - z(i)) * (1 - (x1(j) - x(i)) / sqrt((x1(j) - x(i))^ 2 + (z1(j) - z(i))^ 2));
            E = 1 / (z2(j) - z(i)) * (1 - (x2(j) - x(i)) / sqrt((x2(j) - x(i))^ 2 + (z2(j) - z(i))^ 2));
            K(i,j) = (A * (B - C) + D - E)/(4 * pi);
        end
    end
    %% Calculate the augmented matrix
    F = (repmat(-Vinf*alpha,1,n))';
    %% Solve the equations
    varGamma=K\F;
end
