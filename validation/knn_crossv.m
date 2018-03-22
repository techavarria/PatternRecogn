
clc
clear all;
close all;

load('Caracteristicas.mat');
 X = caracteristicas;
 d = etiquetas;

 k_cv = 5;
 
%% Generación de grupos 
g = crossvalind('kfold',size(X,1),k_cv);
%gt = crossvalind('Kfold',size(Xt,1),k_cv);

%% Aplicación del k-NN

figure('name','Clasificación k-NN');

k = 5;                                          % Número de vecinos cercanos

for i = 1:k_cv

    train_x = X(g ~= i,:);                    % Datos para el entrenamiento

    train_d = d(g ~= i,1);                      % Etiquetas para el entrenamiento

    test_x = X(g == i,:);                       % Datos para la prueba

    test_d = d(g == i);                         % Etiquetas para la prueba

   

    y(:,i) = knn(train_x,train_d,test_x,k);     % Aplicar algoritmo

   

    vp = sum(test_d == 1 & y(:,i)' == 1);       % Medición de verdaderos positivos

    vn = sum(test_d == 0 & y(:,i)' == 0);       % Medición de verdaderos negativos

    fp = sum(test_d == 0 & y(:,i)' == 1);       % Medición de falsos positivos

    fn = sum(test_d == 1 & y(:,i)' == 0);       % Medición de falsos negativos

   

    sen(i) = 100*vp/(vp + fn);                  % Medición de sensibilidad

    esp(i) = 100*vn/(vn + fp);                  % Medición de especificidad

   

    subplot(3,2,i);                             % Gráfica de resultados con el grupo i

    plot(test_x(test_d == 0,1),test_x(test_d == 0,2),'ro','MarkerFaceColor','r');

    hold on;

    plot(test_x(test_d == 1,1),test_x(test_d == 1,2),'go','MarkerFaceColor','g');


    m = 1;

    for j = 1:size(y,1)

        if y(j) ~= test_d(j)

            x_wrong(m,:) = test_x(j,:);         % Detección de errores cometidos por el

                                                % clasificador

            m = m + 1;

        end

    end


    plot(x_wrong(:,1),x_wrong(:,2),'*k');

    if i == 5

        legend('Clase 0','Clase 1','Errores','Location','bestoutside');

    end

end


