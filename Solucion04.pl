%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cree(gabriel,campanita).
cree(gabriel,magoDeOz).
cree(gabriel,cavenaghi).
cree(juan,conejoDePascua).
cree(macarena,reyesMagos).
cree(macarena,magoCapria).
cree(macarena,campanita).

suenio(gabriel,ganarLoteria([5,9])).
suenio(gabriel,serFutbolista(arsenal)).
suenio(juan,serCantante(100000)).
suenio(macarena,serCantante(10000)).
 
/* Indicar qué conceptos entraron en juego para cada punto.
En "Macarena no quiere ganar la loteria" aparece el principio de Universo Cerrado, que todo lo que no esta definido en
nuestra base de conocimientos se da como negado. Por lo tanto, no es necesario definir que maca no quiere ganar la loteria.
Usamos Predicados para relacionar a la persona con lo que cree. Tambien entra el concepto de functores que me permiten
relacionar un suenio con su caracteristica, por ejemplo serFutbolista con su equipo. Para lograr una mejor
expresividad en el ejercio. 
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Queremos saber si una persona es ambiciosa, esto ocurre cuando la suma de dificultades de los sueños es mayor a 20.

esPersona(Persona):- suenio(Persona,_).

esAmbiciosa(Persona):- esPersona(Persona),
 findall(Dificultad,dificultadDeCadaSuenio(Persona,Dificultad),Dificultades),
 sumlist(Dificultades,SumaDeDificultadesDeSuenios),
 SumaDeDificultadesDeSuenios > 20 . 

dificultadDeCadaSuenio(Persona,Dificultad):- suenio(Persona,Suenio), dificultadDeSuenio(Suenio,Dificultad).

dificultadDeSuenio(serCantante(Cantidad),Dificultad):- Cantidad>500000, Dificultad is 6.
dificultadDeSuenio(serCantante(Cantidad),Dificultad):- Cantidad=< 500000, Dificultad is 4.
dificultadDeSuenio(ganarLoteria(NumerosApostados),Dificultad):- 
  length(NumerosApostados,CantidadDeNumerosApostados), Dificultad is 10* CantidadDeNumerosApostados.
dificultadDeSuenio(serFutbolista(Equipo),Dificultad):- equipoChico(Equipo), Dificultad is 3.
dificultadDeSuenio(serFutbolista(Equipo),Dificultad):- not(equipoChico(Equipo)), Dificultad is 16.

equipoChico(arsenal).
equipoChico(aldosivi).

/* La dificultad de cada sueño se calcula como 6 para ser un cantante que vende más de 500.000 ó 4 en caso contrario
 ganar la lotería implica una dificultad de 10 * la cantidad de los números apostados lograr ser un futbolista tiene 
 una dificultad de 3 en equipo chico o 16 en caso contrario. Arsenal y Aldosivi son equipos chicos. */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*Queremos saber si un personaje tiene química con una persona. Esto se da
si la persona cree en el personaje y...
para Campanita, la persona debe tener al menos un sueño de dificultad menor a 5.
para el resto, 
todos los sueños deben ser puros (ser futbolista o cantante de menos de 200.000 discos)
y la persona no debe ser ambiciosa
*/

tieneQuimica(Personaje,Persona):- cree(Persona,Personaje), cumple(Persona,Personaje).

cumple(Persona,campanita):- dificultadDeCadaSuenio(Persona,Dificultad), Dificultad < 5.
cumple(Persona,_) :- suenio(Persona,Suenio), forall(suenio(Persona,Suenio),serPuro(Suenio)), not(esAmbiciosa(Persona)).

serPuro(serFutbolista(_)).
serPuro(serCantante(CantidadDeDiscos)):- CantidadDeDiscos < 200000. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% KATA 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gusto(ddl).
gusto(granizado).
gusto(chocoConDdl).
gusto(lemonPie).
gusto(cookies).
gusto(kinder).
gusto(frambuesa).
gusto(maracuya).
gusto(nutella).
gusto(chocolate).
gusto(ddlEspecial).

preparadosPorLaChef(maracuya). 
preparadosPorLaChef(nutella).
preparadosPorLaChef(chocolate).
preparadosPorLaChef(ddlEspecial).

seVendeMucho(ddl,verano).
seVendeMucho(maracuya,verano).
seVendeMucho(chocoConDdl,verano).
seVendeMucho(lemonPie,invierno).
seVendeMucho(cookies,invierno).



