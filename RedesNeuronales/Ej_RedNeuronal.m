clc;
clear all;
close all;

%% Generar datos
distance = 4;
[Xt,dt] = gen_data2(distance,[],'d');               % Generar datos de entrenamiento
[X,d] = gen_data2(distance,[],'d',[],400);          % Generar datos de prueba

%% Entrenamiento de la red
input = 6;                                          % Número de neuronas de la capa de entrada
hidden = 6;                                         % Número de neuronas de la capa oculta

w1 = (rand(size(X,2),input) - 1)*.25;               % Inicialización de w1
b1 = (rand(1,input) - 1)*.25;                       % Inicialización de b1
w2 = (rand(input,hidden) - 1)*.25;                  % Inicialización de w2
b2 = (rand(1,hidden) - 1)*.25;                      % Inicialización de b2
w3 = (rand(hidden,1) - 1)*.25;                      % Inicialización de w3
b3 = (rand(1,1) - 1)*.25;                           % Inicialización de b3

alpha = 0.2;                                        % Factor de aprendizaje
last_mse = 2;                                       % Inicialización del MSE
tol = 0.00001;                                      % Tolerancia (factor de parada)

for i = 1:200                                       % Itera 200 veces
    for j = 1:20                                    % Itera 20 veces en cada iteración    
        [Xt,dt] = mix_data(Xt,dt);                  % Mezcla los datos para el aprendizaje de la red        
        [w1,b1,w2,b2,w3,b3] = ...                   % Entrena la red           
    net_learn_3(Xt,dt,alpha,w1,b1,w2,b2,w3,b3);    
    end
    mse = net_eval(Xt,dt,w1,b1,w2,b2,w3,b3);        % Evalúa la red y encuentra un MSE   
    if abs(mse - last_mse) < tol                    % Verifica si la diferencia en MSE es menor que la tolerancia      
        disp(strcat(['Convergencia en i = ' num2str(i)]));       
        % Detiene el entrenamiento y se sale del ciclo      
        break;       
    end   
    last_mse = mse;                                 % Actualiza el MSE anterior   
end
net_boundaries(Xt,dt,w1,b1,w2,b2,w3,b3);            % Grafica la red con los datos de entrenamiento

%% Evaluación de la red
figure;
[mse,sen,esp,y] = net_eval(X,d,w1,b1,w2,b2,w3,b3);  % Evalúa la red
net_boundaries(X,d,w1,b1,w2,b2,w3,b3);              % Grafica la red con los datos de prueba
y(y < 0.5) = 0;                                     % Verifica si y pertenece a la clase 0
y(y > 0.5) = 1;                                     % Verifica si y pertenece a la clase 1

figure;
subplot(1,3,1);                                     % Grafica el set de entrenamiento
plot(Xt(dt == 0,1),Xt(dt == 0,2),'or','MarkerFaceColor','r');
hold on;
plot(Xt(dt == 1,1),Xt(dt == 1,2),'og','MarkerFaceColor','g');
title('Set de entrenamiento');
legend('Clase 0','Clase 1');
subplot(1,3,2);                                     % Grafica el set de prueba real
plot(X(d == 0,1),X(d == 0,2),'or','MarkerFaceColor','r');
hold on;
plot(X(d == 1,1),X(d == 1,2),'og','MarkerFaceColor','g');
title('Set de prueba');
legend('Clase 0','Clase 1');
subplot(1,3,3);                                     % Grafica el set de prueba clasificado
plot(X(y == 0,1),X(y == 0,2),'or','MarkerFaceColor','r');
hold on;
plot(X(y == 1,1),X(y == 1,2),'og','MarkerFaceColor','g');
title('Resultado de la clasificación');
legend('Clase 0','Clase 1');

