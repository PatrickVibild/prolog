accLen([_|T],A,L) :-
    Anew is A+1, accLen(T, Anew, L).
accLen([],A,A).
% calling this is accLen([list..], 0, X).

% this implementation is not efficient. Creating new variables on each call compared to 'len.pl'.

% this program is tail recursive. Tesult is all calculated at once we reached te button of the recursion and
% solution has to be passed up.

% in recursive program which are not tail recursive, there are goals in one level of recursion which have to wait for the answer of a lower level of recursion before they can be evaluated.


% caller method.
leng(List, Lenght) :-
    accLen(List, 0, Lenght).
