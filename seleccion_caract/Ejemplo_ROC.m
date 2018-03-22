clc
clear all;
close all;

%% Cargar datos

load('Caracteristicas.mat');
X = caracteristicas;
X = normalizar(X);
y = etiquetas;

%% Áreas bajo curva ROC
auc = roc_criterion(X,y);