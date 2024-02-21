% PROBLEME DE CAUTARE IN SPATIUL STARILOR

% Strategii de cautare in spatiul starilor
%   1. Generare si testare
%   2. Backtracking
%   3. Cautare in adancime/latime
%   4. Algoritmul A*

% BACKTRACKING
% Pattern general

solve(Solution) :- 
    initial_state(State),
    search([State], Solution).

% search(+VisitedStates, -Solution) defineste mecanismul general de cautare astfel:
%   - cautarea incepe de la o stare initiala data (initial_state)
%   - dintr-o stare curenta se genereaza starile urmatoare posibile(next_state)
%   - se testeaza ca starea in care s-a trecut este nevizitata anterior(evitand trasee ciclice)
%   - cautarea continua din noua stare, pana se intalneste o stare finala (final_state)

search([CurrentState|Other], Solution):-
    final_state(CurrentState), !,
    reverse([CurrentState|Other], Solution).
    
search([CurrentState|Other], Solution):-
    next_state(CurrentState, NextState),
    \+ member(NextState, Other),
    search([NextState,CurrentState|Other], Solution).

% CAUTARE IN LATIME (BFS)
% Pattern general

do_bfs(Solution):-
    initial_node(StartNode),
    bfs([(StartNode,nil)], [], Discovered),
    extract_path(Discovered, Solution).

% bfs(+NonVisitedStatesQueue,+VisitedStates,-Solution) va defini mecanismul general de căutare în lăţime astfel:
%   - căutarea începe de la o stare inițială dată care n-are predecesor în spaţiul stărilor 
% (StartNode cu părintele nil)
%   - se generează toate stările următoare posibile
%   - se adaugă toate aceste stări la coada de stări încă nevizitate
%   - căutarea continuă din starea aflată la începutul cozii, până se întâlneşte o stare finală

% CAUTARE A*
% Pattern general

astar_search(Start, End, Grid, Path) :-
    manhattan(Start, End, H),  
    astar(End, [H:Start], [Start:("None", 0)], Grid, Discovered),
    get_path(Start, End, Discovered, [End], Path).

% astar(+End, +Frontier, +Discovered, +Grid, -Result) va defini mecanismul general de căutare A*, astfel:

%   - căutarea începe de la o stare inițială dată care n-are predecesor în spaţiul stărilor
% (StartNode cu părintele “None”) și distanța estimată de la acesta până la nodul de final printr-o euristică 
% (exemplu: distanța Manhattan)

%   - se generează toate stările următoare posibile și se calculează costul acestora adăugând costul acțiunii 
% din părinte până în starea aleasă cu costul real calculat pentru a ajunge în părinte 
% (costul părintelui în Discovered)

%   - dacă starea aleasă nu este în Discovered sau dacă noul cost calculat al acesteia este mai mic decât 
% cel din Discovered, se adaugă în acesta, apoi va fi introdusă în coada de priorități (Frontier) 
% cu prioritatea fiind costul cu care a fost adaugată în Discovered + valoarea dată de euristică din starea 
% curentă până în cea finală

%   - căutarea continuă din starea aflată la începutul cozii, până se întâlneşte o stare finală