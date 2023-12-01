import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class Equipo {
  final int posicion;
  final String nombreEquipo;
  final String imagenURL;
  final EquipoEstadisticas estadisticas;
  final List<Jugador> jugadores;

  Equipo({
    required this.posicion,
    required this.nombreEquipo,
    required this.imagenURL,
    required this.estadisticas,
    required this.jugadores,
  });
}

List<Equipo> misEquipos = [
  Equipo(
    posicion: 1,
    nombreEquipo: 'FC Barcelona',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    posicion: 1,
    nombreEquipo: 'FC Barcelona',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    posicion: 1,
    nombreEquipo: 'FC Barcelona',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    posicion: 1,
    nombreEquipo: 'FC Barcelona',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
];
