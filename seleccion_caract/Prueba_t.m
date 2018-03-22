clc
clear all;
close all;

%% Si el valor p da menos 0.05 significa que las caracteristicas tienen valores de medianas separadas entre sanos y enfermos, osea que la caracteristica es buena 

%% Cargar datos

load('Caracteristicas.mat');
X = caracteristicas;
X = normalizar(X);

%% Prueba T para cada caracteristica 
h = zeros(size(X,2),1);
p = zeros(size(X,2),1);
y = etiquetas;

for i = 1 : size(X,2)
    [h(i,1),p(i,1)] = ttest2(X(y == 0, i), X(y == 1,i));
end
clear i;
