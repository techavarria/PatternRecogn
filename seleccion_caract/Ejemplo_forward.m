%% Resumen:
clc
clear;
close all;
path = 'D:\Users\ASUS\Documents\Maria Sthefany Cardona Pineda\Practica\Matlab\Reconocimiento de patrones\Matlab_Reconocimiento_de_patrones\Scripts\Caracteristicas.mat';
%% Cargar datos
load(path);

X = caracteristicas;
X = normalizar(X);
y = etiquetas;

Xs = secuencial_adelante(X,y,5);