import 'dart:math';

import 'package:kdksdkskdxd/entities/equipo.dart';

class Jugador {
  final int id;
  final String nombre;
  final int equipoID;
  final int numCamiseta;
  final int goles;
  final int asistencias;
  final String imagenURL;

  Jugador({
    required this.id,
    required this.nombre,
    required this.equipoID,
    required this.numCamiseta,
    required this.goles,
    required this.asistencias,
    required this.imagenURL,
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
}

List<Jugador> misJugadores = [
  Jugador(
      id: 1,
      equipoID: 1,
      nombre: 'Lionel Messi',
      goles: 50,
      asistencias: 12,
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 2,
      nombre: 'Arturo Vidal',
      equipoID: 1,
      goles: 7,
      asistencias: 11,
      numCamiseta: 5,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 3,
      nombre: 'Lionel Messi',
      equipoID: 1,
      goles: 6,
      asistencias: 30,
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 4,
      nombre: 'Lionel Messi',
      equipoID: 1,
      goles: 2,
      asistencias: 3,
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 5,
      nombre: 'Lionel Messi',
      equipoID: 1,
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

List<Jugador> misJugadores1 = List.generate(5, (index) {
  return Jugador(
    id: 1,
    nombre: 'Jugador_${index + 1}',
    equipoID: 1,
    goles: Random().nextInt(50) + 1,
    asistencias: Random().nextInt(20) + 1,
    numCamiseta: Random().nextInt(99) + 1,
    imagenURL:
        'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png',
  );
});

List<Jugador> misJugadores2 = List.generate(5, (index) {
  return Jugador(
    id: 1,
    equipoID: 2,
    nombre: 'Jugador_${index + 6}',
    goles: Random().nextInt(50) + 1,
    asistencias: Random().nextInt(20) + 1,
    numCamiseta: Random().nextInt(99) + 1,
    imagenURL:
        'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png',
  );
});

List<Jugador> misJugadores3 = List.generate(5, (index) {
  return Jugador(
    id: index + 1, // Usar el índice para asegurar IDs distintos
    equipoID: 2,
    nombre: 'Jugador_${index + 6}',
    goles: Random().nextInt(50) + 1,
    asistencias: Random().nextInt(20) + 1,
    numCamiseta: Random().nextInt(99) + 1,
    imagenURL:
        'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png',
  );
});

List<Jugador> misJugadores4 = List.generate(5, (index) {
  return Jugador(
    id: 3,
    equipoID: 4,
    nombre: 'Jugador_${index + 16}',
    goles: Random().nextInt(50) + 1,
    asistencias: Random().nextInt(20) + 1,
    numCamiseta: Random().nextInt(99) + 1,
    imagenURL:
        'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png',
  );
});

List<Jugador> misJugadores100 = [
  Jugador(
      id: 1,
      equipoID: 3,
      nombre: 'Lionel Messi',
      goles: 50,
      asistencias: 12,
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 2,
      nombre: 'Arturo Vidal',
      equipoID: 3,
      goles: 7,
      asistencias: 11,
      numCamiseta: 5,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 3,
      nombre: 'Lionel Messi',
      equipoID: 3,
      goles: 6,
      asistencias: 30,
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 4,
      nombre: 'Lionel Messi',
      equipoID: 3,
      goles: 2,
      asistencias: 3,
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 5,
      nombre: 'Lionel Messi',
      equipoID: 3,
      goles: 6,
      asistencias: 6,
      numCamiseta: 6,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
];

List<Jugador> misJugadores200 = [
  Jugador(
      id: 11,
      equipoID: 4,
      nombre: 'Lionel Messi',
      goles: 50,
      asistencias: 12,
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 12,
      nombre: 'Arturo Vidal',
      equipoID: 4,
      goles: 7,
      asistencias: 11,
      numCamiseta: 5,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 13,
      nombre: 'Lionel Messi',
      equipoID: 4,
      goles: 6,
      asistencias: 30,
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 14,
      nombre: 'Lionel Messi',
      equipoID: 4,
      goles: 2,
      asistencias: 3,
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 15,
      nombre: 'Lionel Messi',
      equipoID: 4,
      goles: 6,
      asistencias: 6,
      numCamiseta: 6,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
];

List<Jugador> misJugadores600 = [
  Jugador(
      id: 111,
      equipoID: 1,
      nombre: 'Lionel Messi',
      goles: 50,
      asistencias: 12,
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 1222,
      nombre: 'Arturo Vidal',
      equipoID: 1,
      goles: 7,
      asistencias: 11,
      numCamiseta: 5,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 11333,
      nombre: 'Lionel Messi',
      equipoID: 1,
      goles: 6,
      asistencias: 30,
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 144,
      nombre: 'Lionel Messi',
      equipoID: 1,
      goles: 2,
      asistencias: 3,
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 155,
      nombre: 'Lionel Messi',
      equipoID: 1,
      goles: 6,
      asistencias: 6,
      numCamiseta: 6,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
];

List<Jugador> misJugadores800 = [
  Jugador(
      id: 124,
      equipoID: 2,
      nombre: 'Lionel Messi',
      goles: 50,
      asistencias: 12,
      numCamiseta: 10,
      imagenURL:
          'https://jobs4football.com/wp-content/uploads/2022/12/b7f9f682d8c4930b36c3f6ac4e4cbc6bLionel-Messi.png'),
  Jugador(
      id: 200,
      nombre: 'Arturo Vidal',
      equipoID: 2,
      goles: 7,
      asistencias: 11,
      numCamiseta: 5,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 300,
      nombre: 'Lionel Messi',
      equipoID: 2,
      goles: 6,
      asistencias: 30,
      numCamiseta: 1,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 40,
      nombre: 'Lionel Messi',
      equipoID: 2,
      goles: 2,
      asistencias: 3,
      numCamiseta: 3,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
  Jugador(
      id: 50,
      nombre: 'Lionel Messi',
      equipoID: 2,
      goles: 6,
      asistencias: 6,
      numCamiseta: 6,
      imagenURL: 'https://cdn.soccerwiki.org/images/player/78694.png'),
];
