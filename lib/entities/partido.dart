import 'package:kdksdkskdxd/entities/equipo.dart';

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
