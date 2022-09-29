child(martha, charlotte).
child(charlotte, caroline).
child(caroline, laura).
child(laura, rose).

% Returns all descend and then overflows exception.
% base case first, then recursion with base case, then recursion.
% is the solution for this.
descend(X, Y) :- child(X, Y).
descend(X, Y) :- descend(Z, Y),
    child(X, Z).