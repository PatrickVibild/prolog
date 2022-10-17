%% This problem first instiatiate all X, Y, Z to random variables and then checks if they are valid

s(Z) :- np(X), vp(Y), append(X,Y,Z).
np(Z) :- det(X), n(Y), append(X,Y,Z).
vp(Z) :- v(X), np(Y), append(X,Y,Z).
vp(Z) :- v(Z).
det([the]).
det([a]).
n([woman]).
n([man]).
v([shoots]).

%% improved rule, appends becomes first goal, so it doesnt brute forces all solutions.
s_1(Z) :- append(X,Y,Z), np_1(X), vp_1(Y) .
np_1(Z) :- append(X,Y,Z),det(X), n(Y).
vp_1(Z) :- append(X,Y,Z), v(X), np_1(Y).
vp_1(Z) :- v(Z).

%% consuming list instead of appending. Improved implementation.
%% how to use? s_2(X, []).
s_2(X, Z) :- np_2(X, Y), vp_2(Y, Z).
np_2(X, Z) :- det_2(X, Y), n_2(Y, Z).
vp_2(X, Z) :- v_2(X, Y), np_2(Y, Z).
vp_2(X, Z) :- v_2(X, Z).
det_2([the|W], W).
det_2([a|W], W).
n_2([woman|W], W).
n_2([man|W], W).
v_2([shoots|W], W).



%% final solution
%% This is a shortcut to previous implementation. Still need to call this with empty array. s_3(X, []).
s_3 --> np_3, vp_3.
np_3 --> det_3, n_3.
vp_3 --> v_3, np_3.
vp_3 --> v_3.
det_3 --> [the].
det_3 --> [a].
n_3 --> [woman].
n_3 --> [man].
v_3 --> [shoots].


%% addin gmore to the language.
% conjution between sentences without a loop.
s_4 --> simple_s.
s_4 --> simple_s, conj, s_4.
simple_s --> np_4, vp_4.
np_4 --> det_4, n_4.
vp_4 --> v_4, np_4.
vp_4 --> v_4.
det_4 --> [the].
det_4 --> [a].
n_4 --> [woman].
n_4 --> [man].
v_4 --> [shoots].
conj --> [and].
conj --> [or].
conj --> [but].



%% context free grammar with features. We want to add senteces like 'She shoots him' 'He shoots her'.
s_5 --> np_5(subject), vp_5.
np_5(_) --> det_5, n_5.
np_5(X) --> pro_5(X).
vp_5 --> v_5, np_5(object).
vp_5 --> v_5.
det_5 --> [the].
det_5 --> [a].
n_5 --> [woman].
n_5 --> [man].
pro_5(subject) --> [he].
pro_5(subject) --> [she].
pro_5(object) --> [him].
pro_5(object) --> [her].
v_5 --> [shoots].



%% separate and lexicon.
% Rules and lexicon are separated.
s_6 --> np_6, vp_6.
np_6 --> det_6, n_6.
vp_6 --> v_6, np_6.
vp_6 --> v_6.
det_6 --> [Word], {lex(Word, det)}.
n_6 --> [Word], {lex(Word, n)}.
v_6 --> [Word], {lex(Word, v)}.

%lexicon
lex(the, det).
lex(a, det).
lex(woman, n).
lex(man, n).
lex(shoots, v).

