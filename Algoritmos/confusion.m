function matrix = confusion(d,y,n)
%% Calcula la matriz de confusi�n de los datos clasificados
    % Entrada: 
        %d: vector de etiquetas 
        %y: resultado de la clasificaci�n
        %n: n�mero de clases
    %Salida: 
        %matrix: matriz de confusi�n
    
    matrix = zeros(n,n);
 
    for i = 1:n
        t = length(d(d == i - 1));
        for j = 1:n
            aux = sum((d == i - 1) & (y == j - 1));
            matrix(i,j) = aux*100/t;
        end
    end
    
    
end