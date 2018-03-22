function [sep,com,ch] = ch_index(y,uc,ut,k,x)
    %Entrada: 
        %y: resultados de la agrupación de datos en k clústers.
        %uc: centroides de los k clústers.
        %ut: media de todos los datos. 
        %k: número de clústers.
        %x: matriz de características.
    %Salida: 
        %sep: medida de separación de la agrupación de los datos.
        %com: medida de compactación de la agrupación de los datos.
        %ch: índice ch de la agrupación de los datos.
    
    %Medida de separación:
    sep = 0;
    for i = 1:1:k
        nk = size(y(y == i - 1),1);
        d = distancia(uc(i,:),ut);
        sep = sep + nk*d;
    end
    sep = sep/(k - 1);
    
    %Medida de compactación:
    com = 0;
    for i = 1:1:k
        for j = 1:1:size(x,1)
            h = y(j,1);
            if h == i - 1
                d = distancia(x(j,:),uc(i,:));
                com = com + d;
            end
        end
    end
    com = com/(size(y,1) - k);
    
    %Índice CH:
    ch = sep/com;
end

function d = distancia(x1,x2)
    d = sum(abs(x1 - x2).^2);
end