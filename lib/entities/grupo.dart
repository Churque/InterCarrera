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
    Stream<QuerySnapshot> equiposStream =
        FirebaseFirestore.instance.collection('equipos').snapshots();

    await for (QuerySnapshot querySnapshot in equiposStream) {
      List<Equipo> equipos = querySnapshot.docs
          .map((doc) => equiposService.convertirEquipo(doc))
          .toList();

      // Ordena los equipos por puntos y luego por diferencia de goles
      equipos.sort((a, b) {
        if (a.estadisticas.pts != b.estadisticas.pts) {
          return b.estadisticas.pts - a.estadisticas.pts;
        } else {
          return b.estadisticas.difGoles.compareTo(a.estadisticas.difGoles);
        }
      });

      int equiposPorGrupo = 4;
      int totalEquipos = equipos.length;
      int totalGrupos = (totalEquipos / equiposPorGrupo).ceil();

      List<Grupo> tusGrupos = [];
      for (int i = 0; i < totalGrupos; i++) {
        int startIndex = i * equiposPorGrupo;
        int endIndex = (i + 1) * equiposPorGrupo;
        tusGrupos.add(Grupo(
          nombre: 'GRUPO ${String.fromCharCode(65 + i)}',
          id: i + 1, // Esto es un int, no necesitas convertirlo a String
          equipos: equipos.sublist(startIndex, endIndex.clamp(0, totalEquipos)),
        ));
      }

      yield tusGrupos;
    }
  } catch (e) {
    print('Error al obtener grupos: $e');
  }
}
