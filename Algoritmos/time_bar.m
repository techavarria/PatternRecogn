function [] = time_bar(A,i)

switch floor((i/A)*100)
    case 10 
        clc
        disp('10%')
        disp('||         |')
    case 20 
        clc
        disp('20%')
        disp('|||        |')
    case 30 
        clc
        disp('30%')
        disp('||||       |')
    case 40 
        clc
        disp('40%')
        disp('|||||      |')
    case 50 
        clc
        disp('50%')
        disp('||||||     |')
    case 60 
        clc
        disp('60%')
        disp('|||||||    |')
    case 70 
        clc
        disp('70%')
        disp('||||||||   |')
    case 80 
        clc
        disp('80%')
        disp('|||||||||  |')
    case 90 
        clc
        disp('90%')
        disp('|||||||||| |')
    case 100
        clc
        disp('100%')
        disp('||||||||||||')



end

