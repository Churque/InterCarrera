import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

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

List<Grupo> tusGrupos = [
  Grupo(nombre: 'GRUPO A', id: 1, equipos: misEquipos.sublist(0, 4)),
  Grupo(nombre: 'GRUPO B', id: 1, equipos: misEquipos.sublist(5, 10)),
  Grupo(
    nombre: 'GRUPO C',
    id: 1,
    equipos: misEquipos.sublist(11, 13),
  ),
  // Otros grupos
];

// ...
