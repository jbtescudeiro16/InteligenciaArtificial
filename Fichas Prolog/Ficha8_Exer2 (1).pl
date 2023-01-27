%LICENCIATURA EM ENGENHARIA INFORMATICA
%MESTRADO integrado EM ENGENHARIA INFORMATICA

%Inteligencia Artificial
%2022/23

%Draft Ficha 8


%biblioteca(id, nome, localidade)

biblioteca(1, uminhogeral, braga).
biblioteca(2, luciocracveiro, braga).
biblioteca(3, municipal, porto).
biblioteca(4, publica, viana).
biblioteca(5, ajuda, lisboa).
biblioteca(6, cidade, coimbra).


%livros( id, nome, biblioteca)

livros(1, gameofthrones, 1). 
livros(2, codigodavinci, 2).
livros(3, setimoselo, 1).
livros(4, fireblood, 4).
livros(5, harrypotter, 6).
livros(6, senhoradosneis, 7).
livros(7, oalgoritmomestre, 9).

%leitores(id, nome, genero)

leitores(1, pedro, m).
leitores(2, joao, m).
leitores(3, lucia, f).
leitores(4, sofia, f).
leitores(5, patricia, f).
leitores(6, diana, f).

%requisicoes(id_requisicao,id_leitor, id_livro, data(A,M,D)

requisicoes(1,2,3,data(2022,5,17)).
requisicoes(2,1,2,data(2022,7,10)).
requisicoes(3,1,3,data(2021,11,2)).
requisicoes(4,1,4,data(2022,2,1)).
requisicoes(5,5,3,data(2022,4,23)).
requisicoes(6,4,2,data(2021,3,9)).
requisicoes(7,4,1,data(2022,5,5)).
requisicoes(8,2,6,data(2021,7,18)).
requisicoes(9,5,7,data(2022,4,12)).


%devolucoes(id_requisicao, data(A,M, D))


devolucoes(2, data(2022, 7,26)).
devolucoes(4, data(2022,2,4)).
devolucoes(5, data(2022, 6, 13)).
devolucoes(1, data(2022, 5, 23)).
devolucoes(6, data(2022, 4, 9)).


leitorFeminino(Nome):- 
	leitores(_,Nome,f).



leitoresFemininos(R):-
	findall(N,leitorFeminino(N),R).

livroBiblio(Id,Nome):-
	requisicoes(_,_,Id,_),
	livros(Id,Nome,B),
	 not(biblioteca(B,_,_)).

	
livrosSBiblio(R):-
	findall(N,livroBiblio(A,N),R).


livroBiblioPlace(Id,Nome):-
	requisicoes(_,_,Id,_),
	livros(Id,Nome,B),
	 (biblioteca(B,_,braga)).

livrosBraga(R):-
	findall(N,livroBiblioPlace(A,N),R).

livroEscolhido(N):-
	livros(Id,N,B),
	not(requisicoes(_,_,Id,_)).

notchosenBooks(R):-
	findall(A,livroEscolhido(A),R).


apos2022(data(2022,_,_)).


pedido(N,D):-
	requisicoes(_,_,Id,D),
	apos2022(D),
				livros(Id,N,_).

pedidoAux(R):-
	findall([A,D],pedido(A,D),R).


isverao(data(_,L,_)):- 
L>=7,
L=<9.


leitoresVerao(N):-
	requisicoes(_,ID,_,D),
	isverao(D),
	leitores(ID,N,_).

verao(R):-
	findall(A,leitoresVerao(A),R).
	



%esta mal este ultimo
valido(date(A1,M1,D1),date(A2,M2,D2)):-
	D2 <= D1+15.

entregaValida(N):-
	requisicoes(ID,_,A,D1),
	devolucoes(ID,D2),
	valido(D1,D2),
	leitores(A,N,_).

entregasValidas(N):-
	findall(A,entregaValida(A),R).



inBraga(Liv,Leit):-
	leitores(Id,Leit,_),
	requisicoes(_,Liv,Id,_),
	livros(Liv,_,Bib),
	biblioteca(Bib,_,Braga).

isBraga():-
findall([Liv,Leit],inBraga(Liv,Leit),R).
	

