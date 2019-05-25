clc;
clear;
addpath ("./funcoes");

%%%%%%%%%%%%% METODOS ITERATIVOS %%%%%%%%%%%%%%
disp("Lista de sistemas lineares: Exercicio 2 metodos iterativos letra (a).");
disp(" ");
disp("Considerar tolerancia igual a 10e-6, numero maximo de iteracoes igual a 10e4, paramentro w entre 0 e 2 e b igual a matriz dos coeficientes vezes vetor de 1.");
disp(" ");

%%%%%%%%%%%%%% LETRA A %%%%%%%%%%%%%% 
disp("Para a letra (a) iremos analizar a convergencia dos metodos de Jacobi, Seidel e SOR utilizando diferentes valores de w para tres matrizes diferentes.");
disp(" ");
disp("Para tal utilizaremos o teorema que diz que o maior módulo dos autovalores de M deve ser menor que 1.");
disp("Sendo que para o metodo de Jacobi M = -(D^-1)*(E+F) e para Seidel M = -((E+D)^-1)*F, e o que muda de Seidel para SOR, eh que para o primeiro w eh sempre igual a 1.");
disp(" ");
input("Pressione enter para analazir a primeira matriz (fs_183_3).");

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
input("Aperte enter para calcular para a proxima matriz (bcsstk01).");

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
input("Aperte enter para calcular para a proxima matriz (plat362).");

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
[MJ,MS,MSOR] = fatora(A,0.5);
pMSOR_0_5 = max(abs(diag(lambda)));
[MJ,MS,MSOR] = fatora(A,1.5);
pMSOR_1_5 = max(abs(diag(lambda)));
disp(["Raio espectral para o metodo de Jacobi = ",num2str(pMJ)]);
disp(["Raio espectral para o metodo de Seidel = ",num2str(pMS)]);
disp(["Raio espectral para o metodo de SOR (w=0.1)= ",num2str(pMSOR_0_1)]);
disp(["Raio espectral para o metodo de SOR (w=0.5)= ",num2str(pMSOR_0_5)]);
disp(["Raio espectral para o metodo de SOR (w=1.5)= ",num2str(pMSOR_1_5)]);
disp(["Raio espectral para o metodo de SOR (w=1.9)= ",num2str(pMSOR_1_9)]);
disp(" ");
disp("Percebe-se que para qualquer um dos metodos iterativos essa matriz nao converge, mesmo para o SOR com valores de w proximos aos limites nao ha diferenca valor do raio espectral");
disp(" ");
input("Aperte enter para concluir a questao.");

%%%%%%%%%%%%%% CONCLUSAO LETRA A %%%%%%%%%%%%%%
clc;
disp("Apos os calculos do raio espectral para cada metodo podemos perceber que a primeira matriz converge para todos os metodos, a segunda converge menos para o metodo de Jacobi.");
disp("Nenhum metodo converge para ultima matriz por mais que variamos o valor de w, logo nao tem como calcular a solucao desse sistema pelo metodo iterativo");
disp(" ");
input("Aperte enter para terminar a questao (a)");

%%%%%%%%%%%%%% LETRA B %%%%%%%%%%%%%%
clc;
disp("Lista de sistemas lineares: Exercicio 2 letra (b).");
disp(" ");
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
disp(" ");
input("Aperte enter para encontrar a solucao pelo metodo de Seidel");
[x1Seidel,iter1Seidel,res1Seidel] = sor(A,b,10e-6,10e4,1);
disp("Seidel:");
disp("solucao = ");
disp(x1Seidel);
disp(" ");
input("Aperte enter para encontrar a solucao pelo metodo SOR (w=1.2)");
[x1SOR,iter1SOR,res1SOR] = sor(A,b,10e-6,10e4,1.2);
disp("SOR:");
disp("solucao = ");
disp(x1SOR);
disp(" ");
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
disp(" ");
input("Aperte enter para encontrar a solucao pelo metodo SOR (w=1.2)");
[x2SOR,iter2SOR,res2SOR] = sor(A,b,10e-6,10e4,1.2);
disp("SOR:");
disp("solucao = ");
disp(x2SOR);
disp(" ");
disp(" ");
input("Aperte para prosseguir para conclusao uma vez que nenhum metodo iterativo converge para a terceira matriz.");

