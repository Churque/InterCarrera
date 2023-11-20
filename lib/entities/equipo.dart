import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class Equipo {
  final String nombreEquipo;
  final String imagenURL;
  final EquipoEstadisticas estadisticas;
  final List<Jugador> jugadores;

  Equipo({
    required this.nombreEquipo,
    required this.imagenURL,
    required this.estadisticas,
    required this.jugadores,
  });
}
