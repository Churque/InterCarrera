import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/jugador_estadisticas.dart';

class Jugador {
  int id;
  String nombre;
  int equipoID;
  int numCamiseta;
  JugadorEstadisticas estadisticas;
  String imagenURL;

  Jugador({
    required this.id,
    required this.nombre,
    required this.equipoID,
    required this.numCamiseta,
    required this.imagenURL,
    required this.estadisticas,
  });

  Equipo? get equipo {
    Equipo? encontrado;
    try {
      encontrado = misEquipos.firstWhere((equipo) => equipo.id == equipoID);
    } catch (e) {
      print('Equipo no encontrado para el jugador $nombre');
    }
    return encontrado;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'equipoID': equipoID,
      'numCamiseta': numCamiseta,
      'imagenURL': imagenURL,
      'estadisticas': estadisticas.toMap(),
    };
  }

  factory Jugador.fromMap(Map<String, dynamic> map) {
    return Jugador(
      id: map['id'],
      nombre: map['nombre'],
      equipoID: map['equipoID'],
      numCamiseta: map['numCamiseta'],
      imagenURL: map['imagenURL'],
      estadisticas: JugadorEstadisticas.fromMap(map['estadisticas']),
    );
  }
}

List<Jugador> obtenerTopGoleadores(List<Jugador> jugadores, int cantidad) {
  jugadores
      .sort((a, b) => b.estadisticas.goles.compareTo(a.estadisticas.goles));
  print('Mis Jugadores: $jugadores');
  return jugadores.take(cantidad).toList();
}

List<Jugador> obtenerTopAsistidores(List<Jugador> jugadores, int cantidad) {
  jugadores.sort((a, b) =>
      b.estadisticas.asistencias.compareTo(a.estadisticas.asistencias));

  return jugadores.take(cantidad).toList();
}

List<Jugador> obtenerTopGoleadoresYAsistidores(
    List<Jugador> jugadores, int cantidad) {
  jugadores.sort((a, b) {
    final totalA = a.estadisticas.goles + a.estadisticas.asistencias;
    final totalB = b.estadisticas.goles + b.estadisticas.asistencias;
    return totalB.compareTo(totalA);
  });
  return jugadores.take(cantidad).toList();
}

List<Jugador> misJugadores = [
  Jugador(
      id: 1,
      equipoID: 1,
      nombre: 'El 1',
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 0,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 2,
      nombre: 'EL2',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 3,
      nombre: 'EL3',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 2,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 4,
      nombre: 'EL4',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 5,
      nombre: 'EL6',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 4,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 6,
      equipoID: 1,
      nombre: 'Lionel Messi',
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 7,
      nombre: 'Arturo Vidal',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 11,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 8,
      nombre: 'Lionel Messi',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 12,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 9,
      nombre: 'Lionel Messi',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 13,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 10,
      nombre: 'Lionel Messi',
      equipoID: 1,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 14,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 11,
      equipoID: 2,
      nombre: 'Lionel Messi',
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 14,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 12,
      nombre: 'Arturo Vidal',
      equipoID: 2,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 15,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 13,
      nombre: 'Lionel Messi',
      equipoID: 2,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 16,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 14,
      nombre: 'Lionel Messi',
      equipoID: 2,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 17,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 15,
      nombre: 'Lionel Messi',
      equipoID: 2,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 18,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 16,
      equipoID: 3,
      nombre: 'Lionel Messi',
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 20,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 17,
      nombre: 'Arturo Vidal',
      equipoID: 3,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 21,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 18,
      nombre: 'Lionel Messi',
      equipoID: 3,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 22,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 19,
      nombre: 'Lionel Messi',
      equipoID: 3,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 23,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 20,
      nombre: 'Lionel Messi',
      equipoID: 3,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 24,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 21,
      equipoID: 4,
      nombre: 'Lionel Messi',
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 25,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 22,
      nombre: 'Arturo Vidal',
      equipoID: 4,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 26,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 23,
      nombre: 'Lionel Messi',
      equipoID: 4,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 27,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 24,
      nombre: 'Lionel Messi',
      equipoID: 4,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 28,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 25,
      nombre: 'Lionel Messi',
      equipoID: 4,
      estadisticas: JugadorEstadisticas(goles: 1, asistencias: 1),
      numCamiseta: 29,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
];
