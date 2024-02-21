% INTRODUCERE IN PROLOG

% SINTAXA SI SEMANTICA

% Programele scrise in Prolog descriu relatii exprimate prin clauza

% 2 tipuri de clauze:
%   1. Axiome (facts)
%   2. Reguli


% 1. AXIOME - predicate de ordin I considerate adevarate

% Predicate unare 
caine(cerberus).
om(socrate).

% muritor(leulDinNemeea).
% muritor(rhesus).

% Predicate binare
% cel_mai_bun_prieten(?Cine, ?AlCui) 
% `?` indica faptul ca termenii (Cine, AlCui) pot fi atat input cat si output
% `+` indica faptul ca termenii sunt numai input
% `-` indica faptul ca termenii sunt numai output

cel_mai_bun_prieten(cerberus, hades).

% Predicate ternare
% rege(?Nume, ?Regiune, ?Aliat)

rege(rhesus, tracia, troia).

% in consola rulam urmatoarele interogari
% caine(cerberus).
% muritor(socrate).


% TERMENI - orice valoare

% Constante textuale - ATOMI
% nume, ion, popescu -- ! cu litera mica

% Numere intregi/numere in virgula mobila

% Variabile - detaliem mai jos
% om(X). -- ! cu litera mare
% X = socrate.

% Termeni compusi
% client(nume(ion, popescu), carte(aventuri, 2002)).


% SCOPURI SI VARIABILE

% Scopuri - nr clauze de verificat

% muritor(rhesus), rege(rhesus, tracia, troia).
% true, 2 scopuri

% muritor(X). - 1 scop, 1 variabila ce trebuie legata: X

% `_` - ca in Haskell, variabila anonima
% muritor(X), rege(X, Y, _). - 2 scopuri, 2 variabile ce trebuie legate: X, Y
% muritor(X), rege(X, _, _). - 2 scopuri, 1 variabila ce trebuie legata


% REGULI

% Antet :- Corp. 
% Antetul este adevarat daca corpul este adevarat

viu(hercule).
viu(zeus).
viu(hunabku).

zeu(zeus).

% muritor(leulDinNemeea).
% muritor(rhesus).
muritor(X) :- om(X).
muritor(X) :- viu(X), \+ zeu(X).

% `,` - `si` logic - ambele clauze trebuie sa fie adevarate pentru a se satisface
% `\+` - (momentan il privim ca) negatie


% PROCESUL DE EXECUTIE (de citit)

% ?- trace
% ?- muritor(hercule).


% OPERATORI

% Aritmetici: +, -, *, /

% De unificare: =, \=, ==, \==

% Relationali aritmetici: =\=, <, >, =<, >=, =:=, is

% De control: , (si), ; (sau), \+ (negatie)

% Tipuri diferite de egalitate
% = : unificare, legare astfel inca variabilele sa se unifice
% \= : adevarat cand cei 2 operanzi NU se pot unifica
% == : verifica daca cei 2 operanzi sunt acelasi lucru (sunt necesare legari anterioare cu =)
% \== : \+ T1 == T2
% is : echivalent cu =:= (egalitate aritmetica) daca p. stanga si p. dreapta sunt ambele legate, 
%       altfel incearca sa lege partea stanga la partea dreapta
% =:= : operator aritmetic, ambii operanzi trebuie sa fie complet instantiati (legati)
% =\= : \+ T1 =:= T2

% Cateva exemple:
% X = 2 + 1.

% 1 + 2 == 2 + 1.
% 2 + 1 == 2 + 1.

% X is 2 + 1.
% 3 is 2 + 1.
% 3 is 1 + 2.
% 1 + 2 is 2 + 1.
% 2 + 1 is 2 + 1.
% 1 + 2 is 3.

% 3 =:= 2 + 1.
% 1 + 2 =:= 3.
% 1 + 2 =:= 2 + 1.
% 3 =:= 3.


% TIPURI DE DATE

% Pana acum am discutat despre: atomi (constante), numere, variabile, termeni compusi.

% 1. Liste
% [] - lista vida
% [a, b, c] - lista cu elementele a, b, c
% [H | T] - lista nevida (H - head, T - tail (poate fi si []))
% [X1, X2, ..., XN | Rest] - lista care incepe cu X1, X2, ..., XN

% 2. Siruri
% X = "abc", string(X), writeln(X).