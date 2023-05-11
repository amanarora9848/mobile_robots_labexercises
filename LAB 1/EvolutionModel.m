function X_new = EvolutionModel (X,U)
    
    X_new = zeros(3,1);
    X_new(1) = X(1) + U(1)*cos(X(3));
    X_new(2) = X(2) + U(1)*sin(X(3));
    X_new(3) = X(3) + U(2);
     
end