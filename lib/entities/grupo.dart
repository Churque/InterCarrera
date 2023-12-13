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

Future<List<Grupo>> obtenerGrupos() async {
  try {
    List<Equipo> equipos = await equiposService.obtenerEquipos();

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

    return tusGrupos;
  } catch (e) {
    // Maneja los errores según sea necesario
    print('Error al obtener grupos: $e');
    throw e; // Puedes decidir si lanzar el error o manejarlo de alguna otra manera
  }
}
