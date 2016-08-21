odule(leetcode-erlang).
-author("Yulu Ma").

-export([addtwonumbers/2, bi_prev/1, bi_next/1]).



%% 2. Add Two Numbers.
%% Hint: use a tuple with two array elements to simulate double-linked-list: {[Left], [Right]}
-type bilinked_list() ::{[integer()], [integer()]}.

-spec addtwonumbers(bilinked_list(), bilinked_list()) -> bilinked_list().
-spec bi_prev(bilinked_list()) -> bilinked_list() | nil.
-spec bi_next(bilinked_list()) -> bilinked_list() | nil.


bi_prev({[], _Right}) -> nil;
bi_prev({[H|T], Right}) ->
  {T, [H|Right]}.

bi_next({_Left, []}) -> nil;
bi_next({Left, [H|T]}) -> 
  {lists:append(Left, [H]), T}.




addtwonumbers(nil, nil) -> nil;
addtwonumbers(BL1, BL2) ->
  {_Ll0, Lr0} = BL1,
  {_Ll1, Lr1} = BL2,
  {[],[(X0+X1) rem 10||{X0, X1} <- lists:zip(Lr0, Lr1)]}.