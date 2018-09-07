%Prädikate aus den Uebungen

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)):- app(X1s,Ys,X2s).

add(o,Y,Y).
add(s(X),Y,s(E)):- add(X,Y,E).

%%Definition einer Liste:
%Die einfschste Liste enthält nur nil
linListe(nil).
linListe(list(A,Xs)) :- linListe(Xs).

%member(X,Ys) : Ys enthält das Element X
%Funktion überprüft, ob ein Element in der Liste enthalten ist. 
membe(X,list(X,Ys)).
membe(X,list(Y,Ys)) :-  membe(X,Ys).

%infix(Xs,Ys) : Ys enthält die Liste Xs.
%infix: Xs ist Infix von Ys wenn es eine Liste gibt, an die Xs angehangen wird
%und die dann selber mit belibigem Anhang Ys ergibt
infix(Xs,Ys) :- app(Irgend,Xs,Hs), app(Hs,Irgend,Ys).

%binbaum wie in der Uebung
binbaum(nil).
binbaum(baum(X,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

%construct: construct(Root,Lb,Rb,Xneub)
construct(X,Lb,Rb,baum(X,Lb,Rb)).

%knotenanz(Xb,N): N ist die Konotenanzahl der Liste Xb
%Basisfall: Null Knoten Anzahl null. 
%Rekursion durch linken Teilbum bis zum Ende von dort jeweils der Rechte Baum
knotenanz(nil,o).
knotenanz(baum(X,Lb,Rb),s(N)) :- knotenanz(Lb,H1),knotenanz(Rb,H2),add(H1,H2,N).
