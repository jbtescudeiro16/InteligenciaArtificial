
filho(joao,jose).
filho(jose,manuel).
filho(carlos,jose).
pai(P,F) :- filho(F,P).
pai(joao,luis).
pai(filipe,joao).
pai(paulo,filipe).
pai(maria,paulo).
avo(A,B):-neto(B,A).
avo(A,N):-filho(N,X),pai(A,X).
avo(antonio,nadia).
neto(nuno,ana).
sexo(joao,masc).
sexo(jose,masc).
sexo(maria,fem).
sexo(joana,fem).
descendente(A,P):-filho(A,P);avo(P,A);pai(P,A);neto(A,P).
% regras (nao sei se esta bem)
grau_parentesco(X, Y, 1) :- pai(X, Y).
grau_parentesco(X, Y, 2) :- avo(X, Y).
grau_parentesco(X, Y, N) :- pai(X, Z), grau_parentesco(Z, Y, M), N is M + 1.


%experimentar com bisavo(maria,joao)
bisavo(X,Y):- grau_parentesco(X,Y,3).

trisavo(X,Y):- grau_parentesco(X,Y,4).

tetraneto(X,Y):-grau_parentesco(X,Y,5).
