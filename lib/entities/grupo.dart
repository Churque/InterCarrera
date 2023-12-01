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
  Grupo(nombre: 'GRUPO A', id: 1, equipos: misEquipos),
  Grupo(
    nombre: 'GRUPO B',
    id: 1,
    equipos: [
      Equipo(
        posicion: 1,
        nombreEquipo: 'FC Barcelona',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
        jugadores: [],
      ),
    ],
  ),
  Grupo(
    nombre: 'GRUPO C',
    id: 1,
    equipos: [
      Equipo(
        posicion: 1,
        nombreEquipo: 'FC Barcelona',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
        jugadores: [],
      ),
      Equipo(
        posicion: 1,
        nombreEquipo: 'FC Barcelona',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
        jugadores: [],
      ),
      Equipo(
        posicion: 1,
        nombreEquipo: 'FC Barcelona',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
        jugadores: [],
      ),
    ],
  ),
  // Otros grupos
];

// ...

