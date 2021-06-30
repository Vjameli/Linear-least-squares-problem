%Calcula o numero de condicao das matrizes A^t*A, R_a, R_b e R_c.
%O uso da funcao nativa cond e justificada pois o Octave utiliza da SVD
%para computar o numero de condicao K2. Que se da pelo maior valor singular
%dividido pelo menor.
function [cond_AtA,cond_R_a,cond_R_b,cond_R_c] = n_cond(A,R_a,R_b,R_c)
    cond_AtA = cond(A'*A);
    cond_R_a = cond(R_a);
    cond_R_b = cond(R_b);
    cond_R_c = cond(R_c);
end