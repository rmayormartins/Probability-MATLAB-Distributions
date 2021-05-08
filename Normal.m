function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Gerar uma Gaussiana(u,s,x,1)
va=normrnd(0,1,100000,1);
vb=normrnd(1,0.5,100000,1);
% dfittool(va)
% dfittool(vb)
% disttool
ha=histfit(va,100);
delete(ha(1));

% std(va) %desvio padrao
% mean(va)%media
% var(va) %variancia

% a = mean(va)
% b= mean(mean(va))

% var(va)
% vari=( mean(va.^2) - (mean(va))^2 )

% var(va+2)
% var(va)

% mean(va)
% mean(va+2)

% var(va)
% var(2*va)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%Somar duas Gaussianas (u,s,x,1)
hold on
v1=normrnd(2,1,1000000,1);
v2=normrnd(2,1,1000000,1);

z=sqrt(v1.^2 + v2.^2);

mpdf(z,100)
%gauss1

h1=histfit(v1,20); %plota a gaussiana
set(h1(1),'facecolor',[1 0 0]); %seta a cor da curva
set(h1(2),'color',[0 0 1],'linewidth',2); %seta a linha 
delete(h1(1)); %tira as barras do histograma


%gauss somada
hz=histfit(z,20);
delete(hz(1));

%calcula o desvio padrao
std (v1)
std (z)
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%Calcula as probabilidades
%normcdf(x,u,s)         -->P(X<x)
%normspec([a b],u,s)    -->P(a<X<b) e grafico

%P(6.72<X<10.16)
%so apresenda o resultado
D= normcdf(10.16,5,4)-normcdf(6.72,5,4 )

%P(6.72<x<10.16)
p = normspec([6.72 10.16],5,4)

%P(x<46)
p2=normcdf(46,61,10)

%P(x>4)
p3= 1-normcdf(4,5,4)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Gerar chi-quadrado

clc
close all
clear all

for c=2:20
x = 0:0.01:20; 
y = chi2pdf(x,c);
plot(x,y),hold on
pause;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Cauchy


va=randn(100000,1);
vb=randn(100000,1);

z= va./vb;

hist(z,20);







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calculo do Momento
clear all
close all

hold on
vx=normrnd(2,1,100000,1);
mpdf1(vx,20);

mx=moment(vx,2);         


hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Soma de Uniformes -Teste 1

x = rand(1,100000)
y = rand(1,100000)
z=x+y


l = rand(1,100000)
w=z+l

k = rand(1,100000)

m= w+k
hold on

hist(x,200)
hist(z,200)
hist(w,200)
hist(m,200)


hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Soma de uniformes - teste 2
z = 0;

for c=1:100

rd = rand(1,1e6);
z = z + rd;

mpdf1(z,50)

pause;

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Soma de exponenciais - teste 1

z = 0;

for c=1:100

rd = exprnd(1,[1,1e6]);
z = z + rd;

mpdf1(z,50)

pause;

end

    









end

