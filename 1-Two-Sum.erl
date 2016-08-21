-module(leetcode-erlang).
-author("Yulu Ma").

-export([twosum/2]).


%% 1. Two Sum
%% Hints: use tuple to add indices to array.
-spec twosum([integer()], integer()) -> [integer()].
-spec twosumtuple([{integer(),integer()}], integer()) -> [integer()].

twosum(L0, Target) -> 
  T0 = lists:zip(L0, lists:seq(1, length(L0))),
  twosumtuple(T0, Target).


twosumtuple([], _Target) -> [];
twosumtuple(T0, Target) ->
  [{V,I}|T] = T0,
  R = [It||{Vt, It}<-T, V+Vt =:= Target],
  if
  	length(R) > 0 ->
  	  lists:append(lists:append([I],R), twosumtuple(T, Target));
  	true ->
  	  lists:append([],twosumtuple(T, Target))
  end.