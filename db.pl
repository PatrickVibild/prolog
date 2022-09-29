vertical(line(point(X, Y), point(X, Y2))).

child(charlotte, caroline).
child(caroline, laura).
child(martha, charlotte).
child(charlotte, caroline).
child(caroline, laura).
child(laura, rose).
 
descent(X,Y) :- child(X,Y).
descent(X,Y) :- child(X,Z),
	descent(Z,Y).

numeral(0).
numeral(succ(X)) :- numeral(X).

add(0, Y, Y).
add(succ(X), Y, succ(Z)) :-
	add(X, Y, Z).