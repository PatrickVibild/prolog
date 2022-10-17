%  Exercise  1.1 Which of the following sequences of characters are atoms, which are variables, and which are neither?


% vINCENT - Atom
% Footmassage - Variable
% variable23 - Atim
% Variable2000 - Variable
% big_kahuna_burger - atom
% ’big  kahuna  burger’ - atom
% big  kahuna  burger - neither
% ’Jules’ - atom
% _Jules - variable. Exmplanation: by using this name in a query you are telling Prolog (or at least your implementation of Prolog) that you don't want to show its value
% ’_Jules’ - atom

% Exercise  1.2 Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all? Give the functor and arity of each complex term.
% 
% loves(Vincent,mia) - Complex loves/2
% ’loves(Vincent,mia)’ - atom
% Butch(boxer) - not a term. Complex term can not start with capital.
% boxer(Butch) - Complex term boxer/1
% and(big(burger),kahuna(burger)) - Complex and/2 big/1 kahuna/1
% and(big(X),kahuna(X)) - complex and/2
% _and(big(X),kahuna(X)) - not a term. Complex term only starts with undercase.
% (Butch  kills  Vincent) - neither, missing the functor of the complex term.
% kills(Butch  Vincent) - neither, missing ',' between arguments
% kills(Butch,Vincent - Neither, missing ')' at the end

% Exercise  1.3 How many facts, rules, clauses, and predicates are there in the following knowledge base? What are the heads of the rules, and what are the goals they contain?
% 
%    woman(vincent).
%    woman(mia).
%    man(jules).
%    person(X):-  man(X);  woman(X).
%    loves(X,Y):-  father(X,Y).
%    father(Y,Z):-  man(Y),  son(Z,Y).
%    father(Y,Z):-  man(Y),  daughter(Z,Y).

%  facts - 3
%  rules - 4
%  clause - (facts + rules) 7
%  predicates - (unique functors) 5

% Exercise  1.4 Represent the following in Prolog:
% 
% Butch is a killer. -
killer(butch).
% Mia and Marsellus are married. -
married(mia, marsellus).
% Zed is dead. -
dead(zed).
% Marsellus kills everyone who gives Mia a footmassage.
kills(marchellus, X) :- givesFootMassage(X, mia).
% Mia loves everyone who is a good dancer.
    loves(mia, X) :- goodDancer(X).
    % Jules eats anything that is nutritious or tasty.
eats(jules, X):-
   nutrition(X);
   tasty(X).

% Exercise  1.5 Suppose we are working with the following knowledge base:
% 
%    wizard(ron).
%    hasWand(harry).
%    quidditchPlayer(harry).
%    wizard(X):-  hasBroom(X),  hasWand(X).
%    hasBroom(X):-  quidditchPlayer(X).
% How does Prolog respond to the following queries?
%
% wizard(ron). - true
% witch(ron). - false // undefined procedure
% wizard(hermione). - false
% witch(hermione). - false // undefined procedure
% wizard(harry). - true
% wizard(Y). - Y = run; Y = harry.
% witch(Y). - false // undefined procedure

% returns unefined or false depending on Prolog implementation.


