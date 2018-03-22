clc; clear; close all

load('Caracteristicas.mat') % caracteristicas, etiquetas, labels, nombres de las caracteristicas
X = caracteristicas; 
y = etiquetas; 

[X_train, X_test, y_train, y_test] = train_test_split(X, y, 0.7);
c = knn(X_train,y_train,X_test,5);
[sen, esp, pre, rec, F1] = validation(c,y_test,labels);
matrix = confusion(y_test,c,2);