function [results] = lz77comptest_graph(filename,num_data,fin)

inputstr = fileread(filename);
fideli = num_data;

results = zeros(fideli,3);

total = min(length(inputstr),fin);
places = round(linspace(1,total,fideli));
for i = 1:fideli
    results(i,1) = places(i);
    teststr = inputstr(1:places(i));
    tic
    results(i,3) = lz77comptest(teststr);
    results(i,2) = toc;
end

figure
plot(results(:,1),results(:,2),'.-','LineWidth',5,'MarkerSize',30)
grid on
set(gca,'FontSize', 40)
title([filename,' Length vs Runtime'])
xlabel('Length (char)')
ylabel('Runtime (s)')

figure
plot(results(:,1),results(:,3),'.-','LineWidth',5,'MarkerSize',30)
grid on
set(gca,'FontSize', 40)
title([filename,' Length vs Compression Ratio'])
xlabel('Length (char)')
ylabel('Compression Ratio (U/C)')

end