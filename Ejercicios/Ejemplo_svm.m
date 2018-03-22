clc
clear;
close all;

%% Generar datos
path = 'C:\Users\Usuario\Documents\MATLAB\Procesamiento digital\2018\Reconocimiento de patrones\Hipotension\Caracteristicas.mat';
load(path);
X = caracteristicas;
X = X(:,1:2);
X = normalizar(X);
y = etiquetas;
[Xt, X, dt, d] = train_test_split(X, y, 0.7);


%% Caracteristicas del clasificador
p = 0.5;
ker = 'rbf';


%% 
svmt = fitcsvm(Xt,dt,'KernelFunction',ker,'KernelScale',p);

%%
y = predict(svmt,X);
 
[sen,esp] = validation(y',d,[0,1]);

%% Graficar resultados

figure;
subplot(1,3,1);                                         % Graficar datos de entrenamiento
plot(Xt(dt == 0,1),Xt(dt == 0,2),'or','MarkerFaceColor','r');
hold on;
plot(Xt(dt == 1,1),Xt(dt == 1,2),'og','MarkerFaceColor','g');
plot(Xt(svmt.IsSupportVector,1),Xt(svmt.IsSupportVector,2),'k*');
                                                        % Grafica los
                                                       % vectores soporte
svcbound(Xt(svmt.IsSupportVector,:),dt(svmt.IsSupportVector),...
'poly',2,0,svmt.Alpha,svmt.Bias,0,2);               % Grafica el umbral de decisión de la
                                                        % máquina de soporte
title('Set de entrenamiento');
legend('Clase 0','Clase 1','Vectores soporte');
xlabel('X1');
ylabel('X2');
subplot(1,3,2);                                         % Graficar los datos de prueba originales
plot(X(d == 0,1),X(d == 0,2),'or','MarkerFaceColor','r');
hold on;
plot(X(d == 1,1),X(d == 1,2),'og','MarkerFaceColor','g');
svcbound(Xt(svmt.IsSupportVector,:),dt(svmt.IsSupportVector),...
'poly',2,0,svmt.Alpha,svmt.Bias,0,2);

title('Set de prueba');
legend('Clase 0','Clase 1');
xlabel('X1');
ylabel('X2');

subplot(1,3,3);                                         % Graficar los datos de prueba clasificados
plot(X(y == 0,1),X(y == 0,2),'or','MarkerFaceColor','r');
hold on;
plot(X(y == 1,1),X(y == 1,2),'og','MarkerFaceColor','g');
svcbound(Xt(svmt.IsSupportVector,:),dt(svmt.IsSupportVector),'poly',2,0,svmt.Alpha,svmt.Bias,0,2);
title('Resultados de la clasificación');
legend('Clase 0','Clase 1');
xlabel('X1');
ylabel('X2');