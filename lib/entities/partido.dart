import 'package:intl/intl.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class Partido {
  final Equipo local;
  final Equipo visita;
  final String cancha;
  // final String hora;
  final DateTime fecha;
  bool live;
  final bool finalizado;
  final int golesLocal;
  final int golesVisita;

  Partido({
    required this.local,
    required this.visita,
    required this.cancha,
    //  required this.hora,
    required this.fecha,
    required this.live,
    required this.finalizado,
    required this.golesLocal,
    required this.golesVisita,
  });
}

List<Partido> misPartidos = [
  Partido(
    local: misEquipos[0],
    visita: misEquipos[1],
    cancha: 'Cancha N°1',
    //  hora: "13:00",
    //     DateTime(año, mes, día, hora, minuto)
    fecha: DateTime(2023, 12, 2, 0, 49),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: misEquipos[2],
    visita: misEquipos[3],
    cancha: 'Cancha N°1',
    // hora: "13:00",
    fecha: DateTime(2023, 12, 2, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: misEquipos[4],
    visita: misEquipos[5],
    cancha: 'Cancha N°1',
    // hora: "13:00",
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: misEquipos[6],
    visita: misEquipos[7],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: misEquipos[7],
    visita: misEquipos[8],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: misEquipos[9],
    visita: misEquipos[10],
    cancha: 'Cancha N°1',
    //  hora: DateFormat.Hm().format(DateTime(2023, 12, 1, 14, 30)),
    fecha: DateTime(2023, 12, 1, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    local: misEquipos[11],
    visita: misEquipos[12],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 2, 14, 30),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
];
