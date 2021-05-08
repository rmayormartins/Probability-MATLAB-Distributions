clc
close all
clear all

for c=2:20
x = 0:0.01:20; 
y = chi2pdf(x,c);
plot(x,y),hold on
pause;
end