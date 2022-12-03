different(Red,Green).
different(Green,Blue).
different(Blue,Red).
different(Yellow,Blue).
different(Yellow,Green).
different(Yellow,Red).
valid(X,[ ]).
valid(Y,[adj(X,[ ])|R]) :- valid(Y,Z).
valid(Z,[adj(X,[Y|T])|Q]) :- search(X,Z,Xc),search(Y,Z,Yc), different(Xc, Yc), valid(Z,[adj(X,Y)|Q]).
search(X,[assign(X,Y)|_],Y).
search(X,[_|Y],Z) :- search(X,Y,Z).
assignment([ ],[ ]).
assignment([assign(X,_)|Y],[adj(X,_)|Z]) :- assignment(X,Y).
coloring(X,Y) :- assignment(X,Y), valid(X,Y).
