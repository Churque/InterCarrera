import 'package:kdksdkskdxd/entities/equipo.dart';

class Partido {
  final int id;
  final Equipo local;
  final Equipo visita;
  final String cancha;
  // final String hora;
  final DateTime fecha;
  bool live;
  bool finalizado;
  int golesLocal;
  int golesVisita;

  Partido({
    required this.id,
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

  void actualizarGolesEquipo(int equipoID, int goles) {
    if (equipoID == local.id) {
      golesLocal = (golesLocal + goles).clamp(0, double.infinity).toInt();
    } else if (equipoID == visita.id) {
      golesVisita = (golesVisita + goles).clamp(0, double.infinity).toInt();
    }
  }

  @override
  String toString() {
    return 'Partido(id: $id, local: ${local.nombreEquipo}, visita: ${visita.nombreEquipo}, cancha: $cancha, fecha: $fecha, '
        'live: $live, finalizado: $finalizado, golesLocal: $golesLocal, golesVisita: $golesVisita)';
  }
}

List<Partido> misPartidos = [
  Partido(
    id: 1,
    local: misEquipos[0],
    visita: misEquipos[1],
    cancha: 'Cancha N°1',
    //  hora: "13:00",
    //     DateTime(año, mes, día, hora, minuto)
    fecha: DateTime(2023, 12, 12, 0, 23),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 2,
    local: misEquipos[2],
    visita: misEquipos[3],
    cancha: 'Cancha N°1',
    // hora: "13:00",
    fecha: DateTime(2023, 12, 12, 1, 12),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 3,
    local: misEquipos[4],
    visita: misEquipos[5],
    cancha: 'Cancha N°1',
    // hora: "13:00",
    fecha: DateTime(2023, 12, 11, 0, 4),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 4,
    local: misEquipos[6],
    visita: misEquipos[7],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 10, 22, 30),
    live: false,
    finalizado: true,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 5,
    local: misEquipos[7],
    visita: misEquipos[8],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 12, 0, 50),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 6,
    local: misEquipos[9],
    visita: misEquipos[10],
    cancha: 'Cancha N°1',
    //  hora: DateFormat.Hm().format(DateTime(2023, 12, 1, 14, 30)),
    fecha: DateTime(2023, 12, 12, 0, 13),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 7,
    local: misEquipos[11],
    visita: misEquipos[12],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 12, 1, 15),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 8,
    local: misEquipos[11],
    visita: misEquipos[12],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 12, 15, 48),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 9,
    local: misEquipos[11],
    visita: misEquipos[12],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 12, 0, 1),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
  Partido(
    id: 10,
    local: misEquipos[11],
    visita: misEquipos[12],
    cancha: 'Cancha N°1',
    //  hora: "14:30",
    fecha: DateTime(2023, 12, 10, 15, 50),
    live: false,
    finalizado: false,
    golesLocal: 0,
    golesVisita: 0,
  ),
];
