import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/jugador_estadisticas.dart';

class Jugador {
  String id;
  String nombre;
  String equipoID;
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
