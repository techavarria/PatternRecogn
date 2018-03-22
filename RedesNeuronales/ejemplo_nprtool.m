clc
clear;
close all;

%% Generar datos
path = 'C:\Users\Usuario\Desktop\PatternRecogn\Caracteristicas.mat';
load(path);
X = caracteristicas;
X = normalizar(X);
d = etiquetas;
d = [d,ones(length(d),1)];
[X_train, X_test, y_train, y_test] = train_test_split(X, d, 0.005);

nprtool;