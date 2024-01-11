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

  Future<Partido?> obtenerPartidoPorId(String partidoId) async {
    DocumentSnapshot snapshot = await partidosCollection.doc(partidoId).get();
    return snapshot.exists ? _convertirPartido(snapshot) : null;
  }

  // Método para actualizar un partido por su ID
  Future<void> actualizarPartido(
      String partidoId, Map<String, dynamic> datosActualizados) {
    return partidosCollection.doc(partidoId).update(datosActualizados);
  }

  // Método para obtener un jugador por su ID

  // Método para obtener un equipo por su ID
  Future<Equipo?> obtenerEquipoPorId(String equipoId) async {
    DocumentSnapshot snapshot = await equiposCollection.doc(equipoId).get();
    return snapshot.exists ? convertirEquipo(snapshot) : null;
  }

  // Método para actualizar un equipo por su ID
  Future<void> actualizarEquipo(
      String equipoId, Map<String, dynamic> datosActualizados) async {
    try {
      await equiposCollection.doc(equipoId).update(datosActualizados);
    } catch (e) {
      // Si ocurre un error durante la actualización, lanza una excepción Future<void>.
      return Future.error('Error al actualizar el equipo: $e');
    }
  }

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

  Future<void> agregarPartido(Partido partido) async {
    DocumentReference partidoRef =
        await partidosCollection.add(partido.toMap());

    // Actualiza el atributo partidoId con el ID asignado por Firestore
    await partidoRef.update({'partidoId': partidoRef.id});
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
