import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class EquiposService {
  final CollectionReference equiposCollection =
      FirebaseFirestore.instance.collection('equipos');

  Stream<List<Equipo>> obtenerEquipos() {
    return equiposCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => convertirEquipo(doc)).toList();
    });
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
