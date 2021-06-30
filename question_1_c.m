%Algoritmo que computa a fatoracao QR completa com comandos nativos do
%OCTAVE, os quais implementam as transformacoes de Householder no calculo,
%e resolve o sistema de equacoes normais.
%%Como A(21x11), Q tem dimensao (21x21) e R_c(21x11).


function [x_c, R_c] = questao_1_c(A,b)
%Efetuando a fatoracao
[Q,R_c] = qr(A);

%Encerrada a fatoracao, resolveremos o sistema de equacoes normais.
%Com A^t*AX = A^t*b (1), teremos da fatoracao A = Q*R_c (2). 
%Substituindo (2) em (1) e fazendo as devidas manipulacoes (aqui, o Jean
%faz as manipulacoes no trab) chegamos em R_c*x = Q'*b

%Utilizando o comando "barra invertida", o OCTAVE reconhece a estrutura da
%matriz R_c (triang. sup) e se aproveita dela na resolucao do sistema.

x_c = R_c\Q'*b;
end