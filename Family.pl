man(vladimir).
man(dmitrii).
man(nikita).
man(slava).
man(petr).
man(maxim).
man(elisei).
man(fedor).
man(alex).
man(eric).
man(mihail).
man(kirill).

woman(galina).
woman(tatyana).
woman(masha).
woman(katerina).
woman(vera).
woman(viktoria).
woman(nastya).
woman(danna).

parent(vladimir,dmitrii).
parent(vladimir,nikita).
parent(vladimir,katerina).
parent(vladimir,vera).

parent(galina,dmitrii).
parent(galina,nikita).
parent(galina,katerina).
parent(galina,vera).

parent(dmitrii,viktoria).
parent(dmitrii,maxim).
parent(dmitrii,petr).
parent(tatyana,viktoria).
parent(tatyana,maxim).
parent(tatyana,petr).

parent(nikita,elisei).
parent(masha,elisei).

parent(fedor,alex).
parent(fedor,eric).
parent(katerina,alex).
parent(katerina,eric).

parent(vera,mihail).
parent(vera,nastya).
parent(slava,nastya).
parent(slava,mihail).

parent(kirill,tatyana).
parent(kirill,masha).
parent(kirill,fedor).
parent(kirill,slava).

parent(danna,tatyana).
parent(danna,masha).
parent(danna,fedor).
parent(danna,slava).

men():-man(X),write(X),nl,fail.
women():-woman(X),write(X),nl,fail.

children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

father(X,Y):-parent(X,Y),man(X).
father(X):-father(Y,X),write(Y).

brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),X\=Y.
brothers(X):-mother(Z,X),mother(Z,Y),man(Y),X\=Y,write(Y),nl,fail.

sister(X,Y):-mother(Z,X),mother(Z,Y),woman(X),X\=Y.
sisters(X):-sister(Y,X),write(Y),nl,fail.

b_s(X,Y):-mother(Z,X),mother(Z,Y).
b_s(X):-b_s(X,Y),X\=Y,write(Y),nl, fail.

grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X).
grand_pas(Y):-grand_pa(X,Y),write(X),nl,fail.

grand_ma(X,Y):-parent(Z,Y),parent(X,Z),woman(X).
grand_mas(Y):-grand_ma(X,Y),write(X),nl,fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y).
grand_pa_and_son(X,Y):-grand_pa(Y,X),man(X).

grand_ma_and_son(X,Y):-grand_ma(X,Y),man(Y).
grand_ma_and_son(X,Y):-grand_ma(Y,X),man(X).

uncle(X,Y):-parent(Z,Y),brother(X,Z).
uncles(X):-uncle(Z,X),write(Z),nl,fail.
