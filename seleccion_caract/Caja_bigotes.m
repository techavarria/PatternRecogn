clc
clear all;
close all;

%% Si el valor p da menos 0.05 significa que las caracteristicas tienen valores de medianas separadas entre sanos y enfermos, osea que la caracteristica es buena 

%% Cargar datos

load('Caracteristicas.mat');
X = caracteristicas;
X = normalizar(X);
 y = etiquetas;

%% Diagrama de caja
figure;

for i = 1:size(X,2)
    subplot(4,2,i);
    boxplot(X(:,i),y);
%    title (i)
end