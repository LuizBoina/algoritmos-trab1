clc;
clear;
addpath ("./funcoes");
%%%%%%%%%%%%%% METODOS ITERATIVOS %%%%%%%%%%%%%%
disp("Lista de sistemas lineares: Exercicio 2 metodos iterativos letra (a)");
disp(" ");
disp("Considerar tolerancia igual a 10e-6, numero maximo de iteracoes igual a 10e4, paramentro w igual a 0.5 e b igual a matriz dos coeficientes vezes vetor de 1");
disp(" ");

%%%%%%%%%%%%%% LETRA A %%%%%%%%%%%%%% 
disp("Para a letra (a) iremos analizar a convergencia dos metodos de Jacobi, Seidel e SOR utilizando diferentes valores de w para tres matrizes diferentes");
disp("Para tal utilizaremos o teorema que diz que o maior módulo dos autovalores de M deve ser menor que 1");
disp("Sendo que para o metodo de Jacobi M = -(D^-1)*(E+F) e para Seidel M = -((E+D)^-1)*F, sendo que o que muda de Seidel para SOR e a presenca de uma constante");
disp(" ");
input("Pressione enter para analazir a primeira matriz");

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
clc;
load ("./matrizes/plat362.mat");
A = Problem.A;
[MJ,MS,MSOR] = fatora(A,1.7);
[V, lambda] = eig(MJ);
pMJ = max(abs(diag(lambda)));
[V, lambda] = eig(MS);
pMS = max(abs(diag(lambda)));
[V, lambda] = eig(MSOR);
pMSOR = max(abs(diag(lambda)));
disp(["Raio espectral para o metodo de Jacobi = ",num2str(pMJ)]);
disp(["Raio espectral para o metodo de Seidel = ",num2str(pMS)]);
disp(["Raio espectral para o metodo de SOR = ",num2str(pMSOR)]);
disp(" ");
input("Aperte enter para finalizar");
%load ("./matrizes/plat362.mat");
%A = Problem.A;
%n = rows(A);
%b = A*ones(n,1);
%[x, iter, res] = jacobi(A, b, 10e-6, 10e4);
%disp(["Para o metodo de Jacobi, x igual a", num2str(x)," parando na ", num2str(iter), " iteracao e norma relativa do maximo do residuo igual a ", num2str(res)]);
