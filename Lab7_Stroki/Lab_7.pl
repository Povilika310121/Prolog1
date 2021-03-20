%Задание 1 Дана строка. Вывести ее три раза через запятую и показать количество символов в ней.
pr(X):-read_str(List,X) , write_str(List), Z = ",", write(Z),  write_str(List), write(Z),  write_str(List).

%Задание2 Дана строка. Найти количество слов.
read_str1([H|T],N):-r_str1(H,T,N,0).
r_str1(_,[],I,N):-I is N+1,!.
r_str1(32,[H|T],I,N):-I1 is N+1, r_str1(H,T , I, I1),!.
r_str1(_,[H|T],I,N):-r_str1(H, T, I, N).