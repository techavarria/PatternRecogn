%% Resumen: a mayor FDR mejor descriminaci�n entre clases
clc
clear;
close all;
path = 'D:\Users\ASUS\Documents\Maria Sthefany Cardona Pineda\Practica\Matlab\Reconocimiento de patrones\Matlab_Reconocimiento_de_patrones\Scripts\Caracteristicas.mat';
%% Cargar datos
load(path);

X = caracteristicas;
X = normalizar(X);
y = etiquetas;

%% Criterios de selecci�n
fdr =  fisher_criterion(X,y);
rho = corr_criterion(X,y,'pearson');