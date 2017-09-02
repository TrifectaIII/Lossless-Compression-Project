clc
clear variables 
close all

inputstr = fileread('flatland.txt');
fideli = 5;

results = zeros(fideli,2);


total = length(inputstr);
places = round(linspace(1,total,fideli));
for i = 1:fideli
    results(i,1) = places(i);
    teststr = inputstr(1:places(i));
    tic
    lz77comptest(teststr);
    results(i,2) = toc;
end

plot(results(:,1),results(:,2))