function x = algoritmos_geneticos(feats,labels,generaciones,tolerancia)
    gaOptions = gaoptimset('PopulationType','bitstring','PopulationSize',size(feats,2),'Generations',generaciones,'TimeLimit',300,'FitnessLimit',0.06,'StallGenLimit',50,'TolFun',tolerancia);
    [x, fval, exitFlag] = ga(@fitnessKNN,size(feats,2),gaOptions)
end