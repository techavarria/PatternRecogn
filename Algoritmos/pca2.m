function [vectores, valores, i]= pca2(sigma)
%% [vectores, valores, i] = pca2(sigma)

    %sigma es la matriz de covarianza.
    %vectores corresponde a los vectores propios de la matriz sigma.
    %valores corresponde a los valores propios de la matriz sigma.
    %i corresponde a los índices de los valores propios de la matriz sigma.
    
    [V, D] = eig(sigma);

    [valores, i] = sort(diag(D));
    valores = flipud(valores);
    i = flipud(i);

    vectores = V(:, i);
end