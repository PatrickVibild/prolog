a2b([],[]).
a2b([a|Ta], [b|Tb]) :- a2b(Ta, Tb).

% example on how we can make computation on argument level.