clc;
clear;
addpath ("./funcoes");

%%%%%%%%%%%%%% METODOS ITERATIVOS %%%%%%%%%%%%%%
disp("Lista de sistemas lineares: Exercicio 2 metodos iterativos letra (a).");
disp(" ");
disp("Considerar tolerancia igual a 10e-6, numero maximo de iteracoes igual a 10e4, paramentro w entre 0 e 2 e b igual a matriz dos coeficientes vezes vetor de 1.");
disp(" ");

%%%%%%%%%%%%%% LETRA A %%%%%%%%%%%%%% 
disp("Para a letra (a) iremos analizar a convergencia dos metodos de Jacobi, Seidel e SOR utilizando diferentes valores de w para tres matrizes diferentes.");
disp("Para tal utilizaremos o teorema que diz que o maior módulo dos autovalores de M deve ser menor que 1.");
disp("Sendo que para o metodo de Jacobi M = -(D^-1)*(E+F) e para Seidel M = -((E+D)^-1)*F, sendo que o que muda de Seidel para SOR e a presenca de uma constante.");
disp(" ");
input("Pressione enter para analazir a primeira matriz.");

%%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
clc;
load ("./matrizes/fs_183_3.mat");
A = Problem.A;
[MJ,MS,MSOR] = fatora(A,1.2);
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
disp("Percebe-se que tanto o metodo de Jacobi quanto de Seidel e SOR convergem sendo w igual a 1.2 (valor escolhido apos diversos testes de convergencia) pois todos raios espectrais sao inferiores a 1.");
disp(" ");
input("Aperte enter para calcular para a proxima matriz.");

%%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
load ("./matrizes/bcsstk01.mat");
A = Problem.A;
[MJ,MS,MSOR] = fatora(A,1.9);
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
disp("Percebe-se que para o metodo de Jacobi o sistema nao converge, ja para Seidel e SOR convergem, sendo w igual a 1.9 (valor escolhido apos diversos testes de convergencia).");
disp(" ");
input("Aperte enter para calcular para a proxima matriz.");

%%%%%%%%%%%%%% TERCEIRA MATRIZ %%%%%%%%%%%%%%
load ("./matrizes/plat362.mat");    
A = Problem.A;
[MJ,MS,MSOR] = fatora(A,0.1);
[V, lambda] = eig(MJ);
pMJ = max(abs(diag(lambda)));
[V, lambda] = eig(MS);
pMS = max(abs(diag(lambda)));
[V, lambda] = eig(MSOR);
pMSOR_0_1 = max(abs(diag(lambda)));
[MJ,MS,MSOR] = fatora(A,1.9);
pMSOR_1_9 = max(abs(diag(lambda)));
disp(["Raio espectral para o metodo de Jacobi = ",num2str(pMJ)]);
disp(["Raio espectral para o metodo de Seidel = ",num2str(pMS)]);
disp(["Raio espectral para o metodo de SOR (w=1.9)= ",num2str(pMSOR_1_9)]);
disp(["Raio espectral para o metodo de SOR (w=0.1)= ",num2str(pMSOR_0_1)]);
disp(" ");
disp("Percebe-se que para qualquer um dos metodos iterativos essa matriz nao converge, mesmo para o SOR com valores de w proximos aos limites nao ha diferenca valor do raio espectral");
disp(" ");
input("Aperte enter para concluir a questao.");

%%%%%%%%%%%%%% CONCLUSAO LETRA A %%%%%%%%%%%%%%
clc;
disp("Apos calcular o raio espectral de cada metodo com o valor escolhido de w apos testes obtemos que o metodo de Jacobi converge somente para a primeira matriz enquanto que o metodo de Seidel e SOR para as duas primeiras matrizes.");
disp("Nenhum metodo converge para ultima matriz, logo nao tem como calcular a solucao pelo metodo iterativo");
disp(" ");
input("Aperte enter para terminar a questao (a)");

