import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';
import 'package:kdksdkskdxd/entities/jugador_estadisticas.dart';

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

  void actualizarEstadisticas(
      {required int goles, required int golesRecibidos}) {
    estadisticas.actualizarEstadisticas(
        goles: goles, golesRecibidos: golesRecibidos);
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
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores600,
    jugadores: misJugadores.sublist(0, 10),
  ),
  Equipo(
    id: 2,
    posicion: 1,
    nombreEquipo: 'FC Barcelona2',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores 800
    jugadores: misJugadores.sublist(11, 15),
  ),
  Equipo(
    id: 3,
    posicion: 1,
    nombreEquipo: 'FC Barcelona3',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores100
    jugadores: misJugadores.sublist(16, 20),
  ),
  Equipo(
    id: 4,
    posicion: 1,
    nombreEquipo: 'FC Barcelona4',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores200
    jugadores: misJugadores.sublist(21, 25),
  ),
  Equipo(
    id: 5,
    posicion: 1,
    nombreEquipo: 'FC Barcelona5',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 6,
    posicion: 1,
    nombreEquipo: 'FC Barcelona6',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 7,
    posicion: 1,
    nombreEquipo: 'FC Barcelona7',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 8,
    posicion: 1,
    nombreEquipo: 'FC Barcelona8',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 9,
    posicion: 1,
    nombreEquipo: 'FC Barcelona9',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: 10,
    posicion: 1,
    nombreEquipo: 'FC Barcelona10',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 11,
    posicion: 1,
    nombreEquipo: 'FC Barcelona11',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 12,
    posicion: 1,
    nombreEquipo: 'FC Barcelona12',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: 13,
    posicion: 1,
    nombreEquipo: 'FC Barcelona13',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
];
