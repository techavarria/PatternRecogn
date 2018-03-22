clc
clear all;
close all;

load('Caracteristicas.mat');
 X = caracteristicas;
 d = etiquetas;
 k_cv = 5;
%% Generación de grupos 
g = crossvalind('Kfold',size(X,1),k_cv);
k = 5;
figure;
for i = 1:k_cv
    train_x = X(g ~=i,:);
    train_d = d(g ~=i,1);
    test_x = X(g ==i,:);
    test_d = d(g ==i,:);
    
    [u,y] = kmeans(train_x,2,500);
    [sep(i),com(i),ch(i)] = ch_index(y,u,mean(train_x),2,train_x);
    
    sigma = cov(train_x);
    eu = pca2(sigma);
    X2 = train_x*(eu(:,1:3));
    subplot(2,3,i);
    plot3(X2(y == 0,1),X2(y == 0,2),X2(y == 0,3),'r*');
    hold on;
    plot3(X2(y == 1,1),X2(y == 1,2),X2(y == 1,3),'ok','MarkerFaceColor','b');
end