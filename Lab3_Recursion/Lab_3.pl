%������� 1 ����������� �������� max(X,Y,Z), ��� Z ������������ �� ����� X � Y.
max(X,Y,X):-X>Y,!.
max(_,Y,Y).
% ������� 2 ����������� �������� max(X,Y,U,Z), ��� Z ������������ ��
% ����� X � Y.
max(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).
