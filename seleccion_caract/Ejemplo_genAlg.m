%% Resumen:
clc
clear;
close all;
path = 'C:\Users\Usuario\Documents\MATLAB\Procesamiento digital\2018-1\Reconocimiento de patrones\Scripts\Caracteristicas.mat';
%% Cargar datos
load(path);

X = caracteristicas;
X = normalizar(X);
y = etiquetas;


%% Selección por algoritmo 
Xs = algoritmos_geneticos(X,y,20,0.5);