append([], L, L).
append([H|T],L2,[H|L3]) :-
    append(T, L2, L3).

% no tail recursive implementation
% naive implementation.
% Creates a new copy list moving elements one by one to a new list.
naiverev([],[]).
naiverev([H|T], R) :-
    naiverev(T, RevT),
    append(RevT,[H],R).

% accumulator implementation.
% this is more efficient than naive using accumulator.
% computation is done on argument level compared to the naive implementation.

accRev([H|T],A,R) :-
    accRev(T,[H|A],R).
accRev([],A,A).
rev(L,R) :- accRev(L,[],R).

