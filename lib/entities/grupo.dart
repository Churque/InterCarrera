import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/servicios/servicios_bd.dart';

final EquiposService equiposService = EquiposService();

class Grupo {
  final List<Equipo> equipos;
  final String nombre;
  final int id;

  Grupo({
    required this.equipos,
    required this.nombre,
    required this.id,
  });
}

Stream<List<Grupo>> obtenerGrupos() async* {
  try {
    // Escuchamos cambios en la colección de equipos
    Stream<QuerySnapshot> equiposStream =
        FirebaseFirestore.instance.collection('equipos').snapshots();

    await for (QuerySnapshot querySnapshot in equiposStream) {
      List<Equipo> equipos = querySnapshot.docs
          .map((doc) => equiposService.convertirEquipo(
              doc)) // Accede a _convertirEquipo a través de equiposService
          .toList();

      int equiposPorGrupo = 4;
      int totalEquipos = equipos.length;
      int totalGrupos = (totalEquipos / equiposPorGrupo).ceil();

      List<Grupo> tusGrupos = [];
      for (int i = 0; i < totalGrupos; i++) {
        int startIndex = i * equiposPorGrupo;
        int endIndex = (i + 1) * equiposPorGrupo;
        tusGrupos.add(Grupo(
          nombre: 'GRUPO ${String.fromCharCode(65 + i)}',
          id: i + 1,
          equipos: equipos.sublist(startIndex, endIndex.clamp(0, totalEquipos)),
        ));
      }

      // Emitimos la lista de grupos cada vez que hay un cambio en la colección
      yield tusGrupos;
    }
  } catch (e) {
    // Maneja los errores según sea necesario
    print('Error al obtener grupos: $e');
    // No uses "throw e" aquí, ya que no puedes lanzar excepciones en un Stream.
    // Si quieres notificar del error, puedes emitir un evento especial o imprimir un mensaje.
  }
}
