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
% dónde aparece el Principio de Universo Cerrado y justifique su decisión.
% Aparece el principio del Universo Cerrado en "Peter no es candidato del partido Amarillo",
% "El partido violeta no tiene candidatos" y "Finalmente no se presentará en Formosa"
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%%

%Se pide resolver partidoHegemonico/1. Un partido es hegemónico si es favorito en las provincias consideradas 
%importantes, que son Buenos Aires, Córdoba y Santa Fe. 

%Un partido es favorito en una provincia si todos los demás 
%partidos tienen menos o igual intención de voto que el partido ganador.

partidoHegemonico(Partido):- partido(Partido), forall(esFavorito(Partido,Provincia),provinciaImportante(Provincia)).

esFavorito(Partido,Provincia) :-
    partido(Partido),
    voto(Voto1), 
    forall((intencionDeVotoEn(Provincia,Partido,Voto1),
    intencionDeVotoEn(Provincia,_,Voto2)),Voto2=<Voto1).
% intencionDeVotoEn(Provincia, Partido, Porcentaje)

partido(Partido):- postula(Partido,_).

voto(Voto) :- intencionDeVotoEn(_,_,Voto).

provinciaImportante(buenosAires). % amarillo
provinciaImportante(cordoba).
provinciaImportante(santaFe).   %azul


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
test(frank_le_gana_a_jackie_en_santaFe,nondet):- leGanaA(frank, jackie, santaFe).
test(clarie_no_le_gana_a_jackie_en_misiones,fail):- leGanaA(claire, jackie, misiones).
test(frank_le_gana_a_claire_en_tierraDelFuego,nondet):- leGanaA(frank, claire, tierraDelFuego).
test(heather_no_le_gana_a_linda_en_buenosAires,fail):-leGanaA(heather, linda, buenosAires).

:-end_tests(ganadores).
