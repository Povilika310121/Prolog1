%Задание 1 Реализовать предикат max(X,Y,Z), где Z максимальное из чисел X и Y.
max(X,Y,X):-X>Y,!.
max(_,Y,Y).

% Задание 2 Реализовать предикат max(X,Y,U,Z), где Z максимальное из
% чисел X и Y.
max(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).

% Задание 3 Реализовать предикат fact(N,X), где X – это факториал первого
% аргумента с помощью рекурсии вверх.
fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

% Задание 4 Реализовать предикат fact(N,X), где X – это факториал первого
% аргумента с помощью рекурсии вниз.
fact1(N,X):-fact1(0,1,N,X).
fact1(N,X,N,X):-!.
fact1(I,F,N,X):-I1 is I+1,F1 is F*I1,fact1(I1,F1,N,X).

% Задание 5 Реализовать предикат fib(N,X), где X – число Фибоначчи с
% номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вверх.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2, fib(N1,X1),fib(N2,X2), X is X1+X2.

% Задание 6 Реализовать предикат fib(N,X), где X – число Фибоначчи с
% номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вниз.
fib1(N,X):-fib1(1,1,N,X,1).
fib1(X,_,N,X,N):-!.
fib1(I,F,N,X,Q):-Q1 is Q+1,Z is I,I1 is F,F1 is F+Z,fib1(I1,F1,N,X,Q1).

%Задание 7 Найти сумму цифр числа с помощью рекурсии вверх.
sum(0,0):-!.
sum(N,X):-N1 is N div 10,sum(N1,X1),X is X1+N mod 10.

%Задание 8 Найти сумму цифр числа с помощью рекурсии вниз.
sum1(N,X):-sum1(N,0,X).
sum1(0,X,X):-!.
sum1(A,Sum,X):-Am is A mod 10,Ad is A div 10,S is Sum+Am,sum1(Ad,S,X).

% Задание 9 Реализовать предикат с помощью рекурсии вверх. Вариант 1
% Найти произведение цифр числа.
pr(0,X):-X is 1,!.
pr(N,X):-N1 is N div 10,pr(N1,X1),X is X1*(N mod 10).

% Задание 10 Реализовать предикат с помощью рекурсии вниз. Вариант 1
% Найти произведение цифр числа.
p(N,X):-p(N,1,X).
p(0,X,X):-!.
p(A,Sum,X):-Am is A mod 10,Ad is A div 10,S is Sum*Am,p(Ad,S,X).

% Задание 11 Выполнить указанную задачу с помощью рекурсии вверх и
% рекурсии вниз, для каждой реализации отдельный коммит. Вариант № 1
% Найти количество нечетных цифр числа, больших 3

del2(X,Y):-X1 is X mod 10 mod 2,X1 \= 0, Y is 1.
del2(_,Y):-Y is 0,!.

kolvo_up(0,0):-!.
kolvo_up(N,X):-N1 is N div 10, kolvo_up(N1,X1), del2(N,Y), X is X1+Y,!.

kolvo_down(N,X):-kolvo_down(N,0,X).
kolvo_down(0,X,X):-!.
kolvo_down(A,S,X):- Ad is A div 10,del2(A,Y),S1 is S+Y, kolvo_down(Ad,S1,X),!.

% Задание 12. Найти НОД двух чисел. +
nod(A,0,A):-!.
nod(A,B,Nod):-A>B, R is A mod B, nod(B,R,Nod),!.
nod(A,B,Nod):-A=<B,R is B mod A, nod(A,R,Nod),!.

%Проверить число на простоту
prost(N,X):- N mod X =:= 0,!.
prost(N,X):- X*X=<N,X1 is X+1,prost(N,X1).

prost(1):-!.
prost(N):-not(prost(N,2)).

%Найти количество делителей числа
kol_del(_,0,0):-!.
kol_del(N,I,X):-N mod I =:= 0,I1 is I-1, kol_del(N,I1,X1), X is X1+1; N mod I=\= 0, I1 is I -1, kol_del(N,I1,X1), X is X1.
kol_del(N,X):-kol_del(N,N,X),!.

%Задание 14.1 Найти сумму простых делителей числа с помощью рекурсии вниз
sum_pr_down(_,0,0):-!.
sum_pr_down(N,I,Sum):-N mod I =:=0,prost(I),I1 is I-1,sum_pr_down(N,I1,Sum1),Sum is Sum1+I;I1 is I-1,sum_pr_down(N,I1,Sum1), Sum is Sum1.
sum_pr_down(N,X):-sum_pr_down(N,N,X),!.

%Задание 15 Вариант № 1
%Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа.
pr_del(_,0,1):-!.
pr_del(N,X):-pr_del(N,N,X),!.
pr_del(N,I,Pr):- sum(N,X3),(N mod I =:=0,sum(I,X1),X1<X3->I1 is I-1,pr_del(N,I1,Pr1),Pr is Pr1*I;I1 is I-1,pr_del(N,I1,Pr1), Pr is Pr1).
