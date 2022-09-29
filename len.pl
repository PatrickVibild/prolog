len([], 0).
len([_|T], N):- len(T,X), N is X+1.

% input is len([list..], X).
% this implementation does not check a list of a list.


