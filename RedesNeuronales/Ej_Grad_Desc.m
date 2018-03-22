
%% TOSTA EL PC

% clc
% clear;
% close all;
% 
% %% Generar datos
% path = 'C:\Users\Usuario\Desktop\PatternRecogn\Caracteristicas.mat';
% load(path);
% X = caracteristicas;
% X = X(:,1:2);
% X = normalizar(X);
% d = etiquetas;
% % [X_train, X_test, y_train, y_test] = train_test_split(X, d, 0.7);
% 
% %% Entrenamiento red
% w = (rand(size(X,2),1) - .5)*.25;
% b = (rand - .5)*.25;
% 
% alpha = 0.5;
% last_mse = 2;
% tol = 0.001;
% 
% for i = 1:100
%     for j = 1:20
%         [w,b] = lms_learn(X,d,alpha,w,b);
%     end
%     mse = net_eval(X,d,w,b);
%     if (abs(last_mse - mse) < tol)
%         disp(strcat(['Convergencia en i = ' num2str(i)]))
%         break;
%     end
%     last_mse = mse;
% end
% 
% %% Evaluación de la Red
% figure;
% [mse,sen,esp,y] = net_eval(X,d,w,b);
% 
% y(y < 0.5) = 0;                                     % Identifica si y pertenece a la clase 0
% y(y > 0.5) = 1;                                     % Identifica si y pertenece a la clase 1
% figure;
% subplot(1,2,1);                                     % Gráfica del set de entrenamiento
% plot(X(d == 0,1),X(d == 0,2),'or','MarkerFaceColor','r');
% hold on;
% plot(X(d == 1,1),X(d == 1,2),'og','MarkerFaceColor','g');
% title('Set de entrenamiento/prueba');
% legend('Clase 0','Clase 1');
% subplot(1,2,2);                                     % Gráfica del resultado de clasificación
% plot(X(y == 0,1),X(y == 0,2),'or','MarkerFaceColor','r');
% hold on;
% plot(X(y == 1,1),X(y == 1,2),'og','MarkerFaceColor','g');
% title('Resultado de la clasificación');
% legend('Clase 0','Clase 1');