%präfix(
%test: präfix([a, b],[a, b, c, d, e]). true
präfix([X], [X|Ys]).
präfix([X|Xs], [X|Ys]) :- präfix(Xs, Ys).
 
app([],Xs,Xs).
app([X|Xs],Ys,[X,Rs]) :- app(Xs,Ys,Rs).
 
 
% tree(Xb) : Vorschrift, wie ein Binärbaum erzeugt wird.
%Basisfall: Baum ist leer, ansonsten Überprüfe X überprüfe linken Teilbaum und überprüfe rechten Teilbaum rekursiv
tree(e).
tree(n(X,Lb,Rb)) :- tree(Lb), tree(Rb).
 
%postfix(Xs,Ys): Wenn das umgedrehte (inverse) von Xs das Präfix des invertierten Ys ist, dann ist Xs der Postfix von Ys
%test: postfix([k, e],[a, b, c, d, e]). false
%postfix([d, e],[a, b, c, d, e]). true
postfix(Xs,Ys) :- reverse(Xs,Xsr), reverse(Ys,Ysr), präfix(Xsr,Ysr).
 
%%postfix2(Xs,Ys): kann ich Xs an ein Rs anhängen, so dass das Ergebnis Ys ist
%test: postfix2([k, e],[a, b, c, d, e]). false
%postfix2([d, e],[a, b, c, d, e]). true
postfix2(Xs,Ys) :- append(Rs,Xs,Ys).
 
%member(X,Xb): Baum Xb enthält den Eintrag X
%IA: Der Baum ist gleich dem Eintrag
%member(Z,n(a,n(b,n(c,e,e),n(d,e,e)),n(g,e,e))).
member(X,n(X,_,_)).
member(X,n(_,Lb,_)) :-  member(X,Lb).
member(X,n(_,_,Rb)) :-  member(X,Rb).
 
%präorder(Xb, Ys) : Ys ist die Liste der Knotenbschriftungen des Binärbaums in Präorder.
%Erst die Wurzel, dann rekursiv erst links dann rechts
%preorder(n(1,n(2,n(3,e,e),n(4,e,e)),n(99,e,e)),Zs).
preorder(e,[]).
preorder(n(X,Lb,Rb),[X|Xs]) :- preorder(Lb,Y1s),preorder(Rb,Y2s),append(Y1s,Y2s,Xs).


%postorder(Xb, Ys) : Ys ist die Liste der Knotenbschriftungen des Binärbaums in Postorder
%Rekursiv links dann rechts und dann Knoten
%postorder(n(42,n(13,n(6,e,e),n(36,e,e)),n(57,n(47,e,e),n(69,n(64,e,e),n(73,e,n(77,e,e))))),Zs).
postorder(e,[]).
postorder(n(X,Lb,Rb),Xs) :- postorder(Lb,Y1s),postorder(Rb,Y2s),append(Y1s,Y2s,X1s), append(X1s,[X],Xs).


%roots(Xbs,Ys):Xbs ist eine Liste von Binärbäumen (geschachtelte Induktion). 
%Die Liste Ys ist die Liste der Wurzelbeschriftungen der Binärbäume in Xbs in der richtigen 
%Reihenfolge.
%roots([n(42,e,e),n(43,e,e),n(44,e,e),n(45,e,e),n(46,e,e),n(47,e,e)],Zs).
roots([],[]).
roots([n(X,_,_)|Xbs],[X|Ys]) :- roots(Xbs,Ys).




