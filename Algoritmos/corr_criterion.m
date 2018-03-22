function rho = corr_criterion(x,y,type)
%%rho = corr_criterion(x, y, type)
%Entradas:
%   x: matriz de caracter�sticas. Cada columna corresponde a una
%   caracter�stica.
%   y: vector de etiquetas.
%   type: tipo de correlaci�n. Spearman para biclase o Pearson para
%   multiclase organzidas �stas clases de menor a mayor o viceversa.
%Salidas:
%   rho: matriz de los c�lculos del criterio de correlaci�n. Cada columna
%   corresponde al criterio calculado para una caracter�stica. Esta 
%   organizada de mayor a menor. La primera fila es el �ndice de la
%   caracter�stica correspondiente a dicho rho.
    rhox = zeros(size(x,2),1);
    for i = 1:1:size(x,2)
        rhox(i) = corr(x(:,i),y,'type',type); 
    end
    rhoxp = abs(rhox);
    [~, index] = sort(rhoxp,1,'descend');
    rho = zeros(2,size(x,2));
    for i = 1:1:size(index,1)
        rho(1,i) = index(i);
        rho(2,i) = rhox(index(i));
    end
end