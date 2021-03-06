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

%Задание 4.1 Реализовать программу, которая читает список, читает элемент и находит номер первого вхождения элемента в список. В случае, если
%элемент отсутствует, пользователю выводится соответствующее сообщение. Воспользоваться предикатами из заданий 1 и 3
pr4_4:-write("kolvo is "),read(N), nl,read_list(N,List),write("elem is "),nl,read(Elem),list_el_number(List,Elem,Number),write(Number),!.
pr4_4:-write("No matches!").

%Задание 5 Реализовать программу, которая читает список, читает номер элемента и находит соответствующий элемент. В случае, если номер
%некорректный, пользователю выводится соответствующее сообщение.
pr4_5:-write("kolvo is "),read(N),nl,read_list(N,List),write("nom is "),nl,read(Number),list_el_number(List,Elem,Number),write(Elem),!.
pr4_5:-write("No matches!").

%Задание 6 Реализовать предикат min_list_up(+List, ?Min), который записывает минимальный элемент списка List в переменную Min или
%проверяет, является ли значение в переменной Min минимальным элементом в списке List. Реализацию провести рекурсией вверх.
min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),(H<Min1->Min=H; Min=Min1).

%Задание 7 Реализовать предикат min_list_down(+List, ?Min), который записывает минимальный элемент списка List в переменную Min или
%проверяет, является ли значение в переменной Min минимальным элементом в списке List. Реализацию провести рекурсией вниз.
min_list_down([H|T],Min):-min_list_down(T,H,Min).
min_list_down([],Min,Min):-!.
min_list_down([H|T],Temp,Min):-H<Temp,min_list_down(T,H,Min),!.
min_list_down([_|T],Temp,Min):-min_list_down(T,Temp,Min).

%Задание 8 Реализовать программу, которая читает список, находит и выводит на экран его минимальный элемент. Воспользоваться предикатами из заданий 1, 6 или 7.
pr8_4:-write("kolvo is "),read(N), nl,read_list(N,List),min_list_up(List,Min),write("Min="),write(Min).

%Задание 9 Построить предикат, который возвращает true, если элемент есть в списке.
find_el([El|_],El):-!.
find_el([_|T], El):-find_el(T, El).

%Задание 10 Построить предикат, который переворачивает список.
mirror(List,List1):-mirror(List,[],List1).
mirror([],List1,List1).
mirror([H|List],Temp,List1):-mirror(List,[H|Temp],List1).

%Задание 11 Построить предикат p(Sublist,List), который возвращает true, если элементы Sublist встречается в List в том же порядке.
p([],_):-!.
p([Head|Tail],[HeadList|TailList]):-(Head is HeadList -> p(Tail,TailList);p([Head|Tail],TailList)).

%Задание 12 Построить предикат, который удаляет элемент с заданным номером из списка.
del(0,[_|Z], Z):-!.
del(X,[H|Y],[H|Z]):-X1 is X-1,del(X1,Y,Z).

%Задание 13 Построить предикат, который удаляет все элементы, равные данному.
del_elem([],_,[]).
del_elem([H|T],X,List):-(H=X->del_elem(T,X,List);List=[H|T1],del_elem(T,X,T1)).

%Задание 14 Построить предикат, который проверяет, встречаются ли все элементы в списке ровно 1 раз.
chek(_,[]):-!.
chek([H|T]):-chek(H,T),chek(T).
chek(X,[H|T]):- X\= H,chek(X,T).
chek([]):-!.

%Задание 15 Построить предикат, который строит новый список,составленный из уникальных элементов введенного.
unik([],[]):-!.
unik([H|T],T1):-find_el(T,H),unik(T,T1),!.
unik([H|T],[H|T1]):-unik(T,T1),!.

%Задание 16 Построить предикат, который получает для данного элемента количество раз, которое он встречается в списке.
count(List,El,Kolvo):-count(List,El,0,Kolvo).
count([],_,Kolvo,Kolvo):-!.
count([H|T],El,Num,Kolvo):-(H=:=El->Num1 is Num+1;Num1 is Num),count(T,El,Num1,Kolvo).

%Задание 17 Построить предикат, получающий длину списка.
leng([],0):-!.
leng([H|T],X):-leng(T,X1),X is X1+1.

%18.2 Индекс минимального элемента
min_index(List,Index):- min_list_down(List,Elem),list_el_number(List,Elem,Index),!.

%18.15 Локальный минимум
local_min([H1|[H2|_]],0):-H1<H2,!.
local_min([H1|[H2]],1):-H2<H1,!.
local_min([H1|[H2|[H3|_]]],1):-H2<H1,H2<H3,!.
local_min([_|T],I):-N is I-1,local_min(T,N).

%18.43 Количество минимальных элементов
kol_min(List,X):- min_list_down(List,Elem),count(List,Elem,X).

%18.1
pr1_1(List,Res):-find_max_elem(List,Max),last_max(List,Max,I),leng(List,N),Res is N-I,!.
find_max_elem([H|T],Max):-find_max_elem([H|T],H,Max).
find_max_elem([],Max,Max):-!.
find_max_elem([H|T],A,Max):-H > A,A1 is H,find_max_elem(T,A1,Max).
find_max_elem([H|T],A,Max):-H=<A,find_max_elem(T,A,Max).

last_max(List,Max,I):-last_max(List,0,_,Max,I).
last_max([],_,Max,_,Max):-!.
last_max([H|T],A,A2,Max,I):-A1 is A+1,(Max =:= H ->A3 is A1,last_max(T,A1,A3,Max,I);last_max(T,A1,A2,Max,I)).

%18.37
less_left(List):-less_left(List,0,0).
less_left([H1|[H2]],Count,Kolvo):-(H2<H1->(Count1 is Count+1,write(Count1),nl,Kolvo1 is Kolvo + 1),write("Kolvo = "),write(Kolvo1);write("Kolvo ="),write(Kolvo)),!.
less_left([H1|[H2|T]],Count,Kolvo):-H2<H1,Count1 is Count+1,write(Count1),nl,Kolvo1 is Kolvo + 1,less_left([H2|T],Count1,Kolvo1),!.
less_left([H1|[H2|T]],Count,Kolvo):-H2>=H1,Count1 is Count+1,less_left([H2|T],Count1,Kolvo),!.

%18.28
pr1_28(List):-min_index(List,Index),find_max_elem(List,Max),last_max(List,Max,Place),cut(List,Index,Place,New),write_list(New),!.
cut(List,Index,Place,New):-Place1 is Place-1,cut(List,0,Index,Place1,New).
cut(_,Count,_,Count,_):-!.
cut(_,_,Index,Place,New):-Index+1 = Place,New = [],!.
cut([_|T],Count,Index,Place,New):-Count =< Index,Count1 is Count + 1,cut(T,Count1,Index,Place,New).
cut([H|T],Count,Index,Place,New):-Count > Index,Count < Place,Count1 is Count + 1,New = [H|A],cut(T,Count1,Index,Place,A).
