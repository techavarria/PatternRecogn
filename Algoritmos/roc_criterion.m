function auc = roc_criterion(x,y)
%%auc = roc_criterion(x, y)
%Entradas:
%   x: matriz de características. Cada columna corresponde a una
%   característica.
%   y: vector de etiquetas.
%Salidas:
%   auc: matriz de los cálculos del criterio del área bajo la curva ROC. 
%   Cada columna corresponde al criterio calculado para una característica. 
%   Está organizada de mayor a menor. La primera fila es el índice de la
%   característica correspondiente a dicho auc.
    abc = zeros(size(x,2),1);
    for i = 1:1:size(x,2)
        x1 = [x(:,i), y];
        abc_roc = roc(x1);
        abc_roc = abc_roc.AUC;
        abc(i) = abc_roc;
    end
    [abcx, index] = sort(abc,1,'descend');
    auc = [index, abcx];
    auc = auc';
end