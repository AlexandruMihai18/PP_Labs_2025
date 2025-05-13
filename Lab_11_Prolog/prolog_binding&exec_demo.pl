% LEGARE SI EXECUTIE

% PUTEREA GENERATIVA A LIMBAJULUI

% lungime(+Lista, -Lungime)

lungime([], 0).
lungime([_ | R], N) :- lungime(R, N1), N is N1 + 1.

% lungime([1, 2, 3], N).

% membru(?Elem, +Lista)
membru(Elem, [Elem | _]).
membru(Elem, [_ | Rest]) :- membru(Elem, Rest).

% membru(3, [1, 2, 3, 4, 5]).
% membru(N, [1, 2, 3]).

% remove(+Elem, +Lista, -ListaNoua)
remove(Elem, [Elem | Rest], Rest).
remove(Elem, [Head | Rest], [Head | Left]) :- remove(Elem, Rest, Left).

% remove(3, L, [1, 1, 1]).

% perm(+Lista, -Permutare)
perm([], []).
perm([Head | Rest], Perm) :- perm(Rest, P1), remove(Head, Perm, P1).

% perm([1, 2, 3], Perm).


% CONTROLUL EXECUTIEI

% Predicatul false

my_reverse(List, Acc, _) :- format('List:~w, Acc:~w~n', [List, Acc]), false. % se opreste la primul false
my_reverse([], Sol, Sol).
my_reverse([Head | Tail], Acc, Sol):-my_reverse(Tail, [Head | Acc], Sol).

% my_reverse([1,2,3,4],[],Rev).

% Predicatul cut (!)

% Elimina toate punctele de bifurcatie - in momentul in care exista o legare pentru ca se satisfac
% clauzele din stanga ! nu se vor mai genera solutii pentru p. stanga si se incearca legarea in p.
% dreapta (vezi exemplu)

p(a).
p(b).
p(A/B) :- q(A), !, t(A/B).
p(d).

q(a).
q(b).
q(c).

t(a/a).
t(a/b).
t(b/c).
t(b/d).

% p(X).

% Implementare min

min1(X, Y, Min) :- X < Y, X = Min. % regula 1
min1(X, Y, Min) :- X >= Y, Y = Min. % regula 2

% Green cut - cut poate lipsi, dar limiteaza executia
min2(X, Y, Min) :- X < Y, !, X = Min. % regula 1
min2(X, Y, Min) :- X >= Y, Y = Min. % regula 2

% Red cut - cut este necesar pentru a genera solutii corecte
min3(X, Y, Min) :- X < Y, !, X = Min.
min3(_, Y, Min) :- Y = Min.


% GENERARE SI TESTARE

% subset_sum1(+List, ?Sum).
subset_sum1(_, 0).
subset_sum1([_ | Rest], Sum) :- subset_sum1(Rest, Sum).
subset_sum1([Head | Rest], Sum) :- subset_sum1(Rest, S1), Sum is S1 + Head.

% subset_sum2(+List, +Sum). -- se cunoaste dimensiunea problemei (Sum)
subset_sum2(_, 0) :- !.
subset_sum2([Head | Rest], Sum) :- Head > Sum, !, subset_sum2(Rest, Sum).
subset_sum2([Head | Rest], Sum) :-
    S1 is Sum - Head,
    subset_sum2(Rest, S1).


% AFLAREA TUTUROR SOLUTIILOR PENTRU SATISFACEREA UNUI SCOP

% findall(+Template, +Goal, -Bag)
even(Numbers, Even) :-
    findall(X,
            (member(X, Numbers), X mod 2 =:= 0),
            Even).

% even([1,2,3,4,5,6,7,8,9], Even).

% forall(+Cond, +Action)
% forall(member(X, [2, 4, 6]), X mod 2 =:= 0).
% forall(member(X, [2, 3, 4, 6]), X mod 2 =:= 0).
% forall(member(X, [6, 12, 18]), (X mod 2 =:= 0, X mod 3 =:= 0)).