function [X_train, X_test, y_train, y_test] = train_test_split(X, y, p)
N = size(X,1); 
tf = false(N,1);
tf(1:round(p*N)) = true;     
tf = tf(randperm(N));
X_train = X(tf,:); 
X_test = X(~tf,:); 
y_train = y(tf);
y_test = y(~tf); 
end

