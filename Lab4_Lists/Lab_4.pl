%Задание 1 Реализовать предикат чтения списка с клавиатуры и предикат вывода списка на экран.
read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).

write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list(Tail).

%Задание 2 Реализовать предикат sum_list_down(+List, ?Summ), который проверяет, является ли Summ суммой элементов списка или записывает в эту переменную сумму элементов.
%Для построения воспользоваться рекурсией вниз. Реализовать программу, читающую список, считающую сумму элементов и выводящую сумму на экран, с использованием 
%предикатов из задания 1 и построенного предиката sum_list_down /2.
sum_lis_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([Head|Tail],S,Sum):-S1 is S+Head,sum_list_down(Tail,S1,Sum).

%Задание 3 Построить предикат sum_list_up(+List, ?Summ), который проверяет, является ли Summ суммой элементов списка или записывает в
%эту переменную сумму элементов. Для построения воспользоваться рекурсией вверх.
sum_list_up([],0):-!.
sum_list_up([H|T],Sum):-sum_list_up(T,Sum1),Sum is Sum1+H.

%Задание 4 Построить предикат, list_el_numb(+List, ?Elem, ?Number). Если задано значение Elem, то предикат записывает в Number номер первого
%вхождения Elem. Если задано значение Number, то предикат записывает в Elem значение, находящееся в списке под номером Number. Если заданы
%оба значения, то предикат проверяет, находится ли элемент Elem в списке под номером Numb.
list_el_number(List,Elem,Number):-list_el_number(List,Elem,0,Number).
list_el_number([H|_],H,Number,Number):-!.%для перебора урать "!"
list_el_number([_|T],Elem,I,Number):-I1 is I+1,list_el_number(T,Elem,I1,Number).
