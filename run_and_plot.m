%Algoritmo que invoca todas as funcoes e plota os graficos

%Invoca a funcao que prepara a matriz A e o vetor b
[A,b]=Ab();

%Invoca as funcoes que resolvem o sistema normal das 3 diferentes formas
[x_a, R_a]=questao_1_a(A,b);
[x_b, R_b]=questao_1_b(A,b);
[x_c, R_c]=questao_1_c(A,b);

%Invoca a funcao que computa o numero de condicao das matrizes A^t*A, R_a,
%R_b e R_c
[cond_AtA,cond_R_a,cond_R_b,cond_R_c] = n_cond(A,R_a,R_b,R_c);

%Criando a tabela com os numeros de condicao e com os coeficientes
T_c = [cond_AtA, cond_R_a, cond_R_b, cond_R_c]

coeficientes_do_metodo_a = x_a;
coeficientes_do_metodo_b = x_b;
coeficientes_do_metodo_c = x_c;
T_x = [coeficientes_do_metodo_a, coeficientes_do_metodo_b, coeficientes_do_metodo_c];

%plotando os graficos dos tres polinomios:

%criando os intervalos do plot
e = linspace(0,1);

%calculando os pontos de cada polinomio
%tomando cuidado pra inverter o vetor x_ e se encaixar 
%corretamente na funcao "polyval"

y_a = polyval(flipud(x_a),e);
y_b = polyval(flipud(x_b),e);
y_c = polyval(flipud(x_c),e);

%calcula a funcao
f = exp(sin(6*e));

%Plota o grafico.
%No grafico, a curva em azul claro representa a funcao original,
%os pontos em verde representam o polinomio gerado com Cholesky
%os pontos em amarelo representam o polinomio gerado por Gram-Schmidt
%os pontos em azul escuro representam o polinomio gerado por Householder

%Nesta escala, parecem sobrepostos, mas com bastante zoom, da para ver que
%nao.
plot(e,y_a,'g*',e,y_b,'y*',e,y_c,'b*',e,f)

%%%%%%%%%%%%%%FIM%%%%%%%%%%%%%%%%%%%%