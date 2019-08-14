% TP Lógico
% Desarrollado por Agustin Tejera

% *********************************************************************
% PREDICADOS
% *********************************************************************

%            CANDIDATOS:
candidato(frank,rojo).
candidato(claire,rojo).
candidato(garrett,azul).
candidato(jackie,amarillo).
candidato(linda,azul).
candidato(catherine,rojo).
candidato(seth,amarillo).
candidato(heather,amarillo).

%            EDADES:
edad(frank,50).
edad(claire,52).
edad(garrett,64).
edad(peter,26).
edad(jackie,38).
edad(linda,30).
edad(catherine,59).

%            FECHA DE NACIMIENTO:
nacio(heather,1969).

%            POSTULACIONES:
postula(azul,buenosAires).
postula(azul,chaco).
postula(azul,tierraDelFuego).
postula(azul,sanLuis).
postula(azul,neuquen).

postula(rojo,buenosAires).
postula(rojo,santaFe).
postula(rojo,cordoba).
postula(rojo,chubut).
postula(rojo,tierraDelFuego).
postula(rojo,sanLuis).

postula(amarillo,chaco).
postula(amarillo,formosa).
postula(amarillo,tucuman).
postula(amarillo,salta).
postula(amarillo,santaCruz).
postula(amarillo,laPampa).
postula(amarillo,corrientes).
postula(amarillo,misiones).
postula(amarillo,buenosAires).

%            HABITANTES
cantidadDeHabitantes(buenosAires,15355000).
cantidadDeHabitantes(chaco,1143201).
cantidadDeHabitantes(tierraDelFuego,160720).
cantidadDeHabitantes(sanLuis,489255).
cantidadDeHabitantes(neuquen,637913).
cantidadDeHabitantes(santaFe,3397532).
cantidadDeHabitantes(cordoba,3567654).
cantidadDeHabitantes(chubut,577466).
cantidadDeHabitantes(formosa,527895).
cantidadDeHabitantes(tucuman,1687305).
cantidadDeHabitantes(salta,1333365).
cantidadDeHabitantes(santaCruz,273964).
cantidadDeHabitantes(laPampa,349299).
cantidadDeHabitantes(corrientes,992595).
cantidadDeHabitantes(misiones,1189446).

% En este punto no hace falta implementar testeo unitario, se pide que identifique
% donde aparece el Principio de Universo Cerrado y justifique su decision.
% Aparece el principio del Universo Cerrado en "Peter no es candidato del partido Amarillo",
% "El partido violeta no tiene candidatos" y "Finalmente no se presentara en Formosa"
% Que decido NO definirlos como hechos, porque todo lo que no este definido en mi base de 
% conocimiento se da como negado, por el principio del Universo Cerrado.

esPicante(Provincia):- masDeUnMillonDeCandidatos(Provincia), presentaCandidatos(Provincia).

masDeUnMillonDeCandidatos(Provincia):- cantidadDeHabitantes(Provincia,Habitantes), Habitantes > 1000000.

presentaCandidatos(Provincia):-
     postula(Partido1,Provincia),
     postula(Partido2,Provincia),
     candidato(_,Partido1),
     candidato(_,Partido2),
      Partido1 \= Partido2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%%

% intencionDeVotoEn(Provincia, Partido, Porcentaje)
intencionDeVotoEn(buenosAires, rojo, 20).
intencionDeVotoEn(buenosAires, azul, 40).
intencionDeVotoEn(buenosAires, amarillo, 40).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 41).
intencionDeVotoEn(santaFe, amarillo, 39).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

%El partido del ganador debe competir en la provincia. 
%Si el partido del perdedor también compite en la provincia, se evalúa el que tenga el mayor porcentaje 
%de votos en la provincia. Si hay empate, no se cumple la relación.

%Si ambos candidatos pertenecen al mismo partido, la relación se cumple si el partido compite en la provincia. 

