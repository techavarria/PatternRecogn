function y = normalizar(x)
%y = normalizar(x)
    for i = 1:1:size(x,2)
        maximo = max(x(:,i));
        minimo = min(x(:,i));
        y(:,i) = (x(:,i) - minimo)/(maximo - minimo);
    end
end