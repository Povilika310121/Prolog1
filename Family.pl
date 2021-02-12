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

parent(nikita,bogomil).
parent(nikita,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

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