%%%%%%%%%%%%%% CONCLUSAO LETRA B %%%%%%%%%%%%%%
clc;
disp("Apos calcular a solucao para cada metodo iterativo que converge podemos notar que cada metodo chega em uma solucao diferente mas ainda sim dentro da tolerancia desejada.");
disp("Alem disso cada metodo chega mais rapido a solucao do que outros o que indica que para cada sistema havera um metodo iterativo mais otimizado");
disp(" ");
input("Aperte enter para finalizar a letra (b).");

%%%%%%%%%%%%%% LETRA C %%%%%%%%%%%%%%
clc;
disp("para a letra (c) iremos plotar um grafico da norma do maximo relativo do residuo pelo numero de iteracoes para cada metodo que converge para as matrizes.");
disp(" ");
input("Aperte enter para plotar o grafico da primeira matriz.");

%%%%%%%%%%%%%% PRIMEIRA MATRIZ %%%%%%%%%%%%%%
clc;
vetIterJacob = linspace(1, iter1Jacob, iter1Jacob);
vetIterSeidel = linspace(1, iter1Seidel, iter1Seidel);
vetIterSOR = linspace(1, iter1SOR, iter1SOR);
plot(vetIterJacob, res1Jacob,";Jacobi;",vetIterSeidel, res1Seidel,";Seidel;",vetIterSOR, res1SOR,";SOR;");
title("fs_183_3");
disp("Podemos notar que a norma do maximo relativo do residuo aumenta abruptamente e depois decai, seguindo uma certa oscilacao ate tender a zero chegando a solucao.");
disp("Tambem cabe dizer que a norma do maximo relativo do residuo decai mais rapidamente para o metodo SOR, seguido do Seidel e Jacobi o que e de se esperar quando analizamos o valor do raio espectral na letra (a).");
disp(" ");
input("Aperte enter para plotar o grafico da segunda matriz.");

%%%%%%%%%%%%%% SEGUNDA MATRIZ %%%%%%%%%%%%%%
clc;
close;
vetIterSeidel = linspace(1, iter2Seidel, iter2Seidel);
vetIterSOR = linspace(1,iter2SOR, iter2SOR);
plot(vetIterSeidel, res2Seidel,";Seidel;",vetIterSOR, res2SOR,";SOR;");
title("bcsstk01");
disp("No grafico plotado podemos notar que o metodo de Seidel tem uma pequena vantagem sobre o metodo de SOR.");
disp(" ");
input("Aperte enter para apresentar a conclusao.");

%%%%%%%%%%%%%% CONCLUSAO LETRA C %%%%%%%%%%%%%%
close;
clc;
clear;
disp("Analizando os graficos para cada metodo podemos concluir que ao passar das iteracoes o residuo vai diminuindo pois estamos chegando proximo da solucao do sistema.");
disp(" ");
input("Aperte enter para finalizar a questao (c) e iniciar a questao (d).");
clc;

%%%%%%%%%%%%%% LETRA D %%%%%%%%%%%%%%
input("Aperte enter para dispor nossa conclusao a respeito dos metodos diretos e iterativos.");
clc;
disp("Tanto o metodo direto quanto os metodos iterativos possuem vantagens e desvantagens, para matrizes densas e pequenas o metodo direto possue vantagem uma vez que ao utilizarmos esse metodo encontramos o valor exato rapidamente, a menos de erro de ponto flutuante.");
disp("Entretanto a complexidade do metodo direto e da ordem de n³ enquanto que dos metodos iterativos eh da ordem de n², com isso eh mais vantajoso utilizar metodos iterativos para matrizes suficientemente grandes podendo ser esparsas uma vez que armazenamos somente os valores diferentes de zero");
disp(" ");
input("Aperte enter para finalizar a letra (d).")

%%%%%%%%%%%%%% FIM SISTEMAS LINEARES %%%%%%%%%%%%%%
clc;
input("Aperte enter finalizar a parte de sistemas lineares.");
