
aluno(1,joao,m).
aluno(2,antonio,m).
aluno(3,carlos,m).
aluno(4,luisa,f).
aluno(5,maria,f).
aluno(6,isabel,f).

curso(1,lei).
curso(2,miei).
curso(3,lcc).

%disciplina(cod,sigla,ano,curso)
disciplina(1,ed,2,1).
disciplina(2,ia,3,1).
disciplina(3,fp,1,2).

%inscrito(aluno,disciplina)
inscrito(1,1).
inscrito(1,2).
inscrito(5,3).
inscrito(5,5).
inscrito(2,5).

%nota(aluno,disciplina,nota)
nota(1,1,15).
nota(1,2,16).
nota(1,5,20).
nota(2,5,10).
nota(2,2,10).
nota(3,5,8).

%copia
copia(1,2).
copia(2,3).
copia(3,4).

todosInscritos(R):-
	findall(Nr,inscrito(Nr,_),R).

naoInscrito(L):-aluno(N,L,_),
		     not(inscrito(N,_)).

naoinscritos(R):-
	findall(A,naoInscrito(A),R).



existeDisciplina(A):-
	disciplina(A,_,_,_).

elem(X,[X|T]).
elem(X,[H|T]):-elem(X,T).


inscritoValido(Nome):-aluno(N,Nome,_),
		inscrito(N,D),
		existeDisciplina(D).	

inscritosValidos(R):-
	findall(A,inscritoValido(A),R).


conta([],0).
conta([H|T],R):-
	conta(T,A),
	R is 1+A.

soma([],0).
soma([H|T],R):-
	soma(T,A),
	R is 	H+A.


media([],R):-R is 1.
media([H|T],R):-
	soma([H|T],X),
	conta([H|T],Y),
	R is X/Y.

notaValida(N,D,R):-
	nota(N,D,R),
	existeDisciplina(D),
	aluno(N,_,_).

calculaMedia(N,R):-
	findall(Z,notaValida(N,_,Z),Aux),
	media(Aux,R).

calculaMediaTotal(R):-
	findall(Z,notaValida(_,_,Z),Aux),
	media(Aux,R).

validoCopiou(Nome):-
	aluno(N,Nome,_),
	copia(N,_).

copioes(R):-
	findall(N,validoCopiou(N),R).


copiaIndDir(A,X):-
	copia(A,X);
	copia(A,N),
	copiaIndDir(N,X).


%esta mal
num2nomeAux(N,Name):-
	aluno(N,Name,_).
	
num2nome([],[]).
num2nome([N|Ns], [S|Ss]) :-
    num2nomeAux(N, S),
    num2nome(Ns, Ss).