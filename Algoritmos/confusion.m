function matrix = confusion(d,y,n)
%% Calcula la matriz de confusión de los datos clasificados
    % Entrada: 
        %d: vector de etiquetas 
        %y: resultado de la clasificación
        %n: número de clases
    %Salida: 
        %matrix: matriz de confusión
    
    matrix = zeros(n,n);
 
    for i = 1:n
        t = length(d(d == i - 1));
        for j = 1:n
            aux = sum((d == i - 1) & (y == j - 1));
            matrix(i,j) = aux*100/t;
        end
    end
    
    
end