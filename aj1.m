addpath ('./funcoes')
clc;
clear;

%%%%%%%%%%%%%% Exercicio 1 %%%%%%%%%%%%%%
disp("Lista de ajuste de curvas: Exercicio 1");
disp("Para esse exercicio iremos fazer o ajuste para um conjunto de dados de congelamento de uma substancia.");
V = [2.65 2.65 2.7 2.7 2.75 2.75 2.85 2.85 2.90 2.90 2.95 2.95 3.00 3.00];
T = [6.85 6.80 6.70 6.30 6.33 6.20 5.90 5.82 5.80 5.80 6.15 6.00 6.30 6.15];
%%% Funcao de 1 grau
p1 = polyfit(V,T,1);
%%% Funcao de 2 grau
p2 = polyfit(V,T,2);
%%% Funcao de 3 grau
p3 = polyfit(V,T,3);
%%% Funcao de 4 grau
p4 = polyfit(V,T,4);
%%% Funcao de 5 grau
p5 = polyfit(V,T,5);
%%% Funcao de 6 grau
p6 = polyfit(V,T,6);

%% Medindo variancia e residuo
[r2_p1 var_p1] = qualidade_ajuste(V,T,1, p1);
[r2_p2 var_p2] = qualidade_ajuste(V,T,2, p2);
[r2_p3 var_p3] = qualidade_ajuste(V,T,3, p3);
[r2_p4 var_p4] = qualidade_ajuste(V,T,4, p4);
[r2_p5 var_p5] = qualidade_ajuste(V,T,5, p5);
[r2_p6 var_p6] = qualidade_ajuste(V,T,6, p6);

%% Tabela de residuo e variancia
disp('')
disp('Tabela de residuo e variancia (sigma):')
disp('Grau |   r²   | Sigma');
printf("  %d  | %.4f | %.4f\n", 1, r2_p1, var_p1);
printf("  %d  | %.4f | %.4f\n", 2, r2_p2, var_p2);
printf("  %d  | %.4f | %.4f\n", 3, r2_p3, var_p3);
printf("  %d  | %.4f | %.4f\n", 4, r2_p4, var_p4);
printf("  %d  | %.4f | %.4f\n", 5, r2_p5, var_p5);
printf("  %d  | %.4f | %.4f\n", 6, r2_p6, var_p5);

x = linspace(2.6, 3); % Valores para plotar
disp('Tempo de congelamento pra 2.8 volumes, com o polinomio de grau 2 (melhor ajuste):')
disp(polyval(p2, 2.8));

%% Plot dos dados e do ajuste
figure(1)
plot(V,T,"ro",x,polyval(p2, x),";Polinomio grau 2;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste da curva usando polinomio de grau 2')

disp('Final da questao de ajuste de curvas 1');
disp('Tecle alguma coisa para continuar...'); pause
