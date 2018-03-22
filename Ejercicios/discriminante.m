clc
clear;
close all;

%% Generar datos
path = 'C:\Users\Usuario\Documents\MATLAB\Procesamiento digital\2018\Reconocimiento de patrones\Hipotension\Caracteristicas.mat';
load(path);
X = caracteristicas;
X = X(:,1:2);
X = normalizar(X);
d = etiquetas;
[X_train, X_test, y_train, y_test] = train_test_split(X, d, 0.7);


figure;
subplot(1,2,1);
plot(X_train(y_train==0,1),X_train(y_train==0,2),'ro','MarkerFaceColor','r');
hold on
plot(X_train(y_train==1,1),X_train(y_train==1,2),'go','MarkerFaceColor','g');

%% Entrenamiento del clasificador
X = [X_train,ones(size(X_train,1),1)];
w = inv(X'*X) * (X'*y_train);

x1 = [min(X(:,1)), max(X(:,1))];
x2 = -w(1) * x1/w(2) + (-w(3) + 0.5)/w(2);
plot(x1,x2,'k','LineWidth',1);

%% Evaluar clasificador
X_test = [X_test,ones(size(X_test,1),1)];
y = X_test*w;
y(y < 0.5) = 0;
y(y > 0.5) = 1;

subplot(1,2,2);

hold on;

for i = 1:size(y,1)

    if y(i) == 0 && y_test(i) == 0               % Gráfica de verdaderos negativos

        plot(X_test(i,1),X_test(i,2),'ro','MarkerFaceColor','r');

    elseif y(i) == 1 && y_test(i) == 1           % Gráfica de verdaderos positivos

        plot(X_test(i,1),X_test(i,2),'go','MarkerFaceColor','g');

    elseif y(i) == 0 && y_test(i) == 1           % Gráfica de falsos negativos

        plot(X_test(i,1),X_test(i,2),'ro','MarkerFaceColor','r');

        plot(X_test(i,1),X_test(i,2),'gd');

    elseif y(i) == 1 && y_test(i) == 0           % Gráfica de falsos positivos

        plot(X_test(i,1),X_test(i,2),'go','MarkerFaceColor','g');

        plot(X_test(i,1),X_test(i,2),'rd');

    end

end


plot(x1,x2,'k','LineWidth',1);              % Gráfica de la línea


vp = sum(y_test == 1 & y' == 1);                 % Medición de verdaderos positivos

vn = sum(y_test == 0 & y' == 0);                 % Medición de verdaderos negativos

fp = sum(y_test == 0 & y' == 1);                 % Medición de falsos positivos

fn = sum(y_test == 1 & y' == 0);                 % Medición de falsos negativos


sen = 100*vp/(vp + fn);                     % Medición de sensibilidad

esp = 100*vn/(vn + fp);                     % Medición de especificidad

matrix = confusion(y_test,y,2)
