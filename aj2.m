addpath ('./funcoes')
clc;
clear;

%%%%%%%%%%%%%% Exercicio 2 %%%%%%%%%%%%%% 
disp("Lista de ajuste de curvas: Exercicio 2");

S = [1.3 1.8 3 4.5 6 8 9]
v = [0.07 0.13 0.22 0.275 0.335 0.35 0.36]

%%%%%%%%%%%%%%   Letra A   %%%%%%%%%%%%%% 

% Para o caso 1:

% v = vm * S / ks + S
% 1/v = ks + S / vm * S
% 1/v = ks/(vm*S) + 1/vm
% Seja y = 1/v, x = 1/S, ks/vm = b e 1/vm = a
% y = a + b*x

y = rdivide(1.0, v);
x = rdivide(1.0, S);
p = polyfit(x,y, 1);

disp('Para o caso 1:')
vm = 1.0 / p(2)
ks = vm * p(1)
S_plot = linspace(1.3, 9);
%v_predito = (vm * S_plot) / (ks + S_plot)
t = vm * S_plot;
d = ks + S_plot;
v_predito = rdivide(t,d);
figure(1);
plot(S,v,"ro",S_plot,v_predito,";Ajuste;")
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

disp('Para o caso 2:')
vm2 = 1.0 / p2(2)
ks2 = sqrt(vm2 * p2(1))
t2 = vm2 * (times(S_plot, S_plot));
d2 = times(ks2, ks2) + (times(S_plot, S_plot));
v_predito2 = rdivide(t2,d2);
figure(2);
plot(S,v,"ro",S_plot,v_predito2,";Ajuste 2;");
printf('Taxa de crescimento em S = 7: %.4f\n', rdivide(vm * 7 * 7, times(ks, ks) + 7 * 7));

