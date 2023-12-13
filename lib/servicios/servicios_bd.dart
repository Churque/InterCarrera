import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class EquiposService {
  final CollectionReference equiposCollection =
      FirebaseFirestore.instance.collection('equipos');

  Future<List<Equipo>> obtenerEquipos() async {
    try {
      QuerySnapshot querySnapshot = await equiposCollection.get();

      List<Equipo> equipos =
          querySnapshot.docs.map((doc) => _convertirEquipo(doc)).toList();

      return equipos;
    } catch (e) {
      throw Exception('Error al obtener la colección de equipos: $e');
    }
  }

  Equipo _convertirEquipo(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Equipo(
      id: data['id'],
      posicion: data['posicion'],
      nombreEquipo: data['nombreEquipo'],
      imagenURL: data['imagenURL'],
      estadisticas: EquipoEstadisticas.fromMap(data['estadisticas']),
      jugadores:
          List<Jugador>.from(data['jugadores'].map((j) => Jugador.fromMap(j))),
    );
  }
}
