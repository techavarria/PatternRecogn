function [sen, esp, pre, rec, F1] = validation(y,d,labels)
% Realiza la evaluación del comportamiento de un algoritmo de aprendizaje supervisado
% Entradas:
%   y: datos clasificados
%   d: etiquetas reales
% Salidas:
%   sen: sensibilidad
%   esp: especificidad 




    vp = sum(y == labels(2) & d == labels(2));
    vn = sum(y == labels(1) & d == labels(1));
    fp = sum(y == labels(2) & d == labels(1));
    fn = sum(y == labels(1) & d == labels(2));
    
    sen = 100*vp/(vp + fn);
    esp = 100*vn/(vn + fp);
    
    pre = 100 * (vp/(vp+fp));
    rec = 100 * (vn/(vn+fn));
    
    F1 = (2*pre*rec)/(pre+rec);
end