leGanaA(Ganador,Perdedor,Provincia):- 
 persona(Ganador),
 persona(Perdedor), 
 compite(Ganador,Provincia),
 not(compite(Perdedor,Provincia)).

leGanaA(Ganador,Perdedor,Provincia):- 
 candidato(Ganador,Partido1), 
 candidato(Perdedor,Partido2),
 compite(Ganador,Provincia),
 compite(Perdedor,Provincia), 
 mayorPorcentaje(Partido1,Partido2,Provincia).

leGanaA(Ganador,Perdedor,Provincia):- 
    pertenecenAlMismoPartido(Ganador,Perdedor), 
    compite(Ganador,Provincia).

persona(Persona):- candidato(Persona,_).

compite(Candidato,Provincia):- candidato(Candidato,Partido), postula(Partido,Provincia).

pertenecenAlMismoPartido(Candidato1,Candidato2):- candidato(Candidato1,Partido), candidato(Candidato2,Partido).

mayorPorcentaje(Partido1,Partido2,Provincia):- 
    intencionDeVotoEn(Provincia,Partido1,Porcentaje1),
    intencionDeVotoEn(Provincia,Partido2,Porcentaje2),
    Porcentaje1 > Porcentaje2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se pide resolver partidoHegemonico/1. Un partido es hegemónico si es favorito en las provincias consideradas 
%importantes, que son Buenos Aires, Córdoba y Santa Fe. 

%Un partido es favorito en una provincia si todos los demás 
%partidos tienen menos o igual intención de voto que el partido ganador.

provinciaImportante(buenosAires). 
provinciaImportante(cordoba).
provinciaImportante(santaFe).

partidoHegemonico(Partido):- partido(Partido), forall(provinciaImportante(Provincia),esFavorito(Partido,Provincia)).

esFavorito(Partido,Provincia) :-
    partido(Partido),
    intencionDeVotoEn(Provincia,Partido,Voto1),
    forall((intencionDeVotoEn(Provincia,_,Voto2)),(Voto2=<Voto1)).

partido(Partido):- intencionDeVotoEn(_,Partido,_).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*Durante la campaña los candidatos hacen tres tipos de promesa:
1 que la inflación se mantenga en un determinado porcentaje anual
2 construir una lista de cosas
3 o aumentar una cantidad de puestos de trabajo
*/

promete(garrett, construir([escuela, hospital, universidad, ruta])).
promete(garrett, metaDeInflacion(18)).
promete(garrett, construir([casas, autopistas])).
promete(seth, metaDeInflacion(10)).
promete(claire, nuevosPuestosDeTrabajo(200000)).
promete(claire, nuevosPuestosDeTrabajo(520000)).
promete(claire, nuevosPuestosDeTrabajo(1000000)).
promete(claire, metaDeInflacion(4)).
promete(claire, metaDeInflacion(14)).
promete(frank, metaDeInflacion(3)).
promete(frank, metaDeInflacion(13)).
promete(frank, nuevosPuestosDeTrabajo(10000)).
promete(frank, construir([hospital, universidad])).
promete(frank, construir([plazas, autopistas, extensionSubte, repavimentacionTotal])).

serio(Persona):-
  promete(Persona,_), 
  findall(Promesa,esRealizable(Persona,Promesa),Promesas),length(Promesas,Cantidad),Cantidad>=3.

esRealizable(Persona,Promesa):- promete(Persona,Promesa), seHace(Persona,Promesa).

seHace(_,metaDeInflacion(Cantidad)):- Cantidad > 10.

seHace(_,construir(Lista)):- length(Lista,Cantidad),Cantidad<3,not(member(universidad,Lista)).

seHace(Persona,nuevosPuestosDeTrabajo(Puestos)):- edad(Persona,Edad), Puestos =< Edad * 10000. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       PUNTO 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1)es amigo de otro candidato de otro partido
% 2) o bien es amigo de otro candidato del mismo partido, que es panquequeable

