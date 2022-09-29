child(martha, charlotte).
child(charlotte, caroline).
child(caroline, laura).
child(laura, rose).


% solves the problems returns the biggest descend in heriarchy.
% something about creating variables when the base case is not first.
descend(X, Y) :- child(X, Z),
    descend(Z, Y).

descend(X, Y) :- child(X, Y).
