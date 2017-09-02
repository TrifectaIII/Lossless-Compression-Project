clc
clear variables
close all

length = 10000;
slices = 11;

flatres = lz77comptest_graph('flatland.txt',slices,length);

constres = lz77comptest_graph('constant.txt',slices,length);

randres = lz77comptest_graph('random.txt',slices,length);