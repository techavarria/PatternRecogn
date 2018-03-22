function err = fitnessKNN(posV)

path = 'C:\Users\Usuario\Documents\MATLAB\Procesamiento digital\2018-1\Reconocimiento de patrones\Scripts\Caracteristicas.mat';
%% Cargar datos
load(path);

X = caracteristicas;
X = normalizar(X);
y = etiquetas;

y = y + 1;

x = X(:,find(posV == 1));
cp = cvpartition(y,'k',10);
MCR = crossval('mcr',x,y,'Predfun', @knnEval2,'partition',cp);
err = MCR;

end