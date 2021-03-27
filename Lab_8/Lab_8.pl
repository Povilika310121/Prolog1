read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
read_str(A,N,Flag),append(Cur_list,[A],C_l),
append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

%__1_1__
pr8_1:- see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.tx'),read_list_str(List, Lenght),seen,max(Lenght, Max), write(Max).

%__1_2__
pr8_2:- see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.tx'),read_list_str(List,_), seen, space(List, 0, Kolvo),write(Kolvo).
space([],K,K):-!.
space([H|T], K, Kolvo):-not(in_list(H,32)),K1 is K+1, space(T, K1, Kolvo),!.
space([_|T], K, Kolvo):-space(T, K, Kolvo),!.

%__1_3__
pr8_3:- see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_list_str(List,N),seen,all_symbol(N,0,K),write("Number of all symbols  "),write(K), nl,symbols(List,0,Kol),write("Number of symbols A-a  "),write(Kol),nl, Sr is K div Kol,write(Sr), nl, vyvedi(List,Sr).
all_symbol([],K, K):-!.
all_symbol([H|T], Kolvo, K):-Kolvo1 is Kolvo +H, all_symbol(T, Kolvo1, K).
symbols([],K, K):-!.
symbols([H|T], Kol, Kolvo):-symbols_a(H,0,K),Kol1 is Kol+K,symbols(T, Kol1, Kolvo),!.
symbols_a([],K, K):-!.
symbols_a([H|T], K, Kolvo):-(H==97,K1 is K+1,symbols_a(T, K1, Kolvo));(H==65,K1 is K+1,symbols_a(T, K1, Kolvo));(symbols_a(T, K, Kolvo)).
vyvedi([],_):-!.
vyvedi([H|T], Sr):-(symbols_a(H,0,K),K>Sr-> write_str(H),vyvedi(T, Sr);vyvedi(T, Sr)).

%__1_4__
pr8_4:-see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_str(A,_,1),seen,append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]),often_word_in_list(LW,_,Word,0,_),write_str(Word).

list_words(A,LW):-append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append([W],LW,LW1),list_words(T,LW1,LWN,[]);
append1([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,often_word_in_list(T,W1,Word,K1,Kol1);often_word_in_list(T,W,Word,K,Kol)).

%__2_1__
pr8_2_1:-see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_str(List, _, _),seen, russian(List,0,K), write(K).
russian([],K, K):-!.
russian([H|T], Kolvo, K):-((H>1039, H<1104)->Kolvo1 is Kolvo +1, russian(T, Kolvo1, K); russian(T, Kolvo, K)).

%__2_9__
pr8_2_9:-see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_str(List,N,1),reverse(List,B),N1 is N div 2, palindrom(List, B, N1),seen.

palindrom([_|_],[_|_],0):-!.
palindrom([H1|T1],[H2|T2], I):-H1=H2,I1 is I-1, palindrom(T1,T2, I1),!.
palindrom([_|_],[_|_],_):-fail,!.

%__2_18__
pr8_2_18:- see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_list_str(List,N),seen, dat(List,N).
dat([],[]):-!.
dat([H|T],[H1|T1]):-(H1>9->data(H, H1), dat(T,T1); dat(T, T1)).
data([],_):-!.
data(_, L):-L<10,!.
data([H1, H2, H3, H4, H5, H6, H7, H8, H9, H10|T], L):-(H1>47, H1<52, H2>47,H2<58, H3==46, H4>47,H4<50, H5>47,H5<58, H6==46, H7>47, H7<58, H8>47, H8<58,H9>47,H9<58, H10>47, H10<58-> put(H1), put(H2), put(H3), put(H4), put(H5), put(H6), put(H7), put(H8), put(H9), put(H10),nl,L1 is L-10, data(T, L1); L1 is L - 1,data([H2, H3, H4, H5, H6, H7, H8, H9, H10|T], L-1)).
%__3__
pr3_:-see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_str(List,_,1),seen,append(List,[32],A1),date_time(A1).

date_time([]):-!.
date_time([32|Tail]):-date_time(Tail),!.
date_time([Head|Tail]):-(day([Head|Tail],[],Day,After_Day)->(month(After_Day,[],Month,After_Month)->(year(After_Month,[],Year,After_Year)->
write_str(Day),write(" "),write_str(Month),write(" "),write_str(Year),nl,date_time(After_Year);date_time(After_Month)); date_time(After_Day));date_time(Tail)).

day([32|Tail],Day,Day,Tail):-!.
day([Head|Tail],I,Day,After_Day):-Head >=48,Head =<57,append(I,[Head],I1),day(Tail,I1,Day,After_Day),!.
day([_|_],_,_,_):-!,false.

month([32|Tail],Month,Month,Tail):-!.
month([Head|Tail],I,Month,After_Month):-Head >=97,Head =<122,append(I,[Head],I1),month(Tail,I1,Month,After_Month),!.
month([_|_],_,_,_):-!,false.

year([32|Tail],Year,Year,Tail):-!.
year([Head|Tail],I,Year,After_Year):-Head >=48,Head =<57,append(I,[Head],I1),year(Tail,I1,Year,After_Year),!.
year([_|_],_,_,_):-!,false.

%__4_18__
pr4_18:-see('c:/Users/Виктория/Documents/GitHub/Prolog1/Lab_8/labb.txt'),read_str(List,_,1),seen, list_numbers(List, Chisla),append1(Chisla,[[100]], Ch),kolvo(Ch,0,0,_).

list_numbers(A,LW):-append1([32],A,A1),reverse(A1,List),list_numbers(List,[],LW,[]).
list_numbers([],LW,LW,_):-!.
list_numbers([H|T],LW,LWN,W):-((H=32;(H>=58;H=<47))-> append([W],LW,LW1),list_numbers(T,LW1,LWN,[]);(H<58,H>47->append1([H],W,W1),list_numbers(T,LW,LWN,W1))).

kolvo([[100]],_,_,I):-write(I),!.
kolvo([H|T],Chislo,K,_):-kol(H,0,K1), (K1>=Chislo-> Chislo1 is K1, kolvo(T,Chislo1, K1, K1); kolvo(T,Chislo,K, K)).
kol([],K,K):-!.
kol([],_,_):-!.
kol([_|T],Kolvo,K):-Kolvo1 is Kolvo+1,kol(T, Kolvo1, K).






