clc;
clear;

%%%%%%%%%%%%%% LETRA A %%%%%%%%%%%%%% 
disp('Lista de sistemas lineares: Exercicio 1 letra (a)');
disp('Para esse exercicio iremos carregar 3 matrizes diferentes e analizar a esparsidade de cada uma e suas respectivas decomposicoes');

%%%%%%%%%%%%%% MATRIZ DOS COEFICIENTES %%%%%%%%%%%%%%
input ("Pressione enter para plotar as matrizes dos coeficientes A");
clc;
load ("./matrizes/plat362.mat");
A = Problem.A;
load ("./matrizes/rail_5177.mat");
B = Problem.A;
load ("./matrizes/orsirr_1.mat");
C = Problem.A;
figure(1);
spy(A);
figure(2);
spy(B);
figure(3);
spy(C);
disp('Como podemos perceber todas as tres matrizes dos coeficientes tem disposicoes diferentes.');

%%%%%%%%%%%%%%  MATRIZ L %%%%%%%%%%%%%%
input("Pressione enter para plotar as matriz de decomposicao inferior L.");
clf;
[LA, UA, PA] = lu(A);
[LB, UB, PB] = lu(B);
[LC, UC, PC] = lu(C);
figure(1);
spy(LA);
figure(2);
spy(LB);
figure(3);
spy(LC);
disp('Como podemos perceber todas as tres matrizes sao triangulares inferiores.');

%%%%%%%%%%%%%% MATRIZ U %%%%%%%%%%%%%%
input("Pressione enter para plotar as matriz de decomposicao superior U.");
clf;
figure(1);
spy(UA);
figure(2);
spy(UB);
figure(3);
spy(UC);
disp('Como podemos perceber todas as tres matrizes sao triangulares superiores.');

%%%%%%%%%%%%%% CONCLUSAO LETRA A %%%%%%%%%%%%%%
disp('Pode-se concluir que independente da disposicao dos valores das matrizes dos coeficientes as matrizes L e U tem o mesmo formato.');
input("Pressione enter para finalizar a letra (a) do exercicio 1");
close all;
clc;
clear;

%%%%%%%%%%%%%% LETRA B %%%%%%%%%%%%%%
disp('Lista de sistemas lineares: Exercicio 1 letra (b)');
disp('Para esse exercicio iremos utilizar as mesmas matrizes, calcular a solucao para b igual um vetor de 1 e calcular a norma maxima');

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
load ("./matrizes/plat362.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n,1);
input('Aperte enter para obter o vetor resultante da multiplicacao da matriz dos coeficientes pelo vetor de 1');
clc;
disp("b=");
disp(b);
input("Aperte enter para obter o vetor solucao da matriz dos coeficientes por b obtendo novamente o vetor de 1");
clc;
disp("x=");
x = A\b;
disp(x);
input("Aperte enter para obter a norma do maximo relativa do residuo");
norma = norm((b-(A*x))/b, inf);
disp(["norma igual a ", num2str(norma)]);

%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
input("Aperte enter para prosseguir para a proxima matriz");
clear;
load ("./matrizes/rail_5177.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n,1);
input('Aperte enter para obter o vetor resultante da multiplicacao da matriz dos coeficientes pelo vetor de 1');
clc;
disp("b=");
disp(b);
input("Aperte enter para obter o vetor solucao da matriz dos coeficientes por b obtendo novamente o vetor de 1");
clc;
disp("x=");
x = A\b;
disp(x);
input("Aperte enter para obter a norma do maximo relativa do residuo");
norma = norm((b-(A*x))/b, inf);
disp(["norma igual a ", num2str(norma)]);

%%%%%%%%%%%%%% TERCEIRA MATRIZ %%%%%%%%%%%%%%
input("Aperte enter para prosseguir para a proxima matriz");
clear;
load ("./matrizes/orsirr_1.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n,1);
input('Aperte enter para obter o vetor resultante da multiplicacao da matriz dos coeficientes pelo vetor de 1');
clc;
disp("b=");
disp(b);
input("Aperte enter para obter o vetor solucao da matriz dos coeficientes por b obtendo novamente o vetor de 1");
clc;
disp("x=");
x = A\b;
disp(x);
input("Aperte enter para obter a norma do maximo relativa do residuo");
norma = norm((b-(A*x))/b, inf);
disp(["norma igual a ", num2str(norma)]);

%%%%%%%%%%%%%% CONCLUSAO LETRA B %%%%%%%%%%%%%%
disp("uma conclusao bacana ;)");
input("Pressione enter para finalizar a letra (b) do exercicio 1");
close all;
clc;
clear;

%%%%%%%%%%%%%% LETRA C %%%%%%%%%%%%%%
disp('Lista de sistemas lineares: Exercicio 1 letra (c)');
disp('Para esse exercicio iremos utilizar as mesmas matrizes, calcular a solucao para b igual um vetor de 1 e calcular a norma maxima');
