member(X, [X | _]).
member(X, [_ | T]) :-
    member(X, T).

% check if X is a member of a list T.
% we can use hidden variables so we do not store those values.
