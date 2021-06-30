%Algoritmo que computa a fatoracao QR condensada pelo processo de
%Gram-Schmidt e resolve o sistema de equacoes normais. A = Q1*R_b, onde 
%Q1(mxn) e R_b(nxn) traing. sup.
%Como A(21x11), Q1 tem dimensao (21x11) e R_b(11x11)(fator de Cholesky)
%triang. sup.

%Com o objetivo de nao fazer alteracoes na matriz A, neste codigo, vamos
%criar uma matriz auxiliar V=A, pagando o preco pelo espaco ocupado na
%memoria (como no algoritmo feito em aula).

function [x_b, R_b] = questao_1_b(A,b)
%Indexando o numero de colunas da matriz A
[m,n]=size(A);

%Criando as matrizes R_b e Q1 com zeros, para que o OCTAVE nao tenha que
%alterar a dimensao das matrizes a cada iteracao; aumentando o custo
%computacional.

R_b = zeros(n,n);
Q1 = zeros(m,n);

%Criando a matriz auxiliar
V = A;

%Comecando a fatoracao
for j = 1:n
    for i = 1:j-1
        R_b(i,j) = Q1(:,i)'*V(:,j);
        V(:,j) = V(:,j) - R_b(i,j)*Q1(:,i);
    end
    R_b(j,j) = norm(V(:,j));
    if R_b(j,j) == 0
        disp('Conjunto LD')
        break
    else
        Q1(:,j) = V(:,j)/R_b(j,j);
    end
end

%Encerrada a fatoracao, resoveremos o sistema de equacoes normais.
%Com A^t*A*x = A^t*b (1), teremos da fatoracao A = Q1*R_b (2). 
%Substituindo (2) em (1) e fazendo as devidas manipulacoes (aqui, o Jean
%faz as manipulacoes no trab) chegamos em R_b*x = Q1'*b

%Utilizando o comando "barra invertida", o OCTAVE reconhece a estrutura da
%matriz R_b (triang. sup0 e se aproveita dela na resolucao do sistema.


x_b = R_b\Q1'*b;
end