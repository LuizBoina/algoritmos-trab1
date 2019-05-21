addpath ('./funcoes')
clc;
clear;
disp('')
disp('********** Ajuste de curvas - Exercicio 2 **********')
disp('Nesse exercicio, faremos o ajuste de uma curva que descreve o crescimento de uma bacteria v em funcao da concentracao de oxigenio, utilizando o modelo de Michaelis-Menten.')
disp('')
%%%%%%%%%%%%%% Exercicio 2 %%%%%%%%%%%%%% 

S = [1.3 1.8 3 4.5 6 8 9]
v = [0.07 0.13 0.22 0.275 0.335 0.35 0.36]

%%%%%%%%%%%%%%   Letra A   %%%%%%%%%%%%%% 
disp('')
disp(' --------  Letra A')

% Para o caso 1:

% v = vm * S / ks + S
% 1/v = ks + S / vm * S
% 1/v = ks/(vm*S) + 1/vm
% Seja y = 1/v, x = 1/S, ks/vm = b e 1/vm = a
% y = a + b*x

x = rdivide(1.0, S);
y = rdivide(1.0, v);
p = polyfit(x,y, 1);

disp('Para o caso 1:')
vm = 1.0 / p(2)
ks = vm * p(1)
printf('Taxa de crescimento em S = 7: %.4f\n', rdivide(vm * 7, ks + 7));
disp('')
% Para o caso 2:

% v = vm * S² / (ks² + S²)
% 1/v = (ks² + S²) / vm * S²
% 1/v = ks²/(vm*S²) + 1/vm
% Seja y = 1/v, x = 1/S², ks²/vm = b e 1/vm = a -> ks = sqrt(bvm)
% y = a + b*x

y2 = rdivide(1.0, v);
x2 = rdivide(1.0, times(S, S));
p2 = polyfit(x2,y2, 1);
disp('')
disp('Para o caso 2:')
vm2 = 1.0 / p2(2)
ks2 = sqrt(vm2 * p2(1))
printf('Taxa de crescimento em S = 7: %.4f\n', rdivide(vm2 * 7 * 7, times(ks2, ks2) + 7 * 7));

input('Fim da letra A. Tecle alguma coisa para continuar...');
clc

%%%%%%%%%%%%%%   Letra B   %%%%%%%%%%%%%% 
disp('')
disp(' --------  Letra B')

disp('Caso 1:')
disp('Original:')
r2 = coef_determinacao(rdivide(1.0, v), polyval(p, 1./S))
disp('Linearizado:')
n = vm * S;
d = ks + S;
v_fit = rdivide(n,d);
r2 = coef_determinacao(v, v_fit)

disp('Caso 2:')
disp('Linearizado:')
r2 = coef_determinacao(rdivide(1.0, v), polyval(p2, 1./(times(S,S))))
disp('Original:')
n2 = vm2 * (times(S, S));
d2 = times(ks2, ks2) + (times(S, S));
v_fit2 = rdivide(n2,d2);
r2 = coef_determinacao(v, v_fit2)

input('Fim da letra B. Tecle alguma coisa para continuar...');
clc

%%%%%%%%%%%%%%   Letra C   %%%%%%%%%%%%%% 
disp('')
disp(' --------  Letra C')
disp('Gráficos plotados nas figuras 1,2,3 e 4.')
% X dos plots originais
S_plot = linspace(1.3, 9);

% Caso 1 - Linearizado
inv_S_plot = linspace(1./9, 1/1.3);
inv_v_plot = rdivide(1, v);
figure(1);
plot(rdivide(1.0, S),rdivide(1.0, v),"ro",inv_S_plot,polyval(p, inv_S_plot),";Ajuste linearizado - caso 1;");

% Caso 1 - Original
t = vm * S_plot;
d = ks + S_plot;
v_predito = rdivide(t,d);
figure(2);
plot(S,v,"ro",S_plot,v_predito,";Ajuste original - caso 1;");

% Caso 2 - Linearizado
figure(3);
plot(rdivide(1.0, times(S,S)),rdivide(1.0, v),"ro",rdivide(1.0, times(S,S)),polyval(p2, rdivide(1.0, times(S,S))),";Ajuste linearizado - caso 2;");

% Caso 1 - Original
t2 = vm2 * (times(S_plot, S_plot));
d2 = times(ks2, ks2) + (times(S_plot, S_plot));
v_predito2 = rdivide(t2,d2);
figure(4);
plot(S,v,"ro",S_plot,v_predito2,";Ajuste original - caso 2;");

input('Fim da letra C. Tecle alguma coisa para continuar...');
clc

%%%%%%%%%%%%%%   Letra D   %%%%%%%%%%%%%% 
disp('')
disp(' --------  Letra D')
disp('O melhor ajuste foi o do caso 2. O valor de r² foi mais próximo de 1, o que indica um ajuste mais fiel. Além disso, o valor para S=7 foi mais condizente com o padrão apresentado. Finalmente, visualmente, os gráficos apresentados possuem um ajuste melhor.');

disp('Fim do exercicio 2 de ajuste de curvas.');

clc
clear