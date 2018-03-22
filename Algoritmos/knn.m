function c = knn(xe,ce,x,k)
%% Clasifica los datos en x de acuerdo a la ley de los k vecinos más cercanos
    %Entrada: 
        %xe: matriz de características de entrenamiento
        %ce: vector de clases de entrenamiento
        %x: vector de características a clasificar
        %k: factor del algoritmo
    %Salida: 
        %c: clases de los datos x
    
    c = zeros(size(x,1),1);

    for i = 1:1:size(x,1)
        time_bar(size(x,1),i)
        for j = 1:1:size(xe,1)
            di(j,1) = distancia(x(i,:), xe(j,:));
            di(j,2) = ce(j);
        end
        di = sortrows(di,1);
        k_class = mean(di(1:k,2));
        c(i) = round(k_class); 
    end
    
end

function d = distancia(x1,x2)
    d = sqrt(sum(abs(x1 - x2)));
end