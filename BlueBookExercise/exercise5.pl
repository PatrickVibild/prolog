%Exercise  5.1 How does Prolog respond to the following queries?

%X  =  3*4. -> X = 3*4
%X  is  3*4. -> X = 12
%4  is  X. -> no instatation bla bla...
%X  =  Y. -> X = Y
%3  is  1+2. -> true
%3  is  +(1,2). -> true
%3  is  X+2. -> istantation error bla bla..
%X  is  1+2. -> X = 3
%1+2  is  1+2. -> false. Comparing 1+2 term to 3.
%is(X,+(1,2)). -> X = 3
%3+2  =  +(3,2). -> true. Comparing terms
%*(7,5)  =  7*5. -> true. Comparing terms.
%*(7,+(3,2))  =  7*(3+2). -> true, comparing terms.
%*(7,(3+2))  =  7*(3+2). -> true, comparing terms.
%7*3+2  =  *(7,+(3,2)). -> true (parenthesis are define mathematically.
%*(7,(3+2))  =  7*(+(3,2)). -> true
%Exercise  5.2
%
%Define a 2-place predicate increment that holds only when its second argument is an integer one larger than its first argument. For example, increment(4,5) should hold, but increment(4,6) should not.
%Define a 3-place predicate sum that holds only when its third argument is the sum of the first two arguments. For example, sum(4,5,9) should hold, but sum(4,6,12) should not.
increment(X, Y) :- Y is X + 1.

sum(X, Y, Z) :- X is Z - Y.

%Exercise  5.3 Write a predicate addone/2 whose first argument is a list of integers, and whose second argument is the list of integers obtained by adding 1 to each integer in the first list. For example, the query
%
%   ?-  addone([1,2,7,2],X).
%should give
%
%   X  =  [2,3,8,3].
addOne([],[]).
addOne([V1|T1], [V2|T2]) :-
    V2 is V1+1,
    addOne(T1, T2).
