function [sep,com,ch] = ch_index(y,uc,ut,k,x)
    %Entrada: 
        %y: resultados de la agrupaci�n de datos en k cl�sters.
        %uc: centroides de los k cl�sters.
        %ut: media de todos los datos. 
        %k: n�mero de cl�sters.
        %x: matriz de caracter�sticas.
    %Salida: 
        %sep: medida de separaci�n de la agrupaci�n de los datos.
        %com: medida de compactaci�n de la agrupaci�n de los datos.
        %ch: �ndice ch de la agrupaci�n de los datos.
    
    %Medida de separaci�n:
    sep = 0;
    for i = 1:1:k
        nk = size(y(y == i - 1),1);
        d = distancia(uc(i,:),ut);
        sep = sep + nk*d;
    end
    sep = sep/(k - 1);
    
    %Medida de compactaci�n:
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
    
    %�ndice CH:
    ch = sep/com;
end

function d = distancia(x1,x2)
    d = sum(abs(x1 - x2).^2);
end