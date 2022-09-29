accMax([H|T],A,Max):-
    H > A,
    accMax(T,H,Max).
accMax([H|T],A,Max):-
    H =< A,
    accMax(T,A,Max).
accMax([],A,A).

% calling function. We initialize the smallest number with the first one in the list.
maxCall(List,Max) :-
    List = [H|_],
    accMax(List, H, Max).