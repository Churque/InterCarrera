import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';

class Partido {
  final Equipo local;
  final Equipo visita;
  final String cancha;
  final String hora;
  final DateTime fecha;
  final bool live;
  final bool finalizado;
  final int golesLocal;
  final int golesVisita;

  Partido({
    required this.local,
    required this.visita,
    required this.cancha,
    required this.hora,
    required this.fecha,
    required this.live,
    required this.finalizado,
    required this.golesLocal,
    required this.golesVisita,
  });
}

List<Partido> misPartidos = [
  Partido(
    local: Equipo(
      posicion: 1,
      nombreEquipo: 'VILAREAL CF',
      imagenURL:
          'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    visita: Equipo(
      posicion: 2,
      nombreEquipo: 'GIRONA FC',
      imagenURL:
          'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [],
    ),
    cancha: 'Cancha N°1',
    hora: "13:00",
    //      DateTime(año, mes, día, hora, minuto)
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: Equipo(
      posicion: 1,
      nombreEquipo: 'VILAREAL CF',
      imagenURL:
          'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    visita: Equipo(
      posicion: 2,
      nombreEquipo: 'GIRONA FC',
      imagenURL:
          'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    cancha: 'Cancha N°1',
    hora: "13:00",
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: Equipo(
      posicion: 1,
      nombreEquipo: 'VILAREAL CF',
      imagenURL:
          'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    visita: Equipo(
      posicion: 2,
      nombreEquipo: 'GIRONA FC',
      imagenURL:
          'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    cancha: 'Cancha N°1',
    hora: "13:00",
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: Equipo(
      posicion: 1,
      nombreEquipo: 'VILAREAL CF',
      imagenURL:
          'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    visita: Equipo(
      posicion: 2,
      nombreEquipo: 'GIRONA FC',
      imagenURL:
          'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png',
      estadisticas: EquipoEstadisticas(
          pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
      jugadores: [], // Agrega jugadores
    ),
    cancha: 'Cancha N°1',
    hora: "14:30",
    fecha: DateTime(2023, 11, 30, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
];
