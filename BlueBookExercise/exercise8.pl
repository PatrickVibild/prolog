%Exercise  8.1 Here’s our basic DCG:

s  -->  np,vp.

np  -->  det,n.

vp  -->  v,np.
vp  -->  v.

det  -->  [the].
det  -->  [a].

n  -->  [woman].
n  -->  [man].
n  -->  [apple].
n  -->  [pear].

v  -->  [eats].
%Suppose we add the noun “men” (which is plural) and the verb “know”. Then we would want a DCG which says that “The men eat” is ok, “The man eats” is ok, “The men eats” is not ok, and “The man eat” is not ok. Change the DCG so that it correctly handles these sentences. Use an extra argument to cope with the singular/plural distinction.



s --> np(plural), vp(plural).
s --> np(singular),vp(singular).

np(plural) --> det(plural),n(plural).
np(singular) --> det(singular),n(singular).

vp(plural) --> v(plural),np(_).
vp(singular) --> v(singular),np(_).
vp(plural) --> v(plural).
vp(singular) --> v(singular).

det(plural) --> [the].
det(singular) --> [the].
det(singular) --> [a].

n(plural) --> [men].
n(singular) --> [woman].
n(singular) --> [man].

v(plural) --> [shoot].
v(singular) --> [shoots].

%% ?- s([the,men,shoots],[]).
%% false.

%% ?- s([the,man,shoot],[]).
%% false.

%% ?- s([the,men,shoot],[]).
%% true

%% ?- s([the,man,shoots],[]).
%% true

%% also catches the cases "a men shoot a men" and the likes.

%% Exercise 8.2

%% Translate the following DCG rule into the form Prolog uses:

%% kanga(V,R,Q) --> roo(V,R),jumps(Q,Q),{marsupial(V,R,Q)}.

kanga(V, R, Q, A, C) :-
    roo(V, R, A, B),
    jumps(Q, Q, B, C),
    marsupial(V, R, Q).