%LICENCIATURA EM ENGENHARIA INFORMÃTICA
%MESTRADO integrado EM ENGENHARIA INFORMÃTICA

%InteligÃªncia Artificial
%2022/23

%Draft Ficha 7


% Parte I
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}

soma( X,Y,Z,Soma ) :-
    Soma is X+Y+Z.

somaL([],Result ):-Result is 0.
somaL([H|T],Result):-
	somaL(T,Aux),
	Result is H + Aux.



somaLh([],Result ):-Result is 0.
somaLh([H|T],Result):-
	Aux is Result + H,
		somaLh(T,Aux).






maior(A,B,N):- N is max(A,B).


maiorL([],Result):-Result is 0.
maiorL([H|T],Result):-
	maiorL(T,Aux),
	Result is max(H,Aux).


mediaL([],Result):-Result is 1.
mediaL([H|T],Result):-
	somaL([H|T],Aux1),
	countL([H|T],Aux2),
	Result is Aux1/Aux2.


countL([],Result):-Result is 0.
countL([H|T],Result):-
	countL(T,Aux1),
		Result is 1+Aux1.


par(N):- N mod 2 =:= 0.
impar(N):- N mod 2=\= 1.




pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).


comprimentoL([],C):-C is 0.
comprimentoL([H|T],C):-
	comprimentoL(T,A),
	 C is A+1.



diferentesL([],R):-R is 0.
diferentesL([H|T],R):-
	pertence(H,T)-> diferentesL(T,R); diferentesL(T,Aux) , R is Aux +1.

apaga1(_X,[],[]) .
apaga1(X,[X|Y],Y).
apaga1(X,[T|Xs],Y):-
	apaga1(X,Xs,Y1),
	append([T],Y1,Y).	



apagaT(_X,[],[]) .
apagaT(X,[X|Y],R):- apagaT(X,Y,R). 
apagaT(X,[T|Xs],Y):-
	apaga1(X,Xs,Y1),
	append([T],Y1,Y).	


adicionar(X,[],[X]).
adicionar(X,[X|T],[X|T]).
adicionar(X,[H|T],Y):-
	adicionar(X,T,Y1),
		append([H],Y1,Y).

          
concatenar(X,[],X).
concatenar([],X,X).
concatenar(A,[H|T],R):-
	append(A,[H|T],R).

reverse([],[]).
reverse([X],[X]).
reverse([H|T],R):-
	reverse(T,R1),
		append(R1,[H],R).


%NAO TA BEM
subList([],[], True).
subList([H|T],[H|T2],R):-subList(T,T2,R).
subList([H|T],[H2|T2],R):-subList([H|T],T2,R).
	
