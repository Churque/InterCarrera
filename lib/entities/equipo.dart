import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class Equipo implements Comparable<Equipo> {
  final int id;
  int posicion;
  final String nombreEquipo;
  final String imagenURL;
  final EquipoEstadisticas estadisticas;
  final List<Jugador> jugadores;

  Equipo({
    required this.id,
    required this.posicion,
    required this.nombreEquipo,
    required this.imagenURL,
    required this.estadisticas,
    required this.jugadores,
  });

  @override
  int compareTo(Equipo other) {
    if (this.estadisticas.pts != other.estadisticas.pts) {
      return other.estadisticas.pts.compareTo(this.estadisticas.pts);
    }

    return this.estadisticas.difGoles.compareTo(other.estadisticas.difGoles);
  }
}

List<Equipo> misEquipos = [
  Equipo(
    id: 1,
    posicion: 1,
    nombreEquipo: 'FC Barcelona1',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: misJugadores1,
  ),
  Equipo(
    id: 2,
    posicion: 1,
    nombreEquipo: 'FC Barcelona2',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: misJugadores2,
  ),
  Equipo(
    id: 3,
    posicion: 1,
    nombreEquipo: 'FC Barcelona3',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 7, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: misJugadores3,
  ),
  Equipo(
    id: 4,
    posicion: 1,
    nombreEquipo: 'FC Barcelona4',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 6, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: misJugadores4,
  ),
  Equipo(
    id: 5,
    posicion: 1,
    nombreEquipo: 'FC Barcelona5',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 5, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 6,
    posicion: 1,
    nombreEquipo: 'FC Barcelona6',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 4, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 7,
    posicion: 1,
    nombreEquipo: 'FC Barcelona7',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 3, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 8,
    posicion: 1,
    nombreEquipo: 'FC Barcelona8',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 2, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 9,
    posicion: 1,
    nombreEquipo: 'FC Barcelona9',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 1, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 10,
    posicion: 1,
    nombreEquipo: 'FC Barcelona10',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 11,
    posicion: 1,
    nombreEquipo: 'FC Barcelona11',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 12,
    posicion: 1,
    nombreEquipo: 'FC Barcelona12',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 13,
    posicion: 1,
    nombreEquipo: 'FC Barcelona13',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
];