panquequeable(Candidato):-
     amigo(Candidato,CandidatoAmigo),partidosDistintos(Candidato,CandidatoAmigo).
panquequeable(Candidato):-
     amigo(Candidato,OtroAmigo), not(partidosDistintos(Candidato,OtroAmigo)),panquequeable(OtroAmigo).  

partidosDistintos(Candidato,CandidatoAmigo):-
     candidato(Candidato,Partido), candidato(CandidatoAmigo,Partido2), Partido\= Partido2.


% el primero es amigo del segundo pero no al revés
amigo(frank, claire).
amigo(claire, catherine).
amigo(catherine, jackie).
amigo(jackie, garrett).
amigo(jackie, heather).
amigo(seth, heather).



% *********************************************************************
% TEST     PUNTO_2) 
% *********************************************************************

:-begin_tests(picantes).

%agrego el nondet para evitar el mensaje de advertencia
test(provincia_picante_supera_el_millon_de_habitantes_y_mas_de_dos_partidos,nondet):- 
    esPicante(buenosAires).
test(provincia_no_picante_por_un_partido_solo,fail):-
    esPicante(santaFe).

:-end_tests(picantes).


% *********************************************************************
% TEST    PUNTO_3) 
% *********************************************************************

:-begin_tests(ganadores).
test(candidato1_le_gana_a_candidato2_en_provincia,nondet):- leGanaA(frank, garrett, tierraDelFuego).
test(unico_candidato1_postulado_en_una_provincia,nondet):- leGanaA(frank, jackie, santaFe).
test(candidato_no_le_gana_a_candidato2_porque_no_se_presenta_en_provincia,fail):- leGanaA(claire, jackie, misiones).
test(ambos_del_mismo_partido_compiten_en_misma_provincia,nondet):- leGanaA(frank, claire, tierraDelFuego).
test(ambos_candidatos_empatan_en_votos,fail):-leGanaA(heather, linda, buenosAires).

:-end_tests(ganadores).

% *********************************************************************
% TEST     PUNTO_4) 
% *********************************************************************

%Implemente los casos de prueba, ¿cuáles son los casos de equivalencia que surgen?
%Surgen dos clases, porque agrupo los que cumplen la condicion favorito, que lo hace hegemonico, y los que fallan.
% ¿Cómo podemos testear los que no son partidos hegemónicos, qué conceptos aparecen?
%Los testeamos con Fail que nos permite ver si una consulta es falsa, agrupando todos los que fallan.
:-begin_tests(hegemonico).
test(hegemonico_partidoFavorito_en_provinciasImportantes,nondet):- partidoHegemonico(azul).
test(no_hegemonico_si_tienen_mas_votos_los_demas_partidos,fail) :- partidoHegemonico(rojo). 
:-end_tests(hegemonico).


% *********************************************************************
% TEST     PUNTO_5) 
% *********************************************************************
:-begin_tests(promesas).

test(no_serio_se_cumplen_2,fail):- serio(garret).
test(no_serio_solo_cumple_una,fail):- serio(seth).
test(es_serio_cumple_3,nondet):- serio(claire).

:-end_tests(promesas).
% *********************************************************************
% TEST     PUNTO_6) 
% *********************************************************************

:-begin_tests(panquequeables).

test(amigos_panquequeables,set(Quienes=[catherine,frank,jackie,claire])):- panquequeable(Quienes).
test(amigos_de_dos_partidos_distintos,nondet):- panquequeable(catherine).
test(amigo1_amigo2_del_mismo_partido_pero_amigo2_es_panquequeable_conOtroAmigo_partido_distinto,nondet):- panquequeable(frank).
test(no_panquequeables,fail):- panquequeable(seth).


%no tiene sentido escribir otro test cuando ambos forman parte de la misma clase de equivalencia

:-end_tests(panquequeables).