/*
1)Los gustos más ricos, que son aquellos que se venden mucho en verano o los que son preparados por la chef.
Los gustos más flojitos, que son aquellos que se venden mucho en invierno.
Dado un gusto específico, quiero saber si lo vende la heladería.
Para pensar: cómo se modela para los gustos que no se venden?

Aclaraciones: Un gusto solo se puede vender mucho en una temporada, por ej, el dulce de leche granizado
 se vende mucho en verano, por lo tanto no se puede vender mucho en ninguna otra temporada.
*/

gustosMasRicos(Gusto):- seVendeMucho(Gusto,verano).
gustosMasRicos(Gusto):- preparadosPorLaChef(Gusto).

gustosMasFlojitos(Gusto):-seVendeMucho(Gusto,invierno).

esVendidoXHeladeria(Gusto):- gusto(Gusto).

%Los gustos que no se venden mucho no es necesario modelarlos ya que no estan definidos en el alcance de nuestra
%base de conocimiento debido al Principio de Universo Cerrado de Prolog, por lo que lo damos por negado y
%falso a todo lo que no esta definido.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% KATA 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%diasDeReparto(cadete,[día])
diasDeReparto(cadete1,[lunes,jueves, sabados]).
diasDeReparto(cadete2,[lunes,martes,viernes]).
diasDeReparto(belen,[sabado,domingo]).

%pedido(detalle(cadete, proveedor, cliente, monto, zona))
pedido(detalle(cadete1,supermercado,rodolfo,250,caba)).
pedido(detalle(cadete1,supermercado,pedro,560,quilmes)).
pedido(detalle(cadete2,kioscoDeMaxi, agus, 300, caba)).
pedido(detalle(cadete3,napaRui, gonzalo, 650,sanIsidro)).
pedido(detalle(nitroKDT,supermercado, sandra, 1000, olivos)).
pedido(detalle(nitroKDT,libreria, micaela, 600, villaMartelli)).

pedido(detalle(beluli,akomer,agustin,300,caballito)).

%Qué cadetes reparten los lunes.

reparteLosLunes(Cadete):- diasDeReparto(Cadete,Dias), member(lunes,Dias).

% Si un pedido esta zarpado y es de supermercado, decimos que es una compraSemanal. Se sabe que un pedido
% es zarpado, si el monto supera los 500 pesos.

esCompraSemanal(Pedido):- esPedido(Pedido),esZarpado(Pedido), esDeSupermercado(Pedido).

esZarpado(detalle(_,_,_,Monto,_)):- Monto > 500.
esDeSupermercado(detalle(_,supermercado,_,_,_)).

esPedido(Pedido):- pedido(Pedido).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% KATA 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%persona(Persona)
persona(clara).
persona(daiu).
persona(juan).
persona(alexis).
persona(nico).

%leyo(Persona,Material)
leyo(nico,saga(dune,14)).
leyo(daiu,paper([hamilton,zeldin],"The relationship between design and verification")).
leyo(juan, saga(elSeniorDeLosAnillos,3)).
leyo(daiu,libro(elAleph,paidos,146)).
leyo(clara, paper([batygin, brown], "Evidence for a Distant Giant Planet in the Solar System")).
leyo(nico,libro(rebelionEnLaGranja,deBolsillo,144)).
leyo(nico,paper([brooks],"No Silver Bullet: Essence and Accidents of Software Engineering")).
leyo(clara,libro(rayuela,alfaguara,600)).
leyo(clara,saga(harryPotter,7)).
leyo(juan,libro(cosmos,planeta,362)).
leyo(daiu,saga(fundacion,7)).

%quiere(Persona,Material)
quiere(clara,saga(cancionDeHieloYFuego,5)).
quiere(clara,libro(elAleph,paidos,146)).
quiere(daiu,libro(readyPlayerOne,edicionesB,480)).
quiere(juan,saga(dune,14)).
quiere(nico,libro(elAleph,paidos,146)).
quiere(alexis,libro(designPatterns,addisonWesleyProfessional,395)).
quiere(daiu,paper([brooks],"No Silver Bullet: Essence and Accidents of Software Engineering")).

%tiene(Persona,Material)
tiene(clara,saga(cancionDeHieloYFuego,5)).
tiene(clara,libro(elAleph,paidos,146)).
tiene(juan,saga(dune,14)).
tiene(nico,libro(elAleph,paidos,146)).
tiene(alexis,libro(designPatterns,addisonWesleyProfessional,395)).
tiene(daiu,saga(fundacion,7)).

%Quién es feliz, esto se da cuando una persona tiene todo el material que quiere.

esFeliz(Persona):-persona(Persona), forall(tiene(Persona,Material),quiere(Persona,Material)).


/*
Y si una persona lee mucho, esto se da cuando lee al menos 3 materiales densos:

Un libro es denso si tiene al menos 200 páginas o si es de editorial Paidos.

Por otro lado un paper es denso si fue escrito por más de un autor.

Y por último, una saga es densa si tiene más de cuatro libros.
*/

