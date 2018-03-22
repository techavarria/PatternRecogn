function x = secuencial_adelante(feats,labels,particiones)
    c = cvpartition(labels,'k',particiones);
    opts = statset('display','iter');
    [fs,history] = sequentialfs(@knnEval1,feats,labels,'cv',c,'options',opts);
    x = zeros(1,size(feats,2));
    x(fs) = 1;
end