function [ output_args ] = Untitled2( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%BINOMIAL

%n = numero de experimentos bernoulli
%p = probabilidade d sucesso em cada um dos n experimentos
%X = variavel aleatoria
x= 0:10;
n = 10
p = 0.5
y = binopdf(x,n,p); %P(X=<x)
z = binocdf(x,n,p); %P(X=x)
figure(1)
subplot(2,1,1)
stem(x,y,'*')
subplot(2,1,2)
stem(x,z,'o')
[Media,Variancia] = binostat(n,p)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%POISSON

lambda = 4
x1 = 0:10;
y1 = poisspdf(x1,lambda)
z1 = poisscdf(x1,lambda)
figure(1)
subplot(2,1,1)
stem(x1,y1,'*')
subplot(2,1,2)
stem(x1,z1,'o')
[Media,Variancia] = poisstat(lambda)

% lambda = 4
% for n=1:20
% x = 0:0.01:200; 
% y(n) = poisspdf(x1,lambda);
% Y = y(n) + 
% plot(x,y),hold on
% pause;
% end


%POISSON E APROXIMACAO BINOMIAL

lambda = 0.40
x1 = 0:10;
y1 = poisspdf(x1,lambda)
z1 = poisscdf(x1,lambda)
figure(1)
subplot(2,1,1)
stem(x1,y1,'*')
subplot(2,1,2)
stem(x1,z1,'o')
[Media,Variancia] = poisstat(lambda)

n = 40
p = 0.01
y = binopdf(x1,n,p); %P(X=<x)
z = binocdf(x1,n,p); %P(X=x)
figure(2)
subplot(2,1,1)
stem(x,y,'*')
subplot(2,1,2)
stem(x,z,'o')
[Media,Variancia] = binostat(n,p)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%GEOMETRICA

x = 0:10
p = 0.5
y = geopdf(x,p)
z = geocdf(x,p); %P(X=x)
figure(2)
subplot(2,1,1)
stem(x,y,'*')
subplot(2,1,2)
stem(x,z,'o')
[Media,Variancia] = geostat(p)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










end