leeMucho(Persona):- findall(Material,(leyo(Persona,Material),esDenso(Material)),Materiales), 
length(Materiales,CantidadDeMateriales),
CantidadDeMateriales>=3.


esDenso(libro(_,_,Paginas)):- Paginas >= 200. 
esDenso(libro(_,paidos,_)).
esDenso(paper(Autores,_)):- length(Autores,CantidadDeAutores), CantidadDeAutores>1. 
esDenso(saga(_,CantidadDeLibros)):- CantidadDeLibros>4.


:- begin_tests(lecturalia).
        % Tests
        test(felicesLos4, set( Quienes = [clara, juan , nico, alexis])):-
            esFeliz(Quienes).
        test(daiuNoEstafeliz, nondet):-
            not(esFeliz(daiu)).
        test(leenMucho,set(Quienes = [clara, daiu])):-
            leeMucho(Quienes).
        test(juanNoLeeMucho, nondet):-
            not(leeMucho(juan)).  
        test(nicoTampocoLeeMucho, nondet):-
            not(leeMucho(nico)).
        test(alexisTampoco, nondet):-
            not(leeMucho(alexis)).
:- end_tests(lecturalia)






















/*
leeMucho(Persona):- leyo(Persona,Libro), denso(Libro).

denso(libro(_,_,Paginas):- Paginas >= 200.
denso(libro(_,Editorial,_):- Editorial is paidos.
denso(paper(Autores,_)):- length(Autores,Cantidad) , Cantidad >= 1.
denso(saga(_,Libros)):- Libros > 4.
*/









/*
amarA(agustin,belen).
amarA(agustin,papaDeKukito).
amarA(papaDeKukito,belen).
amarA(papaDeKukito,agustin).
amarA(keke,belen).
amarA(keke,agustin).
amarA(agustin,belen).
amarA(liliana,belen).
amarA(liliana,camila).
amarA(milo,belen).
amarA(milo,agustin).
amarA(agustin,milo).
amarA(belen,milo).
amarA(belen,agustin).
amarA(papaDeKukito,keke).
amarA(keke,papaDeKukito).



:- encoding(utf8).

% haceFavor/4 relaciona
% una persona A
% otra persona B
% el favor que le hace
% con el grado de alegría que le provoca por el favor que le hace
% 
% la relación no es bidireccional, el favor es siempre de la persona A a la B
haceFavor(julia, pablo, "retirarle los analisis", 3).
haceFavor(julia, pablo, "llevar el auto al mecanico", 8).
haceFavor(julia, candela, "llevar a sus amigas al shopping", 2).
haceFavor(julia, laura, "llevar a Chiara a danza", 7).
haceFavor(julia, chiara, "llevar a Chiara a danza", 4).
haceFavor(pablo, candela, "comprar poster de BTS", 7).
haceFavor(candela, constanza, "darle de comer a la perra", 1).
haceFavor(candela, sofia, "pasarle el punto 2 de la tarea", 3).
haceFavor(candela, sofia, "pasarle el punto 3 de la tarea", 5).
haceFavor(sofia, adriana, "cuidar a sus hermanos", 6).
haceFavor(adriana, laura, "retirar papel del colegio", 4).
haceFavor(laura, candela, "invitar a Candela a dormir", 2).
haceFavor(laura, julia, "invitar a Candela a dormir", 9).

alegria(PersonaA,PersonaB,GradoAlegria):- haceFavor(PersonaA,PersonaB,_,GradoAlegria).
alegria(PersonaA,PersonaB,GradosTotales):- 
  haceFavor(PersonaA,PersonaC,_,GradoIntermedio), PersonaA\=PersonaC,PersonaC\=PersonaB,
  alegria(PersonaC,PersonaB,GradoFinal),
  GradosTotales is GradoIntermedio+ GradoFinal.
  

%alegria(julia,candela,Cantidad).  
%La recursividad de la regla alegria se define en si misma varias veces, pero en esta consulta la 
% cantidad se repite y se hace un bucle infinito. Por lo tanto se reflejan relaciones 
% a n niveles de profundidad.

:-begin_tests(cadena_favores).
    test(alegria_por_favor_directo,nondet):- alegria(candela,constanza,1).
    test(alegria_por_favor_directo_multiples_soluciones,set(Alegria=[3,5])):- alegria(candela,sofia,Alegria).
    test(alegria_por_favor_recursivo,set(Alegria=[7,23,25,28,30,15,17])):- alegria(julia,laura,Alegria).
:-end_tests(cadena_favores).


*/














