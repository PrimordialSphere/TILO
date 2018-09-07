maennlich(machmut).
maennlich(olaf).
maennlich(joerg).
maennlich(horst).
maennlich(andy).
maennlich(basti).

weiblich(renata).
weiblich(oma).
weiblich(santiago).
weiblich(nathalie).
weiblich(santiago).
weiblich(steffi).

vater(joerg,olaf).
vater(joerg,machmut).
vater(joerg, nathalie).
vater(horst, basti).
vater(horst, andy).
vater(horst, steffi).

mutter(renata, olaf).
mutter(renata, machmut).
mutter(renata, nathalie).
mutter(santiago, basti).
mutter(santiago, andy).
mutter(santiago, steffi).
mutter(omarentae, renata).
mutter(oma, santiago).


%Bruder: X ist Bruder von Y, wenn Z Vater von X und Y ist und K Mutter von Y und Y
bruder(X,Y) :- vater(Z,X),vater(Z,Y),mutter(K,X),mutter(K,Y), maennlich(X), \=(X,Y).

%Schwester: X ist Schwester von Y, wenn Z Vater von X und Y ist und K Mutter von Y und Y
schwester(X,Y) :- vater(Z,X),vater(Z,Y),mutter(K,X),mutter(K,Y), weiblich(X), \=(X,Y).

%Sohn: X ist Sohn von Y, wenn Y vater oder mutter von X ist und X maennlich ist
sohn(X,Y) :- vater(Y,X), maennlich(X).
sohn(X,Y) :- mutter(Y,X), maennlich(X).

%Tochter: X ist Tochter von Y, wenn Y vater oder mutter von X ist und X weiblich ist
tochter(X,Y) :- vater(Y,X), weiblich(X).
tochter(X,Y) :- mutter(Y,X), weiblich(X).

%cousin: X ist Cousin von Y, wenn mutter oder vater K und L von X und Y dieselbe Mutter oder Vater M haben
cousin(X,Y) :- mutter(K,X), mutter(L,Y), mutter(M,K), mutter(M,L).
cousin(X,Y) :- vater(K,X), vater(L,Y), vater(M,K), vater(M,L).

%Geschwister: X und Y sind Geschwister, wenn X Bruder oder Schwester von Y
geschwister(X,Y) :- bruder(X,Y).
geschwister(X,Y) :- schwester(X,Y).