clc;
clear;

%%%%%%%%%%%%%% METODOS DIRETOS %%%%%%%%%%%%%%
%%%%%%%%%%%%%% LETRA A %%%%%%%%%%%%%% 
disp("Lista de sistemas lineares: Exercicio 1 metodos diretos letra (a)");
disp(" ");
disp("Para esse exercicio iremos carregar 3 matrizes diferentes e analizar a esparsidade de cada uma e suas respectivas decomposicoes");
disp(" ");
input ("Pressione enter para plotar as matrizes dos coeficientes A");

%%%%%%%%%%%%%% MATRIZ DOS COEFICIENTES %%%%%%%%%%%%%%
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
disp("Como podemos perceber todas as tres matrizes dos coeficientes tem disposicoes diferentes.");
disp(" ");
input("Pressione enter para plotar as matriz de decomposicao inferior L.");

%%%%%%%%%%%%%%  MATRIZ L %%%%%%%%%%%%%%
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
disp("Como podemos perceber todas as tres matrizes sao triangulares inferiores.");
disp(" ");
input("Pressione enter para plotar as matriz de decomposicao superior U.");

%%%%%%%%%%%%%% MATRIZ U %%%%%%%%%%%%%%
clf;
figure(1);
spy(UA);
figure(2);
spy(UB);
figure(3);
spy(UC);
disp(" ");
disp("Como podemos perceber todas as tres matrizes sao triangulares superiores.");

%%%%%%%%%%%%%% CONCLUSAO LETRA A %%%%%%%%%%%%%%
disp(" ");
disp("Pode-se concluir que independente da disposicao dos valores das matrizes dos coeficientes as matrizes de decomposicao L e U sempre serao triangulares inferiores e triangulares superiores, respectivamente.");
disp(" ");
input("Pressione enter para finalizar a letra (a) do exercicio 1.");
close all;
clc;
clear;

%%%%%%%%%%%%%% LETRA B %%%%%%%%%%%%%%
disp("Lista de sistemas lineares: Exercicio 1 letra (b).");
disp(" ");
disp("Para esse exercicio iremos utilizar as mesmas matrizes para calcular a solucao de b igual a vetor de 1 vezes a matriz dos coeficientes e calcular a norma maxima.");

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
load ("./matrizes/plat362.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n,1);
input("Aperte enter para obter o vetor resultante da multiplicacao da matriz dos coeficientes pelo vetor de 1.");
clc;
disp("b=");
disp(b);
input("Aperte enter para obter o vetor solucao da matriz dos coeficientes por b obtendo novamente o vetor de 1.");
clc;
disp("x=");
x = A\b;
disp(x);
input("Aperte enter para obter a norma do maximo relativa do residuo.");
disp(" ");
norma = norm((b-(A*x))/b, inf);
disp(["norma igual a ", num2str(norma)]);
disp(" ");
input("Aperte enter para prosseguir para a proxima matriz.");

%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
clear;
load ("./matrizes/rail_5177.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n,1);
input("Aperte enter para obter o vetor resultante da multiplicacao da matriz dos coeficientes pelo vetor de 1.");
clc;
disp("b=");
disp(b);
input("Aperte enter para obter o vetor solucao da matriz dos coeficientes por b obtendo novamente o vetor de 1.");
clc;
disp("x=");
x = A\b;
disp(x);
input("Aperte enter para obter a norma do maximo relativa do residuo.");
disp(" ");
norma = norm((b-(A*x))/b, inf);
disp(["norma igual a ", num2str(norma)]);
disp(" ");
input("Aperte enter para prosseguir para a proxima matriz.");

%%%%%%%%%%%%%% TERCEIRA MATRIZ %%%%%%%%%%%%%%
clear;
load ("./matrizes/orsirr_1.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n,1);
input("Aperte enter para obter o vetor resultante da multiplicacao da matriz dos coeficientes pelo vetor de 1.");
clc;
disp("b=");
disp(b);
input("Aperte enter para obter o vetor solucao da matriz dos coeficientes por b obtendo novamente o vetor de 1.");
clc;
disp("x=");
x = A\b;
disp(x);
input("Aperte enter para obter a norma do maximo relativa do residuo.");
disp(" ");
norma = norm((b-(A*x))/b, inf);
disp(["norma igual a ", num2str(norma)]);

%%%%%%%%%%%%%% CONCLUSAO LETRA B %%%%%%%%%%%%%%
disp(" ");
disp("O valor da norma obtido para cada uma das tres matrizes eh conveniente uma vez que é muito pequeno o que bate com a intuicao visto que x é a solucao para Ax = b. Desse modo a diferenca obtida eh devido a erro de ponto flutuante.");
disp(" ");
input("Pressione enter para finalizar a letra (b) do exercicio 1.");
close all;
clc;
clear;

%%%%%%%%%%%%%% LETRA C %%%%%%%%%%%%%%
disp("Lista de sistemas lineares: Exercicio 1 letra (c).");
disp(" ");
disp("Para esse exercicio iremos utilizar as mesmas matrizes para calcular o condicionamento e comentar sobre os valores obtidos.");
input("Aperte enter para obter o condicionamento da primeira matriz.");
disp(" ");

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
load ("./matrizes/plat362.mat");
A = Problem.A;
condi = cond(A);
esparsidade = nnz(A);
disp(["cond = ", num2str(condi), " esparsidade ", num2str(esparsidade)]);
disp(" ");
input("Aperte enter para prosseguir para a proxima matriz.");
disp(" ");

%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
clear;
load ("./matrizes/rail_5177.mat");
A = Problem.A;
condi = cond(A);
esparsidade = nnz(A);
disp(["cond = ", num2str(condi), " esparsidade ", num2str(esparsidade)]);
disp(" ");
input("Aperte enter para prosseguir para a proxima matriz.");
disp(" ");

%%%%%%%%%%%%%% TERCEIRA MATRIZ %%%%%%%%%%%%%%
clear;
load ("./matrizes/orsirr_1.mat");
A = Problem.A;
condi = cond(A);
esparsidade = nnz(A);
disp(["cond = ", num2str(condi), " esparsidade ", num2str(esparsidade)]);

%%%%%%%%%%%%%% CONCLUSAO LETRA B %%%%%%%%%%%%%%
disp(" ");
disp("Pode-se observar que o valor de condicionamento para primeira e terceira matriz foram obtidos rapidamente enquanto que para segunda matriz o resultado demorou mais, o que pode ser atribuido a esparsidade da mesma.");
disp("Em relacao ao valor a primeira matriz tem um valor bem mais do que a segunda e a terceira matriz.");
disp("Essa diferenca indica que a segunda matriz esta melhor condicionada do que a terceira e a primeira matriz esta claramente mal condionada");
input("Aperte enter para encerrar a questao 1 da lista de sistemas lineares.");
clc;
clear;

