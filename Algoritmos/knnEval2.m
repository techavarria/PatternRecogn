function err = knnEval2(xtrain,ytrain,xtest)
    for i = 1:size(ytrain,1)
        if ytrain(i) == '0'
            ytrain2(i) = 0;
        end
        if ytrain(i) == '1'
            ytrain2(i) = 1;
        end
    end
    
    for i = 1:1:length(xtest)
        x = xtest(i,:);
        y(i) = clasificador(xtrain,ytrain,x,3);
    end    
    err = y';
end

function c = clasificador(xe,ce,x,k)
    for i=1:1:size(xe,1)
        di(i) = distancia(x, xe(i,:));
    end
    [y, index] = sort(di, 2, 'ascend');
    y = y(1:k);
    c = mode(ce(index(1:k)));
end

function d = distancia(x1,x2)
    d = sqrt(sum(abs(x1 - x2).^2));
end