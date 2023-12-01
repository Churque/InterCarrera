import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';

class Partido {
  final Equipo local;
  final Equipo visita;
  final String cancha;
  final String hora;

  Partido({
    required this.local,
    required this.visita,
    required this.cancha,
    required this.hora,
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
    hora: "15:00",
  ),
];
