import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';

class Jugador {
  final String nombre;
  final Equipo equipo;
  final int numCamiseta;
  final int goles;
  final int asistencias;
  final String imagenURL;

  Jugador({
    required this.nombre,
    required this.equipo,
    required this.numCamiseta,
    required this.goles,
    required this.asistencias,
    required this.imagenURL,
  });
}

List<Jugador> misJugadores = [
  Jugador(
      nombre: 'Lionel Messi',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'PESSI',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 50,
      asistencias: 12,
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      nombre: 'Arturo Vidal',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'Tengo',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 7,
      asistencias: 11,
      numCamiseta: 5,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      nombre: 'Lionel Messi',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'FC XD FUNCIONA?',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 6,
      asistencias: 30,
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      nombre: 'Lionel Messi',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'FC XD FUNCIONA?',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 2,
      asistencias: 3,
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      nombre: 'Lionel Messi',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'FC XD FUNCIONA?',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 6,
      asistencias: 6,
      numCamiseta: 6,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
];

List<Jugador> obtenerTopGoleadores(List<Jugador> jugadores, int cantidad) {
  jugadores.sort((a, b) => b.goles.compareTo(a.goles));
  return jugadores.take(cantidad).toList();
}

List<Jugador> obtenerTopAsistidores(List<Jugador> jugadores, int cantidad) {
  jugadores.sort((a, b) => b.asistencias.compareTo(a.asistencias));
  return jugadores.take(cantidad).toList();
}

List<Jugador> obtenerTopGoleadoresYAsistidores(
    List<Jugador> jugadores, int cantidad) {
  jugadores.sort((a, b) {
    final totalA = a.goles + a.asistencias;
    final totalB = b.goles + b.asistencias;
    return totalB.compareTo(totalA);
  });
  return jugadores.take(cantidad).toList();
}

// Luego, puedes usar estas funciones así:
List<Jugador> topGoleadores = obtenerTopGoleadores(misJugadores, 3);
List<Jugador> topAsistidores = obtenerTopAsistidores(misJugadores, 3);
List<Jugador> topGoleadoresYAsistidores =
    obtenerTopGoleadoresYAsistidores(misJugadores, 3);

// Ahora, puedes usar estos listados en tu código.

