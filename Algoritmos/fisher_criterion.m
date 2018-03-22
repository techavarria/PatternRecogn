function fdr = fisher_criterion(x, y)
%%fdr = fisher_criterion(x, y)
%Entradas:
%   x: matriz de características. Cada columna corresponde a una
%   característica.
%   y: vector de etiquetas.
%Salidas:
%   fdr: matriz de los cálculos del criterio de fisher. Cada columna
%   corresponde al criterio calculado para una característica. Está 
%   organizada de mayor a menor. La primera fila es el índice de la
%   característica correspondiente a dicho fdr.
    fdrx = zeros(size(x,2),1);
    for i = 1:1:size(x,2)
        for j = 1:1:size(x,2)
            if i ~= j
                num = mean(x(y == 0,i)) - mean(x(y == 1,i));
                den = std(x(y == 0,i))^2 + std(x(y == 1,i))^2;
                fdrx(i) = (num^2)/den;
            end
        end
    end
    [fdr, index] = sort(fdrx,1,'descend');
    fdr = [index, fdr];
    fdr = fdr';
end