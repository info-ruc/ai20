man(socrates).
mortal(X):- man(X).

friend(john, julia).
friend(john, jack).
friend(julia, sam).
friend(julia, molly).


color(red).
color(green).
color(blue).

colorify(Hn,Cq,Hb,Jx,Gd,Gx,Gz) :-    color(Hn), color(Cq), color(Hb), color(Jx),     color(Gd),color(Gx),color(Gz),    \+ Hn=Cq, \+ Hn=Hb, \+ Hn=Jx,     \+ Hn=Gd, \+ Hn=Gx, \+ Hn=Gz,    \+ Cq=Hb, \+ Cq=Gz, \+ Hb=Jx,     \+ Jx=Gd, \+ Gd=Gx, \+ Gx=Gz,    \+ Gz=Cq.



factorial(0,1).
factorial(N,F) :-
    N>0,
    N1 is N-1,
    factorial(N1,F1),
    F is N * F1.


move(1,X,Y,_) :-
    write('Move top disk from '),
    write(X), write(' to '), write(Y),
    nl.

move(N,X,Y,Z) :-
    N>1,
    M is N-1,
    move(M,X,Z,Y),
    move(1,X,Y,_),
    move(M,Z,Y,X).



takeout(X,[X|R],R).
takeout(X,[F|R],[F|S]) :- takeout(X,R,S).

perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).
perm([],[]).


change(e,w).
change(w,e).
move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]) :- change(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :- change(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :- change(X,Y).
move([X,Wolf,Goat,C],nothing,[Y,Wolf,Goat,C]) :- change(X,Y).

oneEq(X,X,_).
oneEq(X,_,X).
safe([Man,Wolf,Goat,Cabbage]) :- oneEq(Man,Goat,Wolf), oneEq(Man,Goat,Cabbage).

solution([e,e,e,e],[]).

solution(Config,[Move|Rest]) :-move(Config,Move,NextConfig),
    safe(NextConfig),
    solution(NextConfig,Rest).

%length(X,7), solution([w,w,w,w],X).
