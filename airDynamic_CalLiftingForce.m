function Cy=airDynamic_CalLiftingForce(Vinf,RHO,dZ,S,varGamma)
    L= sum(RHO.*Vinf.*dZ.*varGamma);
    Cy=L/(0.5*RHO*Vinf*Vinf*S);
end