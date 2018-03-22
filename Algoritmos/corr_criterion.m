function rho = corr_criterion(x,y,type)
%%rho = corr_criterion(x, y, type)
%Entradas:
%   x: matriz de características. Cada columna corresponde a una
%   característica.
%   y: vector de etiquetas.
%   type: tipo de correlación. Spearman para biclase o Pearson para
%   multiclase organzidas éstas clases de menor a mayor o viceversa.
%Salidas:
%   rho: matriz de los cálculos del criterio de correlación. Cada columna
%   corresponde al criterio calculado para una característica. Esta 
%   organizada de mayor a menor. La primera fila es el índice de la
%   característica correspondiente a dicho rho.
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