%%%%%%%%%%%%%% LETRA B %%%%%%%%%%%%%%
clc;
disp("Lista de sistemas lineares: Exercicio 2 letra (b).");
disp("Para esse exercicio iremos calcular a solucao dos sistemas pelos metodos iterativos sabendo que a tolerencia aceitavel eh igual a 10e-6 e o maximo de iteracao igual a 10e4.");
disp(" ");
input("Pressione enter para analazir a primeira matriz.");

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
clc;
load ("./matrizes/fs_183_3.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n, 1);
[x1Jacob,iter1Jacob,res1Jacob] = jacobi(A,b,10e-6,10e4);
disp("Jacobi:");
disp("solucao = ");
disp(x1Jacob);
disp(["nmr de iteracoes = ",num2str(iter1Jacob)]);
input("Aperte enter para encontrar solucao pelo metodo de Seidel");
[x1Seidel,iter1Seidel,res1Seidel] = sor(A,b,10e-6,10e4,1);
disp("Seidel:");
disp("solucao = ");
disp(x1Seidel);
disp(["Seidel nmr de iteracoes = ",num2str(iter1Seidel)]);
input("Aperte enter para encontrar solucao pelo metodo SOR (w=1.2)");
[x1SOR,iter1SOR,res1SOR] = sor(A,b,10e-6,10e4,1.2);
disp("SOR:");
disp("solucao = ");
disp(x1SOR);
disp(["SOR nmr de iteracoes = ",num2str(iter1SOR)]);
disp(" ");
disp("Comparando o numero de iteracoes de cada iteracao percebe-se que o metodo SOR converge mais rapidamente");
disp(" ");
input("Aperte enter para calcular para a proxima matriz.");

%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
clc;
disp("Para essa matriz nao iremos resolver o sistema com o metodo Jacobi uma vez que esse metodo nao converge");
disp(" ");
load ("./matrizes/bcsstk01.mat");
A = Problem.A;
n = rows(A);
b = A*ones(n, 1);
[x2Seidel,iter2Seidel,res2Seidel] = sor(A,b,10e-6,10e4,1);
disp("Seidel:");
disp("solucao = ");
disp(x2Seidel);
disp(["Seidel nmr de iteracoes = ",num2str(iter2Seidel)]);
input("Aperte enter para encontrar solucao pelo metodo SOR (w=1.2)");
[x2SOR,iter2SOR,res2SOR] = sor(A,b,10e-6,10e4,1.2);
disp("SOR:");
disp("solucao = ");
disp(x2SOR);
disp(["SOR nmr de iteracoes = ",num2str(iter2SOR)]);
disp(" ");
disp("Comparando o numero de iteracoes de cada iteracao percebe-se que o metodo Seidel converge mais rapidamente mesmo que o raio espectral do metodo SOR tenho sido menor que o de Seidel.");
disp(" ");
input("Aperte para prosseguir para conclusao uma vez que nenhum metodo iterativo converge para a terceira matriz.");

%%%%%%%%%%%%%% CONCLUSAO %%%%%%%%%%%%%%
clc;
disp("whatever");
disp(" ");
input("Aperte enter para finalizar a letra (b) e iniciar a letra (c).")

%%%%%%%%%%%%%% LETRA C %%%%%%%%%%%%%%
clc;
disp("para a letra (c) iremos plotar um grafico da norma do maximo relatico do residuo pelo numero de iteracoes para cada metodo que converge para as matrizes.");
input("Aperte enter para plotar o grafico da primeira matriz.");

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
clc;
disp("127-jacobi/83-Seidel/61-SOR");
plot(res1Jacob, iter1Jacob);
hold on;
plot(res1Seidel, iter1Seidel);
hold on;
plot(res1SOR, iter1SOR);
disp("Falar algo a respeito");
input("Aperte enter para plotar o grafico da segunda matriz.");

%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
clc;
close;
disp("178-Seidel");
plot(res2Seidel, iter2Seidel);
%hold on;
%plot(res2SOR, iter2SOR);
disp("Falar algo a respeito");
input("Aperte enter para apresentar a connclusao.");

%%%%%%%%%%%%%% CONCLUSAO LETRA C %%%%%%%%%%%%%%
close;
clc;
clear;
disp("conclusao bacana");
input("Aperte enter para finalizar a questao (c) e iniciar a questao (d)");

%%%%%%%%%%%%%% LETRA D %%%%%%%%%%%%%%
input("Aperte enter para dispor nossa conclusao a respeito dos metodos diretos e iterativos.");
disp("");
