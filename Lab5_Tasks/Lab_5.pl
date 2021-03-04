%Задание 1

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

%Задание 2
pr_friends:-Friends=[_,_,_],
    in_list(Friends,[belokurov,_]),
    in_list(Friends,[rizhov,_]),
    in_list(Friends,[chernov,_]),
    in_list(Friends,[_,white]),
    in_list(Friends,[_,black]),
    in_list(Friends,[_,red]),
    not(in_list(Friends,[belokurov,white])),
    not(in_list(Friends,[belokurov,black])),
    not(in_list(Friends,[rizhov,red])),
    not(in_list(Friends,[chernov,black])),
     write(Friends),!.

%Задание 3. 
%вторая позиция туфли, третья платье
pr_girl:-Girls=[_,_,_],
    in_list(Girls,[anya,_,_]),
    in_list(Girls,[valya,_,_]),
    in_list(Girls,[_,white,_]),
    in_list(Girls,[_,green,_]),
    in_list(Girls,[_,blue,_]),
    in_list(Girls,[_,_,white]),
    in_list(Girls,[_,_,green]),
    in_list(Girls,[_,_,blue]),
    in_list(Girls,[natasha,green,_]),
    (
        not(in_list(Girls,[valya,_,white])),
        not(in_list(Girls,[valya,white,_])),
        in_list(Girls,[anya,blue,blue]);
        in_list(Girls,[anya, white,white])),
write(Girls),!.

%Задание 4.[фамилия,должность,братья\сестры,возраст]

pr_work:-Worker=[_,_,_],
    in_list(Worker,[ivanov,_,_,_]),
    in_list(Worker,[semenov,_,_,_]),
    in_list(Worker,[_,tokar,_,_]),
    in_list(Worker,[_,svarshik,_,_]),
    in_list(Worker,[_,_,_,2]),
    in_list(Worker,[_,_,_,3]),
    in_list(Worker,[_,slesar,[],1]),
    in_list(Worker,[borisov,_,[sister],_]),
    in_list(Worker,[semenov,_,_,N1]),
    in_list(Worker,[_,tokar,_,N2]),N1>N2,
write(Worker),!.

%Задание 5. 
pr_zizha:-Zizha=[_,_,_,_],
    in_list(Zizha,[_,butilka]),
    in_list(Zizha,[_,stakan]),
    in_list(Zizha,[_,kuvshin]),
    in_list(Zizha,[_,banka]),

    in_list(Zizha,[milk,_]),
    in_list(Zizha,[limonad,_]),
    in_list(Zizha,[kvas,_]),
    in_list(Zizha,[water,_]),

    not(in_list(Zizha,[water,bottle])),
    not(in_list(Zizha,[milk,bottle])),
    not(in_list(Zizha,[limonad,banka])),
    not(in_list(Zizha,[water,banka])),
    %сосуд с лимонадом находится между кувшином  и сосудом с квасом
    next_to([limonad,_],[_,kuvshin],Zizha),
    next_to([limonad,_],[kvas,_],Zizha),
    next_to([_,stakan],[milk,_],Zizha),
    next_to([_,stakan],[_,banka],Zizha),
   write(Zizha),!.

