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

men():-man(X),write(X),nl,fail.
women():-woman(X),write(X),nl,fail.