import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class Equipo implements Comparable<Equipo> {
  String id;
  int posicion;
  String nombreEquipo;
  String imagenURL;
  EquipoEstadisticas estadisticas;
  List<Jugador> jugadores;

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'posicion': posicion,
      'nombreEquipo': nombreEquipo,
      'imagenURL': imagenURL,
      'estadisticas': estadisticas.toMap(),
      'jugadores': jugadores.map((jugador) => jugador.toMap()).toList(),
    };
  }

  // Método para crear una instancia de Equipo desde un mapa
  factory Equipo.fromMap(Map<String, dynamic> map) {
    return Equipo(
      id: map['id'],
      posicion: map['posicion'],
      nombreEquipo: map['nombreEquipo'],
      imagenURL: map['imagenURL'],
      estadisticas: EquipoEstadisticas.fromMap(map['estadisticas']),
      jugadores: List<Jugador>.from(
        map['jugadores'].map((j) => Jugador.fromMap(j)),
      ),
    );
  }

  void agregarJugador(Jugador jugador) {
    jugadores.add(jugador);
  }
}

List<Equipo> misEquipos = [
  Equipo(
    id: '1',
    posicion: 1,
    nombreEquipo: 'FC Barcelona1',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores600,
    jugadores: [],
  ),
  Equipo(
    id: '2',
    posicion: 1,
    nombreEquipo: 'FC Barcelona2',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores 800
    jugadores: [],
  ),
  Equipo(
    id: '3',
    posicion: 1,
    nombreEquipo: 'FC Barcelona3',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores100
    jugadores: [],
  ),
  Equipo(
    id: '4',
    posicion: 1,
    nombreEquipo: 'FC Barcelona4',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    //misJugadores200
    jugadores: [],
  ),
  Equipo(
    id: '5',
    posicion: 1,
    nombreEquipo: 'FC Barcelona5',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '6',
    posicion: 1,
    nombreEquipo: 'FC Barcelona6',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '7',
    posicion: 1,
    nombreEquipo: 'FC Barcelona7',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '8',
    posicion: 1,
    nombreEquipo: 'FC Barcelona8',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '9',
    posicion: 1,
    nombreEquipo: 'FC Barcelona9',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+6'),
    jugadores: [],
  ),
  Equipo(
    id: '10',
    posicion: 1,
    nombreEquipo: 'FC Barcelona10',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '11',
    posicion: 1,
    nombreEquipo: 'FC Barcelona11',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '12',
    posicion: 1,
    nombreEquipo: 'FC Barcelona12',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
  Equipo(
    id: '13',
    posicion: 1,
    nombreEquipo: 'FC Barcelona13',
    imagenURL:
        'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
    estadisticas:
        EquipoEstadisticas(pts: 0, pj: 0, pg: 0, pe: 0, pp: 0, difGoles: '+0'),
    jugadores: [],
  ),
];
