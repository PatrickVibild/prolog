child(martha, charlotte).
child(charlotte, caroline).
child(caroline, laura).
child(laura, rose).

% solve the problem and also returns the first smallest descend.
descend(X, Y) :- child(X, Y).
descend(X, Y) :- child(X, Z),
    descend(Z, Y).