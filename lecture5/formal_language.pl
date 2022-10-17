%% application that validates a language a^n b^n c^n
%s(Count) --> ablock(Count), bblock(Count), cblock(Count).
%ablock(0) --> [].
%ablock(succ(Count)) --> [a],ablock(Count).
%bblock(0) --> [].
%bblock(succ(Count)) --> [b],bblock(Count).
%cblock(0) --> [].
%cblock(succ(Count)) --> [c],cblock(Count).

%% with Accumulators, ths can not create new output.
% Only work on recognition mode.
% loops infinite if we pass s(L, []).
s --> ablock(Count), bblock(Count), cblock(Count).
ablock(0) --> [].
ablock(NewCount) --> [a], ablock(Count),
                        {NewCount is Count+1}.
bblock(0) --> [].
bblock(NewCount) --> [b], bblock(Count),
                        {NewCount is Count+1}.
cblock(0) --> [].
cblock(NewCount) --> [c], cblock(Count),
                        {NewCount is Count+1}.