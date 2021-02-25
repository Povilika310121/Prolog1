%������� 1 ����������� �������� max(X,Y,Z), ��� Z ������������ �� ����� X � Y.
max(X,Y,X):-X>Y,!.
max(_,Y,Y).
% ������� 2 ����������� �������� max(X,Y,U,Z), ��� Z ������������ ��
% ����� X � Y.
max(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).
% ������� 3 ����������� �������� fact(N,X), ��� X � ��� ��������� �������
% ��������� � ������� �������� �����.
fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.
