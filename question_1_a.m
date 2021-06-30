%Algoritmo que computa a fatoracao de Cholesky e resolve o sistema de
%equacoes normais. Como A (mxn) = (21x11), o fator de Cholesky R_a triang.
%sup. tem dimensao (nxn) = (11x11)
function [x_a, R_a] = questao_1_a(A,b)
%Aplicando a fatoracao de Cholesky no sistema normal, temos:
%A^t*A*x = A^t*b ; A^t*A = R_a^t*R_a --> R_a^t*R_a*x = A^t*b

%Calcula o fator de Cholesky de A^t*A
R_a = chol(A'*A);

%Reescrevendo, tenho R_a^t*R_a*x = A^t*b
%Faco y = R_a*x
%Resolvo  |R_a^t*y = A^t*b
%         |R_a*x = y

%Utilizando o comando "barra invertida", o OCTAVE reconhece a estrutura da
%matriz R_a e R_a^t (triang. sup. e inf. respecticamente) e se aproveita dela
%na resolucao do sistema.

y = R_a'\A'*b;
x_a = R_a \ y;
end