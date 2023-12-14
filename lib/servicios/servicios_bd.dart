import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class EquiposService {
  final CollectionReference equiposCollection =
      FirebaseFirestore.instance.collection('equipos');
  final CollectionReference partidosCollection =
      FirebaseFirestore.instance.collection('partidos');

  Stream<List<Equipo>> obtenerEquipos() {
    return equiposCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => convertirEquipo(doc)).toList();
    });
  }

  Stream<List<Partido>> obtenerPartidos() {
    return partidosCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => _convertirPartido(doc)).toList();
    });
  }

  Stream<List<Jugador>> obtenerTodosLosJugadores() {
    return equiposCollection.snapshots().map((querySnapshot) {
      List<Jugador> jugadores = [];

      for (var equipoDoc in querySnapshot.docs) {
        var equipo = convertirEquipo(equipoDoc);
        jugadores.addAll(equipo.jugadores);
      }

      return jugadores;
    });
  }

  Partido _convertirPartido(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Partido(
      id: snapshot.id,
      local: Equipo.fromMap(data['local']),
      visita: Equipo.fromMap(data['visita']),
      cancha: data['cancha'],
      fecha: (data['fecha'] as Timestamp).toDate(),
      live: data['live'],
      finalizado: data['finalizado'],
      golesLocal: data['golesLocal'],
      golesVisita: data['golesVisita'],
    );
  }

  Future<void> agregarPartido(Partido partido) {
    return partidosCollection.add(partido.toMap());
  }

  Equipo convertirEquipo(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // Asegúrate de manejar correctamente el caso en que 'estadisticas' o 'jugadores' puedan ser nulos
    EquipoEstadisticas? estadisticas;
    if (data['estadisticas'] != null) {
      estadisticas = EquipoEstadisticas.fromMap(data['estadisticas']);
    }

    List<Jugador> jugadores = [];
    if (data['jugadores'] != null) {
      jugadores =
          List<Jugador>.from(data['jugadores'].map((j) => Jugador.fromMap(j)));
    }

    return Equipo(
      id: data['id'],
      posicion: data['posicion'],
      nombreEquipo: data['nombreEquipo'],
      imagenURL: data['imagenURL'],
      estadisticas: EquipoEstadisticas.fromMap(data['estadisticas'] ??
          {
            'pts': 0,
            'pj': 0,
            'pg': 0,
            'pe': 0,
            'pp': 0,
            'difGoles': '0',
          }), // Usa un valor predeterminado si estadisticas es nulo
      jugadores: jugadores,
    );
  }
}
