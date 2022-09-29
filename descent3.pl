child(martha, charlotte).
child(charlotte, caroline).
child(caroline, laura).
child(laura, rose).

% never exits the loop, always calls recursive_descend. Overflow exception
descend(X, Y) :- descend(Z, Y),
    child(X, Z).

descend(X, Y) :- child(X, Y).
