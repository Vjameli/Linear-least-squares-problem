%Algoritmo que gera a matriz dos coeficientes (A) e o vetor b do sistema 
%linear
function [A,b] = Ab()


%Preparando a matriz A
x = 0:0.05:1;
A = zeros(21,11);
for i = 1:21
    for j = 1:11
        if j == 1
            A(i,j) = 1;
        else
            A(i,j) = x(i)^(j-1);
        end
    end
end

%Preparando o vetor b
b = zeros(21,1);
for i = 1:21
    b(i) = exp(sin(6*x(i)));
end
end
