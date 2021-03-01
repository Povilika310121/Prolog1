%Задание 1 Дана строка. Вывести ее три раза через запятую и показать количество символов в ней.
pr(X):-read_str(List,X) , write_str(List), Z = ",", write(Z),  write_str(List), write(Z),  write_str(List).
