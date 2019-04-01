%:-module(practica1_MelladoClimentRafael,_,[]).
%About students.
alumno_prode(mellado,climent,rafael,y16m032).
alumno_prode(mellado,climent,rafael,y16m032).
alumno_prode(vazquez,acevedo,jorge,y16m032).

0.
nat(0).

nat(s(N)):-nat(N).



igualdad(0,0).
igualdad(s(N),s(M)):-igualdad(A,B).

mayorOigual(X,0).
mayorOigual(s(A),s(B)):- mayorOigual(A,B).

%La función suma NO y repito no te calcula la suma te verifica que el primer operando más el
%segundo operand se igual al tercer operando, nos será útil en el futuro

suma(0,X,X):-nat(X).
suma(s(X),Y,s(Z)):-suma(X,Y,Z).

%Se lee igual que la suma el primero menos el segundo es igual al tercero ?
resta(A,0, A).				% a - 0 = a
resta(A, s(B), C) :- 				% If a - b = (c + 1) then a - (b + 1) = c
resta(A, B, s(C)).	



color(r).
color(v).
color(a).
color(am).
%Para que no podamos tener que sea cualquier color tenemos que definir la función es miembro
%Funciona de una manera parecida a Haskell, tienes un caso base sobre el que luego se le aplica
%recursión.

es_miembro(X,[X|Xs]).
es_miembro(X,[Y|Ys]):-es_miembro(X,Ys).



%Me defino lo que es una pieza, estas están compuestas por cuatro elementos
%definidos en este orden
pieza(X,Y,Z,G):-nat(X),nat(Y),nat(Z),color(G).


%Definimos ahora el mayor o igual para piezas (anchura y altura mayores o iguales)
%OJO va de arriba a abajo es decir, miro si la pieza 2 es mayor que la uno
esPiezas_orden(pieza(Anchura1,_,Profundidad1,_),pieza(Anchura2,_,Profundidad2,_)):-
	mayorOigual(Anchura2,Anchura1), mayorOigual(Profundidad2,Profundidad1).

%Sumar dos alturas de las piezas y comprobamos que sea igual a Z
sumaAlturas(pieza(_,Altura1,_,_),pieza(_,Altura2,_,_),Z):-suma(Altura1,Altura2,Z).

%Para es Torre necesito saber el caso base que es el de dos piezas, es decir, un lista con solo un
%elemento. En este caso se va al último elemento y compara con el penúltimo, y después si todo va
%va ascendiendo, es decir compara el penúltimo con el antepenúltimo.
esTorre([Y]):-esPiezas_orden(pieza(0,0,0,a),Y).
esTorre([X|[Y|Ys]]):-esPiezas_orden(X,Y),esTorre([Y|Ys]).

%Lo primero que hace es verifica si la lista es una torre, y después mira si la altura es la pasada
%o te la calcula, si es que lo dejas como Variable.

alturaTorre([X],A):-sumaAlturas(X,pieza(0,0,0,a),A).
%alturaTorre([X|[Y|Ys]],A):-sumaAlturas(X,Y,B),suma(B,alturaTorre()).


%Para coloresTorre([],[]), utilizamos la función es miembro
%Falla si le pasas un lista con más colores de los que tenga la torre.
colorsTorre([pieza(_,_,_,Color1)],[C|Cs]):-es_miembro(Color1,[C|Cs]).
colorsTorre([pieza(_,_,_,Color2)|Ys],[C|Cs]):-es_miembro(Color2,[C|Cs]),colorsTorre(Ys,Cs).

coloresTorre(X,Y):-esTorre(X),colorsTorre(X,Y).
