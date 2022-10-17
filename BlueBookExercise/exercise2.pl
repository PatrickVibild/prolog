%Exercise  2.1 Which of the following pairs of terms unify? Where relevant, give the variable instantiations that lead to successful unification.
%  
%  bread  =  bread - true
%  ’Bread’  =  bread - false
%  ’bread’  =  bread - true
%  Bread  =  bread - true (Bread variable is instatited to bread)
%  bread  =  sausage 0 false
%  food(bread)  =  bread - false
%  food(bread)  =  X - true, X = food(bread).
%  food(X)  =  food(bread) - true X = bread
%  food(bread,X)  =  food(Y,sausage) - true, X = sausage, Y = bread
%  food(bread,X,beer)  =  food(Y,sausage,X) - False. X an not be beer and sausage at the smae time.
%  food(bread,X,beer)  =  food(Y,kahuna_burger) - Fasle, different functors.
%  food(X)  =  X - True Prolog SWI implementation. Optimisstic uniication.  X = food(X).
%  meal(food(bread),drink(beer))  =  meal(X,Y) - True, X = food(bread), Y = drink(beer).
%  meal(food(bread),X)  =  meal(X,drink(beer)) - False, X can not be instiatiated to two different constants.


%  Exercise  2.2 We are working with the following knowledge base:
%  
 house_elf(dobby).
 witch(hermione).
 witch(’McGonagall’).
 witch(rita_skeeter).
 magic(X):-  house_elf(X).
 magic(X):-  wizard(X).
 magic(X):-  witch(X).
%  Which of the following queries are satisfied? Where relevant, give all the variable instantiations that lead to success.
%  
?-  magic(house_elf). % false
?-  wizard(harry). % false
?-  magic(wizard). % false
?-  magic(’McGonagall’). % True
?-  magic(Hermione). % Hermione = dobby, Hermione = hermione, Hermione = 'McGonagall', Hermione = rita_skeeter
%  Draw the search tree for the query magic(Hermione) .
%
%%     --------------------------------------------------------------
%%     |                     ?- magic(Hermione)                     |
%%     --------------------------------------------------------------
%%                 /              |                     \
%% Hermione = _G1 /               | Hermione = _G1       \ Hermione = _G1
%%               /                |                       \
%% ---------------------  ------------------        ---------------------------------------
%% | ?- house_elf(_G1) |  | ?- wizard(_G1) |        |            ?- witch(_G1)            |
%% ---------------------  ------------------        ---------------------------------------
%%             |                  |                     /     |                     \
%% _G1 = dobby |                  |     _G1 = hermione /      | _G1 = 'McGonagall'   \ _G1 = rita_skeeter
%%             |                  |                   /       |                       \
%%           -----                X                -----    -----                    -----
%%           |   |                                 |   |    |   |                    |   |
%%           -----                                 -----    -----                    -----

%  Exercise  2.3 Here is a tiny lexicon (that is, information about individual words) and a mini grammar consisting of one syntactic rule (which defines a sentence to be an entity consisting of five words in the following order: a determiner, a noun, a verb, a determiner, a noun).
%  
 word(determiner,a).
 word(determiner,every).
 word(noun,criminal).
 word(noun,’big  kahuna  burger’).
 word(verb,eats).
 word(verb,likes).

 sentence(Word1,Word2,Word3,Word4,Word5):-
       word(determiner,Word1),
       word(noun,Word2),
       word(verb,Word3),
       word(determiner,Word4),
       word(noun,Word5).
%  What query do you have to pose in order to find out which sentences the grammar can generate? List all sentences that this grammar can generate in the order that Prolog will generate them in.
sentence(A, B, C, D, E).
%% e.g. the following is the first possibility since it uses all the first
%% examples of article, noun, verb listed.
%% A = a,
%% B = criminal,
%% C = eats,
%% D = a,
%% E = criminal ;

%  Exercise  2.4 Here are six Italian words:
%  
%  astante , astoria , baratto , cobalto , pistola , statale .
%  
%  They are to be arranged, crossword puzzle fashion, in the following grid:
%  
%  *Pic not found*
%  
%  The following knowledge base represents a lexicon containing these words:
%  
 word(astante,  a,s,t,a,n,t,e).
 word(astoria,  a,s,t,o,r,i,a).
 word(baratto,  b,a,r,a,t,t,o).
 word(cobalto,  c,o,b,a,l,t,o).
 word(pistola,  p,i,s,t,o,l,a).
 word(statale,  s,t,a,t,a,l,e).

%  Write a predicate crossword/6 that tells us how to fill in the grid. The first three arguments should be the vertical words from left to right, and the last three arguments the horizontal words from top to bottom.

crossword(V1,V2,V3,H1,H2,H3) :-
  %% Make the word intersect at the right places.
  %% Use _ where we don't give a fuck about variable name.
  word(H1,_,H12V12,_,H14V22,_,H16V32,_),
  word(H2,_,H22V14,_,H24V24,_,H26V34,_),
  word(H3,_,H32V16,_,H34V26,_,H36V36,_),

  word(V1,_,H12V12,_,H22V14,_,H32V16,_),
  word(V2,_,H14V22,_,H24V24,_,H34V26,_),
  word(V3,_,H16V32,_,H26V34,_,H36V36,_)