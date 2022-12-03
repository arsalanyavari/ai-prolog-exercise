threeIsFull(3).
threeIsFull(0).
fourIsFull(4).
fourIsFull(0).
three(X) :- 3 >= X, X >= 0.
four(X) :- 4 >= X, X >= 0.
result([X, Y]) :- Y is 2, three(X).
ids(N, Sol, D, _) :- ldfs(N, Sol, D), !.
ids(N, Sol, D, Limit) :- D1 is D + 1, D1 < Limit, ids(N, Sol, D1, Limit).
ldfs(N, [N], _) :- result(N), !.
ldfs(N, [N | Sol], Maxdepth) :-
Maxdepth > 0,
s(N, N1),
NMax is Maxdepth-1,
ldfs(N1, Sol, NMax).
s([U3, U4], [V3, V4]) :- threeIsFull(V3), V4 is U4 + U3 - V3, four(V3), four(V4).
s([U3, U4], [V3, V4]) :- fourIsFull(V4), V3 is U3 + U4 - V4, three(V3), four(V4).
s([_, U4], [V3, V4]) :- V4 is U4, threeIsFull(V3).
s([U3, _], [V3, V4]) :- V3 is U3, fourIsFull(V4).
