function [u,y,l] = kmeans(x,k,h)
%% Agrupa los datos en k clusters usando la aproximaci�n de las medias 
    %Entrada: 
        %x: matriz de caracter�sticas que se van a agrupar. Cada fila
        %   corresponde a un dato y debe estar normalizado.
        %k: n�mero de cl�sters a formarse
        %h: l�mite de iteraciones
    %Salida: 
        %u: vector de las medias de cada cl�ster
        %y: vector de agrupaci�n de los datos x
        %l: n�mero de iteraciones llevadas a cabo
    
    %Asignaci�n aleatoria de los k centroides iniciales.
    u = zeros(k,size(x,2));
    for i = 1:1:k
        u(i,:) = rand(1,size(x,2));
    end
    %Iterar hasta encontrar el valor de la u de los k cl�sters o hasta alcanzar el l�mite de iteraciones  
    i = 0;
    l = i;
    diff = 1;
    while diff ~= 0 && l < h
        %Suma uno a la cantidad de iteraciones
        i = i + 1;
        l = i;
        %Etapa de Asignaci�n:
        %Para cada observaci�n m se asigna un cl�ster: aquel con m�nima
        %diferencia entre las distancias de cada centroide j.
        %La distancia debe inicializarse en un valor alto, el m�ximo.
        d = 100;
        for m = 1:1:size(x,1) %itera los datos
            for j = 1:1:k %itera los centroides
                d_x = distancia(u(j,:),x(m,:));
                if d_x < d
                    d = d_x;
                    y(m,1) = j - 1;
                end
            end
            d = 100; %se reinicia la distancia d en su m�ximo.
        end
        %Etapa de aprendizaje:
        %Para la agrupaci�n realizada se encuentra un nuevo centroide de
        %cada cl�ster, sacando el promedio de los grupos reci�n encontrados
        %y actualizando los u.
        for j = 1:1:k
            %Inicialmente, debe revisarse qu� datos agrup� en el cl�ster j.
            z = zeros(1,size(u,2));
            for m = 1:1:size(y,1)
                if y(m,1) == j - 1
                    z = [z; x(m,:)];
                end
            end
            if size(z,1) > 1
                z = z(2:end,:);
            end
            %Luego se saca el promedio de cada coordenada de el cl�ster j.
            for m = 1:1:size(z,2)
                u_n(j,m) = mean(z(:,m)); 
            end
        end
        %Etapa de verificaci�n de cambio de los u:
        if u_n == u
            diff = 0;
        end
        u = u_n;       
    end
end

function d = distancia(x1,x2)
    d = sum(abs(x1 - x2).^2);
end