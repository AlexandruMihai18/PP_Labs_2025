% 1. Care dintre urmatoarele implementari din Prolog il leaga pe X la 7/5
% in urma interogarii f(3/5, 4/5, X).?

% 1. f(A/X, B/X, C/X) :- C is A + B.
% 2. f(A/B, C/D, E/F) :- B = D, B = F, E is A + C.
% 3. f(A/B, C/D, E/F) :- B == D, B == F, E is A + C.
% 4. f(A/B, C/D, E/F) :- B == D, B = F, E is A + C.

% 2. Ce produce interogarea Prolog de mai jos?
% length(L, 3), append(_, [_, 1 | _], L).

% 3. De cate ori este satisfacuta interogarea pred(R), conform regulii de mai jos?
pred(R) :- append(A, B, [1, X, Y]), member(R, A), member(R, B).

% 4. Ce va afisa Prolog daca ii solicitam satisfacerea scopului predicat(X) 
% in toate modurile posibile?

p(1). p(2). p(3).
q(1). q(3).

predicat(X) :- p(A), q(A), p(B), q(B), append(X, Y, [1, 2, 3, 1]), member(A, X), member(B, Y).

% Raspunsuri:
% 1. 1, 2, 4
% 2. 2 legari distincte pt L
% 3. 4